<?php defined('BASEPATH') or exit('No direct script access allowed');
class Dashboard extends CI_Controller
{
	function __construct()
	{
		parent::__construct();

		// check session data
		if (!$this->session->userdata('user_id')) {
			// ALERT
			$alertStatus  = 'failed';
			$alertMessage = 'Anda tidak memiliki Hak Akses atau Session anda sudah habis';
			getAlert($alertStatus, $alertMessage);
			redirect('auth');
		}
	}

	public function index()
	{
		// DATA
		$data['setting'] = getSetting();
		// $data['widget_doa']  = $this->m_doa->widget();
		// $data['widget_riwayat']  = $this->m_riwayat->widget();
		// $data['widget_panduan']  = $this->m_panduan->widget();
		// $data['widget_kategori']  = $this->m_kategori->widget();

		// TEMPLATE
		$view         = "_backend/dashboard";
		$viewCategory = "all";
		renderTemplate($data, $view, $viewCategory);
	}
}
