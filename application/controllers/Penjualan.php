<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Penjualan extends CI_Controller {
	public function __construct(){
        parent::__construct();
        $this->load->model('penjualan_model', 'penjualan');
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
		$data['penjualan'] = $this->penjualan->getPenjualan();
		// var_dump($data);die;
		$this->load->view('pages/penjualan/view', $data);
	}
	public function statistik(){
		if(isset($this->session->userdata['msg'])){
			$data['message'] = $this->session->userdata['msg'];
		}		
		$data['stat'] = $this->penjualan->getStatistik();
		$this->load->view('pages/penjualan/statistik', $data);
	}	
}
