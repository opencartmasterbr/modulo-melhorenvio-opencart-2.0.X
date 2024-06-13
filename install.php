<?php
$this->db->query("CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "order_shipping` (
  `order_shipping_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `service` text CHARACTER SET utf8 NOT NULL,
  `service2` text CHARACTER SET utf8 NOT NULL,
  `nfe` varchar(255) CHARACTER SET utf8 NOT NULL,
  `post` tinyint(1) NOT NULL DEFAULT 0,
  `oid` varchar(255) CHARACTER SET utf8 NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`order_shipping_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci; ");

