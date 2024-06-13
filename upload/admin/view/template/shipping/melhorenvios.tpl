<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-melhorenvios" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">
    <?php if ($error_warning) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <?php if($atual) { ?>
	<div class="alert alert-info"><i class="fa fa-exclamation-circle"></i> Existe uma nova versão do módulo <b><?php echo $module_name; ?></b> faça o download <a href="<?php echo $murl; ?>" target="_blank">AQUI</a> <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
	<?php } ?>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-melhorenvios" class="form-horizontal">
				 <ul class="nav nav-tabs" id="tabs">
            <li class="active"><a href="#tab-general" data-toggle="tab"><?php echo $tab_general; ?></a></li>
            <li><a href="#tab-help" data-toggle="tab"><?php echo $tab_help; ?></a></li>
          </ul>
	 <div class="tab-content">

    <div class="tab-pane active" id="tab-general">
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-title"><?php echo $entry_title; ?></label>
            <div class="col-sm-10">
              <input type="text" name="melhorenvios_title" value="<?php echo $melhorenvios_title; ?>" placeholder="<?php echo $entry_title; ?>" id="input-title" class="form-control" />
				<?php if($error_titulo) { ?>
				<div class="text-danger"><?php echo $error_titulo; ?></div>
				<?php } ?>
            </div>
          </div>
		<div class="form-group">
            <label class="col-sm-2 control-label" for="input-type"><?php echo $entry_type; ?></label>
            <div class="col-sm-10">
              <select name="melhorenvios_type" id="input-type" class="form-control">
                <?php if ($melhorenvios_type) { ?>
                <option value="1" selected="selected"><?php echo $text_pro; ?></option>
                <option value="0"><?php echo $text_homo; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_pro; ?></option>
                <option value="0" selected="selected"><?php echo $text_homo; ?></option>
                <?php } ?>
              </select>
            </div>
          </div>
		 <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-token"><?php echo $entry_token; ?></label>
            <div class="col-sm-10">
              <input type="text" name="melhorenvios_token" value="<?php echo $melhorenvios_token; ?>" placeholder="<?php echo $entry_token; ?>" id="input-token" class="form-control" />
			<?php if($error_token) { ?>
				<div class="text-danger"><?php echo $error_token; ?></div>
			<?php } ?>
            </div>
          </div>
		<div class="form-group">
            <label class="col-sm-2 control-label" for="input-tde"><?php echo $entry_tde; ?></label>
            <div class="col-sm-10">
                <label class="radio-inline">
                <?php if ($melhorenvios_tde) { ?>
                <input type="radio" name="melhorenvios_tde" value="1" checked="checked" />
                <?php echo $text_nota; ?>
                <?php } else { ?>
                <input type="radio" name="melhorenvios_tde" value="1" />
                <?php echo $text_nota; ?>
                <?php } ?>
              </label>
              <label class="radio-inline">
                <?php if (!$melhorenvios_tde) { ?>
                <input type="radio" name="melhorenvios_tde" value="0" checked="checked" />
                <?php echo $text_decla; ?>
                <?php } else { ?>
                <input type="radio" name="melhorenvios_tde" value="0" />
                <?php echo $text_decla; ?>
                <?php } ?>
              </label>
            </div>
          </div>
		 <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-doc"><?php echo $entry_doc; ?></label>
            <div class="col-sm-10">
              <input type="text" name="melhorenvios_doc" value="<?php echo $melhorenvios_doc; ?>" placeholder="<?php echo $entry_doc; ?>" id="input-doc" class="form-control" />
			<?php if($error_doc) { ?>
				<div class="text-danger"><?php echo $error_doc; ?></div>
			<?php } ?>
            </div>
          </div>
		 <div class="form-group">
            <label class="col-sm-2 control-label" for="input-ie"><?php echo $entry_ie; ?></label>
            <div class="col-sm-10">
              <input type="text" name="melhorenvios_ie" value="<?php echo $melhorenvios_ie; ?>" placeholder="<?php echo $entry_ie; ?>" id="input-ie" class="form-control" />
            </div>
          </div>
	      <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-addr"><?php echo $entry_address; ?></label>
            <div class="col-sm-10">
              <input type="text" name="melhorenvios_ad" value="<?php echo $melhorenvios_ad; ?>" placeholder="<?php echo $entry_address; ?>" id="input-addr" class="form-control" />
			 <?php if ($error_addr) { ?>
                    <div class="text-danger"><?php echo $error_addr; ?></div>
             <?php } ?>
			 <p><?php echo $text_ad; ?></p>
            </div>
          </div>
		 <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-postcode"><?php echo $entry_postcode; ?></label>
            <div class="col-sm-10">
              <input type="text" name="melhorenvios_postcode" value="<?php echo $melhorenvios_postcode; ?>" placeholder="<?php echo $entry_postcode; ?>" id="input-postcode" class="form-control" />
			    <?php if($error_cep) { ?>
				<div class="text-danger"><?php echo $error_cep; ?></div>
				<?php } ?>
            </div>
          </div>
			  <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-cargo"><?php echo $entry_cargo; ?></label>
             <div class="col-sm-10">
               <div class="well well-sm" style="height: 150px; overflow: auto;">
                      <?php foreach ($cargo as $carg) { ?>
                      <div class="checkbox">
                        <label>
                          <?php if (in_array($carg['id'], $melhorenvios_cargo)) { ?>
                          <input type="checkbox" name="melhorenvios_cargo[]" id="<?php echo $carg['id']; ?>" value="<?php echo $carg['id']; ?>" checked="checked" />
                          <b><?php echo $carg['company']['name']; ?> : </b><?php echo $carg['name']; ?>
                          <?php } else { ?>
                          <input type="checkbox" name="melhorenvios_cargo[]" id="<?php echo $carg['id']; ?>" value="<?php echo $carg['id']; ?>" />
                          <b><?php echo $carg['company']['name']; ?> : </b><?php echo $carg['name']; ?>
                          <?php } ?>
                        </label>
                      </div>
                      <?php } ?>
                 </div>
				 <?php if ($error_cargos) { ?>
                    <div class="text-danger"><?php echo $error_cargos; ?></div>
                 <?php } ?>
             </div>
          </div>
	      <div class="form-group required" id="agencia">
            <label class="col-sm-2 control-label" for="input-agency"><?php echo $entry_agency; ?></label>
            <div class="col-sm-10">
              <select name="melhorenvios_agency" id="input-agency" class="form-control">
				<option value=""><?php echo $text_none; ?></option>
			    <?php foreach ($agencies as $agencia) { ?>
				  <?php if(is_array($agencies)) { ?>
				 <?php  if($melhorenvios_agency == $agencia['id']) { ?>
				  <option value="<?php echo $agencia['id'] ;?>" selected="selected"><?php echo $agencia['name'] . ' - ' . $agencia['company_name'] . ' - CEP: ' . $agencia['address']['postal_code']; ?></option> 
				  <?php } else { ?>
				  <option value="<?php echo $agencia['id'] ;?>"><?php echo $agencia['name'] . ' - ' . $agencia['company_name'] . ' - CEP: ' . $agencia['address']['postal_code']; ?></option>
				  <?php } ?>
				<?php } ?>
				<?php } ?>
              </select>
				 <?php if ($error_agencys) { ?>
                    <div class="text-danger"><?php echo $error_agencys; ?></div>
                 <?php } ?>
            </div>
          </div>
	      <div class="form-group required" id="agencia2">
            <label class="col-sm-2 control-label" for="input-agency2"><?php echo $entry_agency2; ?></label>
            <div class="col-sm-10">
              <select name="melhorenvios_agency2" id="input-agency2" class="form-control">
				<option value=""><?php echo $text_none; ?></option>
				<?php if(is_array($agencies2)) { ?>
			    <?php foreach ($agencies2 as $agencia2) { ?>
				 <?php  if($melhorenvios_agency2 == $agencia2['id']) { ?>
				  <option value="<?php echo $agencia['id'] ;?>" selected="selected"><?php echo $agencia2['name'] . ' - ' . $agencia2['company_name'] . ' - CEP: ' . $agencia2['address']['postal_code']; ?></option> 
				  <?php } else { ?>
				  <option value="<?php echo $agencia2['id'] ;?>"><?php echo $agencia2['name'] . ' - ' . $agencia2['company_name'] . ' - CEP: ' . $agencia2['address']['postal_code']; ?></option>
				  <?php } ?>
				<?php } ?>
				<?php } ?>
              </select>
				 <?php if ($error_agencys2) { ?>
                    <div class="text-danger"><?php echo $error_agencys2; ?></div>
                 <?php } ?>
            </div>
          </div>	
		<div class="form-group">
            <label class="col-sm-2 control-label" for="input-col"><?php echo $entry_col; ?></label>
            <div class="col-sm-10">
                <label class="radio-inline">
                <?php if ($melhorenvios_col) { ?>
                <input type="radio" name="melhorenvios_col" value="1" checked="checked" />
                <?php echo $text_yes; ?>
                <?php } else { ?>
                <input type="radio" name="melhorenvios_col" value="1" />
                <?php echo $text_yes; ?>
                <?php } ?>
              </label>
              <label class="radio-inline">
                <?php if (!$melhorenvios_col) { ?>
                <input type="radio" name="melhorenvios_col" value="0" checked="checked" />
                <?php echo $text_no; ?>
                <?php } else { ?>
                <input type="radio" name="melhorenvios_col" value="0" />
                <?php echo $text_no; ?>
                <?php } ?>
              </label>
            </div>
          </div>	
		<div class="form-group">
            <label class="col-sm-2 control-label" for="input-ar"><?php echo $entry_ar; ?></label>
            <div class="col-sm-10">
                <label class="radio-inline">
                <?php if ($melhorenvios_ar) { ?>
                <input type="radio" name="melhorenvios_ar" value="1" checked="checked" />
                <?php echo $text_yes; ?>
                <?php } else { ?>
                <input type="radio" name="melhorenvios_ar" value="1" />
                <?php echo $text_yes; ?>
                <?php } ?>
              </label>
              <label class="radio-inline">
                <?php if (!$melhorenvios_ar) { ?>
                <input type="radio" name="melhorenvios_ar" value="0" checked="checked" />
                <?php echo $text_no; ?>
                <?php } else { ?>
                <input type="radio" name="melhorenvios_ar" value="0" />
                <?php echo $text_no; ?>
                <?php } ?>
              </label>
            </div>
          </div>
			
			<div class="form-group">
            <label class="col-sm-2 control-label" for="input-mp"><?php echo $entry_mp; ?></label>
            <div class="col-sm-10">
                <label class="radio-inline">
                <?php if ($melhorenvios_mp) { ?>
                <input type="radio" name="melhorenvios_mp" value="1" checked="checked" />
                <?php echo $text_yes; ?>
                <?php } else { ?>
                <input type="radio" name="melhorenvios_mp" value="1" />
                <?php echo $text_yes; ?>
                <?php } ?>
              </label>
              <label class="radio-inline">
                <?php if (!$melhorenvios_mp) { ?>
                <input type="radio" name="melhorenvios_mp" value="0" checked="checked" />
                <?php echo $text_no; ?>
                <?php } else { ?>
                <input type="radio" name="melhorenvios_mp" value="0" />
                <?php echo $text_no; ?>
                <?php } ?>
              </label>
            </div>
          </div>
		<div class="form-group" style="display:none;">
            <label class="col-sm-2 control-label" for="input-security"><?php echo $entry_security; ?></label>
            <div class="col-sm-10">
                <label class="radio-inline">
                <?php if ($melhorenvios_security) { ?>
                <input type="radio" name="melhorenvios_security" value="1" checked="checked" />
                <?php echo $text_forever; ?>
                <?php } else { ?>
                <input type="radio" name="melhorenvios_security" value="1" />
                <?php echo $text_forever; ?>
                <?php } ?>
              </label>
              <label class="radio-inline">
                <?php if (!$melhorenvios_security) { ?>
                <input type="radio" name="melhorenvios_security" value="0" checked="checked" />
                <?php echo $text_necessary; ?>
                <?php } else { ?>
                <input type="radio" name="melhorenvios_security" value="0" />
                <?php echo $text_necessary; ?>
                <?php } ?>
              </label>
            </div>
          </div>
		<div class="form-group required">
			 <label class="col-sm-2 control-label"><?php echo $entry_doc2; ?></label>
			 <div class="col-sm-10">
			   <select name="melhorenvios_doc2" id="input-doc2" class="form-control">
				    <option value=""><?php echo $text_none; ?></option>
				    <?php foreach($custom_fields as $custom_field) { ?>
				     <?php if ($custom_field['location'] == 'account') { ?>
					<?php if ($melhorenvios_doc2 == $custom_field['custom_field_id']) { ?>
					<option value="<?php echo $custom_field['custom_field_id']; ?>" selected><?php echo $custom_field['name']; ?></option>
					<?php } else { ?>
					<option value="<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></option>
					<?php } ?>
					<?php } ?>
				   <?php } ?>
			   </select>
			  <?php if ($error_doc2) { ?>
              <div class="text-danger"><?php echo $error_doc2; ?></div>
              <?php } ?>	 
			</div>
		  </div>
		<div class="form-group">
			 <label class="col-sm-2 control-label"><?php echo $entry_doc2a; ?></label>
			 <div class="col-sm-10">
			   <select name="melhorenvios_doc2a" id="input-doc2a" class="form-control">
				    <option value=""><?php echo $text_none; ?></option>
				    <?php foreach($custom_fields as $custom_field) { ?>
				     <?php if ($custom_field['location'] == 'account') { ?>
					<?php if ($melhorenvios_doc2a == $custom_field['custom_field_id']) { ?>
					<option value="<?php echo $custom_field['custom_field_id']; ?>" selected><?php echo $custom_field['name']; ?></option>
					<?php } else { ?>
					<option value="<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></option>
					<?php } ?>
					<?php } ?>
				   <?php } ?>
			   </select>
			</div>
		  </div>
		<div class="form-group required">
			 <label class="col-sm-2 control-label"><?php echo $entry_doc3; ?></label>
			 <div class="col-sm-10">
			   <select name="melhorenvios_doc3" id="input-doc3" class="form-control">
				    <option value=""><?php echo $text_none; ?></option>
				    <?php foreach($custom_fields as $custom_field) { ?>
				     <?php if ($custom_field['location'] == 'address') { ?>
					<?php if ($melhorenvios_doc3 == $custom_field['custom_field_id']) { ?>
					<option value="<?php echo $custom_field['custom_field_id']; ?>" selected><?php echo $custom_field['name']; ?></option>
					<?php } else { ?>
					<option value="<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></option>
					<?php } ?>
					<?php } ?>
				   <?php } ?>
			   </select>
			  <?php if ($error_doc3) { ?>
              <div class="text-danger"><?php echo $error_doc3; ?></div>
              <?php } ?>	 
			</div>
		  </div>
			<div class="form-group">
			 <label class="col-sm-2 control-label"><?php echo $entry_doc4; ?></label>
			 <div class="col-sm-10">
			   <select name="melhorenvios_doc4" id="input-doc4" class="form-control">
				    <option value=""><?php echo $text_none; ?></option>
				    <?php foreach($custom_fields as $custom_field) { ?>
				     <?php if ($custom_field['location'] == 'address') { ?>
					<?php if ($melhorenvios_doc4 == $custom_field['custom_field_id']) { ?>
					<option value="<?php echo $custom_field['custom_field_id']; ?>" selected><?php echo $custom_field['name']; ?></option>
					<?php } else { ?>
					<option value="<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></option>
					<?php } ?>
					<?php } ?>
				   <?php } ?>
			   </select> 
			</div>
		  </div>
		<div class="form-group">
            <label class="col-sm-2 control-label" for="input-days"><?php echo $entry_days; ?></label>
            <div class="col-sm-10">
              <input type="text" name="melhorenvios_days" value="<?php echo $melhorenvios_days; ?>" placeholder="<?php echo $entry_days; ?>" id="input-days" class="form-control" />
            </div>
          </div>
			<div class="form-group">
            <label class="col-sm-2 control-label" for="input-tipo"><?php echo $entry_tipo; ?></label>
            <div class="col-sm-10">
                <label class="radio-inline">
                <?php if ($melhorenvios_tipo) { ?>
                <input type="radio" name="melhorenvios_tipo" value="1" checked="checked" />
                <?php echo $text_per; ?>
                <?php } else { ?>
                <input type="radio" name="melhorenvios_tipo" value="1" />
                <?php echo $text_per; ?>
                <?php } ?>
              </label>
              <label class="radio-inline">
                <?php if (!$melhorenvios_tipo) { ?>
                <input type="radio" name="melhorenvios_tipo" value="0" checked="checked" />
                <?php echo $text_fix; ?>
                <?php } else { ?>
                <input type="radio" name="melhorenvios_tipo" value="0" />
                <?php echo $text_fix; ?>
                <?php } ?>
              </label>
            </div>
          </div>
		<div class="form-group">
            <label class="col-sm-2 control-label" for="input-adic"><?php echo $entry_adic; ?></label>
            <div class="col-sm-10">
              <input type="text" name="melhorenvios_adic" value="<?php echo $melhorenvios_adic; ?>" placeholder="<?php echo $entry_adic; ?>" id="input-adic" class="form-control" />
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-tax-class"><?php echo $entry_tax_class; ?></label>
            <div class="col-sm-10">
              <select name="melhorenvios_tax_class_id" id="input-tax-class" class="form-control">
                <option value="0"><?php echo $text_none; ?></option>
                <?php foreach ($tax_classes as $tax_class) { ?>
                <?php if ($tax_class['tax_class_id'] == $melhorenvios_tax_class_id) { ?>
                <option value="<?php echo $tax_class['tax_class_id']; ?>" selected="selected"><?php echo $tax_class['title']; ?></option>
                <?php } else { ?>
                <option value="<?php echo $tax_class['tax_class_id']; ?>"><?php echo $tax_class['title']; ?></option>
                <?php } ?>
                <?php } ?>
              </select>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-geo-zone"><?php echo $entry_geo_zone; ?></label>
            <div class="col-sm-10">
              <select name="melhorenvios_geo_zone_id" id="input-geo-zone" class="form-control">
                <option value="0"><?php echo $text_all_zones; ?></option>
                <?php foreach ($geo_zones as $geo_zone) { ?>
                <?php if ($geo_zone['geo_zone_id'] == $melhorenvios_geo_zone_id) { ?>
                <option value="<?php echo $geo_zone['geo_zone_id']; ?>" selected="selected"><?php echo $geo_zone['name']; ?></option>
                <?php } else { ?>
                <option value="<?php echo $geo_zone['geo_zone_id']; ?>"><?php echo $geo_zone['name']; ?></option>
                <?php } ?>
                <?php } ?>
              </select>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
            <div class="col-sm-10">
              <select name="melhorenvios_status" id="input-status" class="form-control">
                <?php if ($melhorenvios_status) { ?>
                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                <option value="0"><?php echo $text_disabled; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_enabled; ?></option>
                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                <?php } ?>
              </select>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-sort-order"><?php echo $entry_sort_order; ?></label>
            <div class="col-sm-10">
              <input type="text" name="melhorenvios_sort_order" value="<?php echo $melhorenvios_sort_order; ?>" placeholder="<?php echo $entry_sort_order; ?>" id="input-sort-order" class="form-control" />
            </div>
          </div>
		
	   </div>
           
       <div class="tab-pane" id="tab-help">
	   <fieldset>
       <legend><?php echo $text_h; ?></legend>
       <h4><i class="fa fa-code"></i> <?php echo $text_m; ?> <?php echo $module_name; ?> - <?php echo $text_v; ?> <?php echo $version; ?> </h4>
       <h4><i class="fa fa-envelope"></i> <a href="mailto:suporte@opencartmaster.com.br">suporte@opencartmaster.com.br</a></h4>
       <h4><i class="fa fa-whatsapp"></i> <a href="https://wa.me/551142542450" target="_blank">11 4254-2450</a></h4>
       <h4><i class="fa fa-globe"></i> https://www.opencartmaster.com.br</h4>
	   <p><?php echo $text_support; ?></p>
       </fieldset>
	   </div>
		 
		</div>
        </form>
      </div>
    </div>
  </div>
</div>
<script type="text/javascript"><!--
<?php if($melhorenvios_agency =='' && !in_array('4', $melhorenvios_cargo) && !in_array('3', $melhorenvios_cargo)) { ?>
 $("#agencia").hide();
<?php } ?>
<?php if($melhorenvios_agency2 =='' && !in_array('15', $melhorenvios_cargo) && !in_array('16', $melhorenvios_cargo)) { ?>
 $("#agencia2").hide();
<?php } ?>
$('input[type=checkbox]').on('click', function() {

var jadlog3 = $('#3:checked').length;
var jadlog4 = $('#4:checked').length;
var jadlog15 = $('#15:checked').length;
var jadlog16 = $('#16:checked').length;
if ((jadlog3 == 0) && (jadlog4 == 0)) {
       $("#agencia").hide();
    } else {
       $("#agencia").show();
    }
    
if ((jadlog15 == 0) && (jadlog16 == 0)) {
       $("#agencia2").hide();
    } else {
       $("#agencia2").show();
    }
});
//--></script>
<?php echo $footer; ?> 