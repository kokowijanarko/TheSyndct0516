<?php
class Access extends CI_Controller
{
	 public function __construct()
    {        
		parent::__construct();
		$this->load->database();
    }

	function login($data){
		$username = $data['username'];
		$password = md5($data['password']);
		
        $query = $this->db->query("select * from dev_admin where username='".$username."' AND password='".$password."'");
		$result = $query->result();
		var_dump($result);die;
		if(!empty($result)){
			$this->session->set_userdata($result);
			return true;
		}else{
			return false;
		}		
    }
	
	public function logout(){
		unset($_SESSION);
	}
	
	function admin()
	{ 
		if ($this->session->userdata('user_logged_in') == TRUE)
		{
			return TRUE;
		} 
		else 
		{ 
			return FALSE;
		}
	}
 
}