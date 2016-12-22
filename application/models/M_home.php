<?php

if(!defined('BASEPATH')) exit('No direct script access allowed');

class M_home extends CI_Model
{
	
    public function __construct()
    {
        parent::__construct();
        $this->load->database();
        $this->load->library('session');
    }

	function login_validation($data){
		$username = $data['username'];
		$password = md5($data['password']);
		
        $query = $this->db->query("select * from dev_user where user_username='".$username."' AND user_pass='".$password."'");
		//var_dump($query);
    //var_dump($this->db->last_query());
		$result = $query->row();
    //var_dump($result);die;
		if(!empty($result)){
			$this->session->userdata['data'] = ($result);
			redirect(base_url('index.php/home'));
		}else{
			redirect(base_url('index.php/home/login'));
		}		
		
    }
   
   function from_date($date){
       $data = explode("-", $date);
       $day = array("Senin", "Selasa", "Rabu", "Kamis", "Jum'at", "Sabtu", "Minggu");
       $bulan = array(
       "error",
       "Januari",
       "Februari",
       "Maret",
       "April",
       "Mei",
       "Juni",
       "Juli",
       "Agustus",
       "September",
       "Oktober",
       "November",
       "Desember"
       );
       
      return $data[2] . " " . $bulan[intval($data[1])] . " " . $data[0];
   }
   
   function text_limit($str,$limit){  
       if(stripos($str," ")){  
         
     $ex_str = explode(" ",$str);  
     if(count($ex_str)>$limit){  
       for($i=0;$i<$limit;$i++){  
        $str_s.=$ex_str[$i]." ";  
       }  
      return $str_s;  
      }else{  
       return $str;  
      }  
     }else{  
     return $str;  
       }  
   }  
	
	
}