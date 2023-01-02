<?php defined('BASEPATH') or exit('No direct script access allowed');
class Kontrol extends CI_Controller
{
	function __construct()
	{
		parent::__construct();
		$this->load->model('m_user');
		$this->load->model('m_antrian');
		$this->load->model('m_spesialis');

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
		$data['spesialis']   = $this->m_spesialis->read('', '', '');
		$data['antrian']   = $this->m_antrian->read('', '', '');
		$data['dokter']   = $this->m_user->read_group('', '', '', 4);

		if ($data['antrian']) {
			$data['total_antrian'] = count($data['antrian']);
		} else $data['total_antrian'] = 0;

		// TEMPLATE
		$view         = "_backend/antrian_kontrol";
		$viewCategory = "all";
		renderTemplate($data, $view, $viewCategory);
	}

	public function delete()
	{
		csrfValidate();
		// POST
		$this->m_antrian->delete($this->input->post('antrian_kode'));

		// ALERT
		$alertStatus  = "failed";
		$alertMessage = "Lewati data antrian : " . $this->input->post('antrian_kode');
		getAlert($alertStatus, $alertMessage);

		redirect('admin/kontrol');
	}
}
