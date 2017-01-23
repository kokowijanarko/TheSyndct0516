<?php

if(!defined('BASEPATH')) exit('No direct script access allowed');

class Penjualan_model extends CI_Model
{
	
    public function __construct()
    {
        parent::__construct();
        $this->load->database();
        $this->load->library('session');
    }
	
	function getPenjualan(){
		$query = $this->db->query("
			SELECT 
				a.`id`, 
				a.`customerid`, 
				b.`customername`,
				a.`orderdate`, 
				a.`ordershippingcost`, 
				a.`ordershipping`, 
				a.`ordershippingdate`,
				a.`ordershippingnote`,
				a.`orderprice`,
				a.`ordertotaldiscpercent`,
				a.`ordertotaldiscprice`,
				a.`ordertotalafterdisc`,
				a.`ordernote`	
			FROM ord_orders a
			LEFT JOIN `core_customers` b ON b.`cid` = a.`customerid`
			ORDER BY a.`orderdate` DESC");
		$result = $query->result();
		return $result;
	}	
	function getStatistik(){
		$query = $this->db->query("
			SELECT
				a.`id`,
				a.`catid`,
				b.`catname`,
				a.`productname`,
				a.`productsellprice`,
				(SELECT COUNT(productid) FROM ord_products aa WHERE aa.productid = a.`id`) AS jumlah
			FROM prod_products a
			LEFT JOIN prod_ref_category b ON b.`id` = a.`catid`
			ORDER BY jumlah DESC");
		$result = $query->result();
		return $result;
	}
	
	public function getJumlahProdukTerjual(){
		$query = $this->db->query("
			SELECT
				a.`productid` as id,
				b.`productname` as name,
				COUNT(a.id) as jumlah
			FROM `ord_products` a
			LEFT JOIN `prod_products` b ON b.`id` = a.`productid`
			LEFT JOIN `prod_ref_category` c ON c.`id` = b.`catid`
			GROUP BY a.`productid`
			ORDER BY jumlah desc
		");
		$result = $query->result();
		return $result;
	}
}