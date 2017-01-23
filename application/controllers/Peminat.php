<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Peminat extends CI_Controller {
	public function __construct(){
        parent::__construct();
        $this->load->model('peminat_model', 'peminat');
        $this->load->model('products_model', 'produk');
        $this->load->model('penjualan_model', 'penjualan');
		$this->load->library('kmeans');
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
		
		$penjualan = $this->penjualan->getJumlahProdukTerjual();
		
		var_dump($this->kmeans->hitung($penjualan));
		
		die();
		
		
		
		$this->load->view('pages/peminat/view', $data);
	}	
}
