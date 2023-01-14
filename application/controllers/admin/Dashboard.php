<?php defined('BASEPATH') or exit('No direct script access allowed');
class Dashboard extends CI_Controller
{
	function __construct()
	{
		parent::__construct();
		$this->load->model('m_user');
		$this->load->model('m_antrian');
		$this->load->model('m_riwayat');

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
		$data['widget_dokter']  = $this->m_user->count_dokter();
		$data['widget_pasien']  = $this->m_user->count_pasien();
		$data['widget_kunjungan_hari']  = $this->m_antrian->count_kunjungan();
		$data['widget_kunjungan_bulan']  = $this->m_riwayat->count_kunjungan_bulan();

		// TEMPLATE
		$view         = "_backend/dashboard";
		$viewCategory = "all";
		renderTemplate($data, $view, $viewCategory);
	}
}
