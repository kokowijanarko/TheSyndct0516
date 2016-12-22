<?php

if(!defined('BASEPATH')) exit('No direct script access allowed');

class Products_model extends CI_Model
{
	
    public function __construct()
    {
        parent::__construct();
        $this->load->database();
        $this->load->library('session');
    }
	
	function getProducts(){
		$query = $this->db->query("
			SELECT
				a.`id`,
				a.`catid`,
				a.`productname`,
				b.`catname` AS `cat_name`,
				b.`id` AS cat_id
			FROM prod_products a
			LEFT JOIN prod_ref_category b ON b.`id` = a.`catid`
			LIMIT 0, 5");
		$result = $query->result();
		return $result;
	}	
	function getCategory($id){
		$query = $this->db->query("
			SELECT * FROM prod_ref_cat WHERE id = ". $id);
		$result = $query->result();
		return $result;
	}
	function getParentCategory($id){
		$query = $this->db->query("
			SELECT parentcat FROM prod_ref_category WHERE id = ". $id);
		// var_dump($this->db->last_query());
		$result = $query->row();
		$id = $result->parentcat;
		
		return $id;
	}	
}