<?php defined('BASEPATH') or exit('No direct script access allowed');
class Monitoring extends CI_Controller
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
		$view         = "_backend/antrian_monitoring";
		$viewCategory = "all";
		renderTemplate($data, $view, $viewCategory);
	}

	public function create_antrian()
	{
		csrfValidate();
		$setting = getSetting();
		$kode_antrian                = "FN-" . date('YmdHis') . $this->session->userdata('user_id');

		// POST
		$data['antrian_kode']        = $kode_antrian;
		$datas['spesialis']   = $this->m_spesialis->read('', '', '');
		$datas['antrian']   = $this->m_antrian->read('', '', '');
		$last_antrian = 0;

		if ($datas['antrian']) {
			$jumlah_antrian	 = count($datas['antrian']);
		} else $jumlah_antrian = 0;


		if ($jumlah_antrian <= $setting[0]->setting_max_antrian) {
			// $result           = $this->m_antrian->validate(str_replace(' ', '', $this->db->escape_str($this->input->post('user_id'))));

			foreach ($datas["spesialis"] as $key) {
				if ($this->input->post('spesialis_id') == $key->spesialis_id) {
					$last   = $this->m_antrian->get_antrian($this->input->post('spesialis_id'));
					if ($last) {
						$antrian = end($last);
						$last_antrian = $antrian->antrian_nomor;
					} else $last_antrian = 0;


					if ($last_antrian > 0) {
						$last_antrian_nomor = explode('-', $last_antrian);
						$last_antrian_kode_get =  $last_antrian_nomor[0];
						$last_antrian_nomor_get = $last_antrian_nomor[1] + 1;
						$antrian_nomor =  $last_antrian_kode_get . "-" . $last_antrian_nomor_get;
					} else {
						$last_antrian_kode_get =  $key->spesialis_kode_antrian;
						$last_antrian_nomor_get = 1;
						$antrian_nomor =  $last_antrian_kode_get . "-" . $last_antrian_nomor_get;
					}
				} else {
					$last_antrian_kode_get =  $this->input->post('spesialis_id');
					$last_antrian_nomor_get = 1;
					$antrian_nomor =  $last_antrian_kode_get . "-" . $last_antrian_nomor_get;
				}
				$ouput_nomor[] = [$antrian_nomor];
			}

			$data['user_id']  = $this->session->userdata('user_id');
			$data['spesialis_id']     = $this->input->post('spesialis_id');
			$data['arrival_time']     = date('Y-m-d H:i:s');
			$data['antrian_nomor']     = $ouput_nomor[$this->input->post('spesialis_id') - 1][0];

			if ($datas["antrian"]) {
				foreach ($datas["antrian"] as $key) {
					if ($this->session->userdata('user_name') == $key->user_name) {
						// ALERT
						$alertStatus  = "failed";
						$alertMessage = "Anda sudah dalam antrian";
						getAlert($alertStatus, $alertMessage);
						redirect('admin/monitoring/');
					}
				}
			}


			// echo "<pre>";
			// print_r($datas['antrian']);
			// echo "</pre>";
			// die;

			$this->m_antrian->create($data);
			// LOG
			$message    = "Behasil menambah data antrian " . $data['antrian_kode'] . ' dengan nomor antrian ' . $data['antrian_nomor'];
			createLog($message);

			// ALERT
			$alertStatus  = "success";
			$alertMessage = "Behasil menambah data antrian " . $data['antrian_kode'] . ' dengan nomor antrian kamu = ' . $data['antrian_nomor'];
		} else {
			// ALERT
			$alertStatus  = "failed";
			$alertMessage = "Antrian Penuh !!!";
		}
		getAlert($alertStatus, $alertMessage);
		redirect('admin/monitoring/');
	}

	public function delete()
	{
		csrfValidate();
		// POST
		$this->m_antrian->delete($this->input->post('antrian_kode'));

		// LOG
		$message    = $this->session->userdata('user_name') . " menghapus data antrian dengan kode = " . $this->input->post('antrian_kode') . " - " . $this->input->post('antrian_kode');
		createLog($message);

		// ALERT
		$alertStatus  = "failed";
		$alertMessage = "Menghapus data antrian : " . $this->input->post('antrian_kode');
		getAlert($alertStatus, $alertMessage);

		redirect('admin/monitoring');
	}
}
