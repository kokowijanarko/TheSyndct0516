<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Home extends CI_Controller {
	public function __construct()
    {
        parent::__construct();
        $this->load->database();
        $this->load->helper('url');
		$this->load->model('m_home');
		//$this->load->model('m_access');
		
    }
	
	public function index(){
		if(empty($this->session->userdata('data')->user_id)){
			$msg = '
				<div class="alert alert-danger alert-dismissible">
					<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
					<h4>Anda Harus Login Dulu!</h4>
				</div>			
			';
			$this->session->set_flashdata(array('msg'=>$msg));
			// var_dump($msg, $this->session);die;
			redirect(site_url('home/login'));
		}else{
			redirect(base_url('index.php/home/home'));
		}	
	}
	
	public function login(){
		$this->load->view('pages/login');
	}
	
	public function home(){
		if(empty($this->session->userdata('data')->user_id)){
			$msg = '
				<div class="alert alert-danger alert-dismissible">
					<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
					<h4>Anda Harus Login Dulu!</h4>
				</div>			
			';
			$this->session->set_flashdata(array('msg'=>$msg));
			// var_dump($msg, $this->session);die;
			redirect(site_url('home/login'));
		}else{
			$data['view'] = 'pages/home_page';
			$this->load->view('index', $data);
		}	
		
	}
	
	public function validasi(){
		$this->m_home->login_validation($_POST);
	}	
        
    public function table_dinamic(){
        $data['view'] = 'pages/simpledinamic_pages';
        $this->load->view('index', $data);
	}
        
    public function table_jgrid(){
        $data['view'] = 'pages/jgrid_pages';
        $this->load->view('index', $data);
	}
	public function formview(){		
		$data['view'] = 'pages/form';
		$this->load->view('index', $data);
	}
	
	public function logout(){
		//unset($this->session->userdata());
		$this->session->unset_userdata('data');
		redirect(site_url('home/login'));
	}
}
