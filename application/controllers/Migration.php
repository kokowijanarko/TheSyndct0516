<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Migration extends CI_Controller {
	public function __construct(){
        parent::__construct();
        //$this->load->model('migration_model', 'mig');
		// $this->load->library('kmeans');
		$this->db1 = $this->load->database('db1', true);
		
    }
	
	public function customer(){
		// $query = $this->db1->query('SELECT * FROM dev_level');
		// $result = $query->result();
		
		die;
		
		$query2 = $this->db->query("SELECT * FROM core_customers ORDER BY id");
		$data = $query2->result();
		
		foreach($data as $key=>$val){
			$address = $val->customeraddress .', '. $val->customeraddresscon .', '. $val->customercity;
			
			$params[$key]['customer_id'] =  $val->id;
			$params[$key]['customer_name'] =  $val->customername;
			$params[$key]['customer_address'] =  $address;
			$params[$key]['customer_post_code'] =  '';
			$params[$key]['customer_email'] =  $val->customeremail;
			$params[$key]['customer_phone_number'] =  $val->customerphone1;
			$params[$key]['customer_desc'] =  $val->customernote;
			$params[$key]['insert_user_id'] =  1;
			$params[$key]['insert_timestamp'] =  date('Y-m-d h:i:s');
			
		}
		// var_dump($params);die;
		
		
		$this->db1->trans_start();
		$result = $this->db1->insert_batch('core_customers', $params);
		var_dump($result);
		$this->db1->trans_complete($result);
		
		
		
	}	
	
	public function category(){
		$query2 = $this->db->query("SELECT * FROM prod_ref_category ORDER BY id");
		$data = $query2->result();
		
		foreach($data as $key=>$val){
			$params[$key]['category_id'] =  $val->id;
			$params[$key]['category_parent_id'] =  $val->parentcat;
			$params[$key]['category_name'] =  $val->catname;
			$params[$key]['category_desc'] =  '';
			$params[$key]['insert_user_id'] =  1;
			$params[$key]['insert_timestamp'] =  date('Y-m-d h:i:s');
			
		}
		// var_dump($params);die;
		
		
		$this->db1->trans_start();
		$result = $this->db1->insert_batch('prod_category', $params);
		var_dump($result);
		$this->db1->trans_complete($result);
		
		
		
	}	
	
	public function prod(){
		$query2 = $this->db->query("SELECT * FROM prod_products ORDER BY id ");
		$data = $query2->result();
		
		foreach($data as $key=>$val){
			
			$base_price = '';
			if(empty($val->productbuyprice) || $val->productbuyprice == ''){
				$base_price = intval($val->productsellprice) - (intval($val->productsellprice) * 0.3);
			}
			
			
			$params[$key]['product_id'] =  $val->id;
			$params[$key]['product_name'] =  $val->productname;
			$params[$key]['product_category_id'] =  $val->catid;
			$params[$key]['product_price'] =  $val->productsellprice;
			$params[$key]['product_price_base'] =  $base_price;
			$params[$key]['product_stock'] =  '';
			$params[$key]['product_desc'] =  '';
			$params[$key]['insert_user_id'] =  1;
			$params[$key]['insert_timestamp'] =  date('Y-m-d h:i:s');
			
		}
		
		$this->db1->trans_start();
		$result = $this->db1->insert_batch('prod_products', $params);
		var_dump($result);
		$this->db1->trans_complete($result);
		
		
		
	}	
	
	public function order(){
		$query2 = $this->db->query("SELECT * FROM ord_orders ORDER BY id");
		$data = $query2->result();
		
		foreach($data as $key=>$val){
			
			$query = $this->db1->query('SELECT * FROM core_customers WHERE customer_id = "'. $val->customerid .'"');
			 $cus = $query->row();
			// var_dump($this->db1->last_query(), $cus);die;
			$order_number = 'INV/'. $key .'/'.$val->orderdate;
			
			$shipping = explode('/', $val->ordershipping);
		
			$params[$key]['order_id'] =  $val->id;
			$params[$key]['order_number'] =  $order_number;
			$params[$key]['order_customer_id'] =  $cus->customer_id;
			$params[$key]['order_name'] =  $cus->customer_name;
			$params[$key]['order_address'] =  $cus->customer_address;
			$params[$key]['order_post_code'] =  $cus->customer_post_code;
			$params[$key]['order_phone_number'] =  $cus->customer_phone_number;
			$params[$key]['order_amount'] =  $val->orderprice;
			$params[$key]['order_shipping'] = rtrim($shipping[0]);
			$params[$key]['order_shipping_date'] = $val->ordershippingdate;
			$params[$key]['order_shiiping_cost'] = $val->ordershippingcost;
			$params[$key]['order_shipping_note'] = $val->ordershippingnote;
			$params[$key]['order_desc'] = $val->ordernote;
			$params[$key]['insert_user_id'] =  1;
			$params[$key]['insert_timestamp'] =  date('Y-m-d h:i:s');
			
			
			
			
			
			
		}
		
		
		
		
		$this->db1->trans_start();
		$result=true;
		$result = $this->db1->insert_batch('ord_orders', $params);
		var_dump($result);
		
		
		if($result){
			unset($params);
			$query = $this->db->query("SELECT * FROM ord_products ORDER BY id");
			$data = $query->result();
			// var_dump($data);die;
			foreach($data as $key=>$val){
				$params[$key]['ordprod_id'] = $val->id;
				$params[$key]['ordprod_product_id'] = $val->productid;
				$params[$key]['ordprod_order_id'] = $val->orderid;
				$params[$key]['order_discount'] = $val->productpercentcut;
				$params[$key]['order_price_after_discount'] = $val->productpriceafterdisc;
				$params[$key]['ordprod_sum'] = $val->ordersum;
				$params[$key]['ordprod_subtotal'] = $val->ordertotal;
				$params[$key]['orprod_status'] = 1;
				$params[$key]['insert_user_id'] =  1;
				$params[$key]['insert_timestamp'] =  date('Y-m-d h:i:s');				
			}
			
			
			$result = $result && $this->db1->insert_batch('ord_order_products', $params);
			
			// var_dump($params);die;
		
		
		}
		
		
		
		var_dump($result);
		$this->db1->trans_complete($result);
		
		
		
	}	
	public function test(){
		
		var_dump('asd');die;
	}	
}
