<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Monitoring extends CI_Controller
{
	function __construct()
	{
		parent::__construct();
		$this->load->model('m_user');
		$this->load->model('m_antrian');
		$this->load->model('m_spesialis');
	}

	public function index()
	{
		// DATA
		$data['setting']             = getSetting();
		$data['spesialis']   = $this->m_spesialis->read('', '', '');
		$data['antrian']   = $this->m_antrian->read('', '', '');
		$data['dokter']   = $this->m_user->read_group('', '', '', 4);
		

		// echo "<pre>";
		// print_r($data['spesialis']);
		// echo '</pre>';
		// die;

		// TEMPLATE
		$view         = "_frontend/monitoring";
		$viewCategory = "all";
		renderTemplateFront($data, $view, $viewCategory);
	}
}
