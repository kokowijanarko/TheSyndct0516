<?php

if(!defined('BASEPATH')) exit('No direct script access allowed');

class Peminat_model extends CI_Model
{
	
    public function __construct()
    {
        parent::__construct();
        $this->load->database();
        $this->load->library('session');
    }
	
	
}