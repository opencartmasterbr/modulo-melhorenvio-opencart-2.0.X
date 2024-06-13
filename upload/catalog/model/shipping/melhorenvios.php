<?php
class ModelShippingMelhorenvios extends Model {
	function getQuote($address) {
		$this->load->language('shipping/melhorenvios');

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "zone_to_geo_zone WHERE geo_zone_id = '" . (int)$this->config->get('melhorenvios_geo_zone_id') . "' AND country_id = '" . (int)$address['country_id'] . "' AND (zone_id = '" . (int)$address['zone_id'] . "' OR zone_id = '0')");

		if (!$this->config->get('melhorenvios_geo_zone_id')) {
			$status = true;
		} elseif ($query->num_rows) {
			$status = true;
		} else {
			$status = false;
		}
		
		if ($this->config->get('melhorenvios_type') == 0) {
            $url    = 'https://melhorenvio.com.br';
            $token  = $this->config->get('melhorenvios_token');    
        } else {
            $url    = 'https://sandbox.melhorenvio.com.br';
            $token  = $this->config->get('melhorenvios_token');        
        }
		$tkn = "T3BlbkNhcnQgTWFzdGVyIChzdXBvcnRlQG9wZW5jYXJ0bWFzdGVyLmNvbS5icik=";
		$header = array('Accept: application/json', 'Content-Type: application/json;charset=UTF-8', 'Authorization: Bearer '. $token, 'User-Agent: ' . base64_decode($tkn) );

        $prod = array();
		
		if($this->config->get('melhorenvios_security') == 1) {
          $seguro = true;
          } else {
          $seguro = false;
          }

		foreach ($this->cart->getProducts() as $product) {
			if ($product['shipping']) {
				$prod[] = array('id' => $product['product_id'],  'width' => number_format($this->length->convert($product['width'], $product['length_class_id'], $this->config->get('config_length_class_id')), 1), 'height' => number_format($this->length->convert($product['height'], $product['length_class_id'], $this->config->get('config_length_class_id')), 1), 'length' => number_format($this->length->convert($product['length'] , $product['length_class_id'], $this->config->get('config_length_class_id')), 1),'weight' => number_format($product['weight2'], 1), 'insurance_value' => $seguro ? 0 : number_format($product['price'], 2, '.', ''), 'quantity' => (int)$product['quantity']);
			}
		}
		
		$postcode = preg_replace("/[^0-9]/", "", $address['postcode']);
		$postcode2 = preg_replace("/[^0-9]/", "", $this->config->get('melhorenvios_postcode'));
		
		if($this->config->get('melhorenvios_ar') == 0) {
			$ar = false;
		} else {
			$ar = true;
		}
		
		if($this->config->get('melhorenvios_mp') == 0) {
			$mp = false;
		} else {
			$mp = true;
		}
		
		if($this->config->get('melhorenvios_col') == 0) {
			$col = false;
		} else {
			$col = true;
		}
		
		$variavel = $this->config->get('melhorenvios_cargo');
        $contar = count($variavel);
        $novo = '';
        for($i = 0; $i < $contar; $i++) {
        $novo .= (int)$variavel[$i].',';
        }
		
		$json_convert  = json_encode(array('from' => array('postal_code' => $postcode2), 'to' => array('postal_code' => $postcode), 'products' => $prod, 'options' => array('receipt' => $ar,'own_hand' => $mp, 'collect' => $col),'services' => $novo));
		
		$this->log->write('Teste '. $json_convert);
		
		if($this->config->get('melhorenvios_title') !='') {
			$titulo = $this->config->get('melhorenvios_title');
		} else {
			$titulo = $this->language->get('text_title');
		}
		
		$getquote = $this->getCotation($url, $json_convert, $header);
		
		if (array_key_exists("message", $getquote)) {
		$at = false;
		$this->log->write('ERROR: MELHOR ENVIO API - '. $getquote['message']);
		} else {
		$at = true;
		if ($this->config->get('melhorenvios_debug')) {	
		$this->log->write('PAYLOAD: MELHOR ENVIO API - '. json_encode($header) .' - '. $json_convert);
		}
		}
		
		$cargo = $this->config->get('melhorenvios_cargo');
		
		$quote_data = array();
		
		$cost = 0;
		
        if ($status && $at) {
		foreach($getquote as $key => $value) {
        if (!array_key_exists("error", $value) && in_array($value['id'], $cargo)) {
			if ($this->config->get('melhorenvios_days') > 0) {
			$dias = $value['delivery_time'] + $this->config->get('melhorenvios_days');
			} else {
			$dias = $value['delivery_time'];	
			}
			if($dias <=1 ) {
				$tdias = ' dia';
			} else {
				$tdias = ' dias';
			}
			
			$valorad = str_replace(',', '.', $this->config->get('melhorenvios_adic'));
			if ($this->config->get('melhorenvios_adic') > 0 && $this->config->get('melhorenvios_tipo') == 1 ) {
			$st = $value['price'];
		    $st2 = ($valorad/100)* $st;
			$cost = $value['price'] + $st2;	
			} else if ($this->config->get('melhorenvios_adic') > 0 && $this->config->get('melhorenvios_tipo') == 0 ) {
			$cost = $value['price'] + $valorad;	
			} else {
			$cost = $value['price'];
			}

		$quote_data[$value['id']] = array(
				'code'         => 'melhorenvios.'.$value['id'],
				'title'        => $value['company']['name'] . ' '.$value['name'] ,
				'cost'         => $cost,
				'tax_class_id' => $this->config->get('melhorenvios_tax_class_id'),
				'text'         => $this->currency->format($this->tax->calculate($cost, $this->config->get('melhorenvios_tax_class_id'), $this->config->get('config_tax'))) . ' <b>entrega em até <span style="color:#019432;">'. $dias .'</span>'. $tdias.'</b>'
			);
		}
		}
		}
		
		$method_data = array();

		if ($quote_data) {
			$method_data = array(
				'code'       => 'melhorenvios',
				'title'      => $titulo,
				'quote'      => $quote_data,
				'sort_order' => $this->config->get('melhorenvios_sort_order'),
				'error'      => false
			);
		}

		return $method_data;
	}
	
  public function getCotation($url, $json_convert, $header) {
  $soap_do = curl_init();
  curl_setopt($soap_do, CURLOPT_URL, $url .'/api/v2/me/shipment/calculate/');
  curl_setopt($soap_do, CURLOPT_CONNECTTIMEOUT, 10);
  curl_setopt($soap_do, CURLOPT_TIMEOUT,        10);
  curl_setopt($soap_do, CURLOPT_CUSTOMREQUEST, "POST");
  curl_setopt($soap_do, CURLOPT_RETURNTRANSFER, true );
  curl_setopt($soap_do, CURLOPT_SSL_VERIFYPEER, false);
  curl_setopt($soap_do, CURLOPT_SSL_VERIFYHOST, false);
  curl_setopt($soap_do, CURLOPT_POST,           true );
  curl_setopt($soap_do, CURLOPT_POSTFIELDS,     $json_convert);
  curl_setopt($soap_do, CURLOPT_HTTPHEADER,     $header);
  $response = curl_exec($soap_do); 
  curl_close($soap_do);
  
  $retornou = json_decode($response, true);
  return   $retornou;
  }
  		
}