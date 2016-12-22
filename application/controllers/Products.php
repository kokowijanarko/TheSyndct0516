<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Products extends CI_Controller {
	public function __construct(){
        parent::__construct();
        $this->load->model('products_model', 'products');
		if(empty($this->session->userdata('data')->user_id)){
			$msg = '
				<div class="alert alert-danger alert-dismissible">
					<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
					<h4>Anda Harus Login Dulu!</h4>
				</div>			
			';
			$this->session->set_flashdata(array('msg'=>$msg));
			redirect(site_url('home/login'));
		}		
    }
	
	public function view(){
		if(isset($this->session->userdata['msg'])){
			$data['message'] = $this->session->userdata['msg'];
		}		
		$data['products'] = $this->products->getProducts();
		foreach($data['products'] as $key=>$val){			
			$parentCat = array();
			$par = $this->products->getParentCategory($val->cat_id);
			// var_dump($par);
			if($val->cat_id != 0){
				while($par = $this->products->getParentCategory($val->cat_id) != 0){
					var_dump($par);
					array_push($parentCat, $par);
				}		
			}
			$data['products'][$key]['parent_category'] = $parentCat;
		}
		var_dump($data);die;
		$this->load->view('pages/products/view', $data);
	}	
}
