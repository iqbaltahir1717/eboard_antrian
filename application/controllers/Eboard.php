<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Eboard extends CI_Controller
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
		if ($data['antrian']) {
			$data['total_antrian'] = count($data['antrian']);
		} else $data['total_antrian'] = 0;
		$data['profile'] = $this->m_user->get($this->session->userdata('user_id'));
		$data['profile_antrian']   = $this->m_antrian->get($this->session->userdata('user_id'));

		// TEMPLATE
		$view         = "_frontend/monitoring";
		$viewCategory = "all";
		renderTemplateFront($data, $view, $viewCategory);
	}

	public function realtime()
	{
		header("Access-Control-Allow-Origin: *");
		header("Content-Type: application/json; charset=UTF-8");
		http_response_code(200);


		$data    = $this->m_spesialis->read('', '', '');
		$resultData = $data;

		echo json_encode($resultData, JSON_PRETTY_PRINT);
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
		$datas['antrian_check']   = $this->m_antrian->check_data_count($this->input->post('spesialis_id'));
		$last_antrian = 0;

		if ($datas['antrian_check']) {
			$jumlah_antrian	 = count($datas['antrian_check']);
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
			$data['createtime']     = date('Y-m-d');
			$data['antrian_nomor']     = $ouput_nomor[$this->input->post('spesialis_id') - 1][0];

			// echo "<pre>";
			// print_r($data['antrian_nomor']);
			// echo "</pre>";
			// die;

			if ($datas["antrian"]) {
				foreach ($datas["antrian"] as $key) {
					if ($this->session->userdata('user_id') == $key->user_id) {
						// ALERT
						$alertStatus  = "failed";
						$alertMessage = "Anda sudah dalam antrian";
						getAlert($alertStatus, $alertMessage);
						redirect('eboard');
					}
				}
			}
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
		redirect('eboard');
	}

	public function update()
	{
		csrfValidate();

		// PASSWORD VALIDATOR
		if ($this->input->post('password') != "") {
			if (password_verify($this->input->post('password'), $this->input->post('old_password'))) {
				if ($this->input->post('new_password') == $this->input->post('confirm_password')) {
					if ($this->input->post('confirm_password') != "") {
						$data['user_password']  = password_hash($this->input->post('confirm_password'), PASSWORD_BCRYPT);
					} else {

						// ALERT
						$alertStatus  = "failed";
						$alertMessage = "Password baru tidak boleh bernilai kosong";
						getAlert($alertStatus, $alertMessage);
						redirect('eboard');
						clean_all_processes();
					}
				} else {

					// ALERT
					$alertStatus  = "failed";
					$alertMessage = "Password baru dan konfirmasi tidak cocok";
					getAlert($alertStatus, $alertMessage);
					redirect('eboard');
					clean_all_processes();
				}
			} else {

				// ALERT
				$alertStatus  = "failed";
				$alertMessage = "Password Lama Tidak Sama dengan database";
				getAlert($alertStatus, $alertMessage);
				redirect('eboard');
				clean_all_processes();
			}
		}


		// POST
		$data['user_id']       = $this->session->userdata('user_id');
		$data['user_fullname'] = $this->input->post('user_fullname');
		$data['user_phone'] = $this->input->post('user_phone');
		$this->m_user->update($data);

		// SET SESSION
		$session = array(
			'user_fullname'   => $data['user_fullname'],
			'user_photo'      => $data['user_photo'],
			'user_phone'      => $data['user_phone'],
		);
		$this->session->set_userdata($session);

		// LOG
		$message    = $this->session->userdata('user_fullname') . " mengubah data profile dengan ID = " . $data['user_id'] . " - " . $data['user_fullname'];
		createLog($message);

		// ALERT
		$alertStatus  = "success";
		$alertMessage = "Berhasil mengubah data profile : " . $data['user_fullname'];
		getAlert($alertStatus, $alertMessage);

		redirect('eboard');
	}

	public function delete()
	{
		csrfValidate();
		// POST
		// echo $this->input->post('antrian_kode');
		// die;
		$data['antrian_kode'] = $this->input->post('antrian_kode');
		$this->m_antrian->delete($data);

		// LOG
		$message    = $this->session->userdata('user_name') . " menghapus data antrian dengan kode = " . $this->input->post('antrian_kode') . " - " . $this->input->post('antrian_kode');
		createLog($message);

		// ALERT
		$alertStatus  = "failed";
		$alertMessage = "Menghapus data antrian : " . $this->input->post('antrian_kode');
		getAlert($alertStatus, $alertMessage);

		redirect('eboard');
	}
}
