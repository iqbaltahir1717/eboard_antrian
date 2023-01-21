<?php defined('BASEPATH') or exit('No direct script access allowed');
class Kontrol extends CI_Controller
{
	function __construct()
	{
		parent::__construct();
		$this->load->model('m_user');
		$this->load->model('m_antrian');
		$this->load->model('m_spesialis');
		$this->load->model('m_antrian_saat_ini');
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
		$data['spesialis']   = $this->m_spesialis->read('', '', '');
		$data['antrian']   = $this->m_antrian->read('', '', '');
		$data['dokter']   = $this->m_user->read_group('', '', '', 4);

		if ($data['antrian']) {
			$data['total_antrian'] = count($data['antrian']);
		} else $data['total_antrian'] = 0;
		// echo "<pre>";
		// print_r($data['antrian']);
		// echo "</pre>";
		// die;
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

	public function backward()
	{
		csrfValidate();
		$nomor = explode('-', $this->input->post('antrian_saat_ini'));

		$datas['antrian']   = $this->m_antrian->read('', '', '');
		$data_nomor_berikutnya = $nomor[1] - 1;

		if ($data_nomor_berikutnya > 0) {
			foreach ($datas['antrian']  as $key) {
				$nomor_antrian = $nomor[0] . '-' .  $data_nomor_berikutnya;
				if ($key->antrian_nomor == $nomor_antrian) {
					$data2['antrian_kode']       = $key->antrian_kode;
					$data2['service_start_time']       = date('H:i:s');
					$data2['antrian_status']       = 'start_service';
					$this->m_antrian->update($data2);
				}
			}
		}

		$data['antrian_berjalan_id']       = $this->input->post('antrian_berjalan_id');
		$data['antrian_saat_ini'] = $nomor[1] - 1;
		// POST
		$this->m_antrian_saat_ini->update($data);

		redirect('admin/kontrol');
	}

	public function forward()
	{
		csrfValidate();
		$nomor = explode('-', $this->input->post('antrian_saat_ini'));

		$datas['antrian']   = $this->m_antrian->read('', '', '');
		$data_nomor_berikutnya = $nomor[1] + 1;

		if ($data_nomor_berikutnya > 0) {
			foreach ($datas['antrian']  as $key) {
				$nomor_antrian = $nomor[0] . '-' .  $data_nomor_berikutnya;
				if ($key->antrian_nomor == $nomor_antrian) {
					$data2['antrian_kode']       = $key->antrian_kode;
					$data2['service_start_time']       = date('H:i:s');
					$data2['antrian_status']       = 'start_service';
					$this->m_antrian->update($data2);
				}
			}
		}

		$data['antrian_berjalan_id']       = $this->input->post('antrian_berjalan_id');
		$data['antrian_saat_ini'] = $nomor[1] + 1;
		// POST
		$this->m_antrian_saat_ini->update($data);

		redirect('admin/kontrol');
	}

	public function callback()
	{
		csrfValidate();
		$nomor = explode('-', $this->input->post('antrian_saat_ini'));

		$datas['antrian']   = $this->m_antrian->read('', '', '');
		$data_nomor_berikutnya = $nomor[1];

		if ($data_nomor_berikutnya > 0) {
			foreach ($datas['antrian']  as $key) {
				$nomor_antrian = $nomor[0] . '-' .  $data_nomor_berikutnya;
				if ($key->antrian_nomor == $nomor_antrian) {
					$data2['antrian_kode']       = $key->antrian_kode;
					$data2['service_start_time']       = date('H:i:s');
					$data2['antrian_status']       = 'start_service';
					$this->m_antrian->update($data2);
				}
			}
		}

		$data['antrian_berjalan_id']       = $this->input->post('antrian_berjalan_id');
		$data['antrian_saat_ini'] = $nomor[1];
		// POST
		$this->m_antrian_saat_ini->update($data);

		redirect('admin/kontrol');
	}

	public function lewati()
	{
		csrfValidate();
		$nomor = explode('-', $this->input->post('antrian_saat_ini'));

		$datas['antrian']   = $this->m_antrian->read('', '', '');

		// echo $this->input->post('antrian_saat_ini');
		// die;

		if ($datas['antrian']) {
			$data_nomor_saat_ini = $nomor[1];
			$data_nomor_berikutnya = $nomor[1] + 1;
			if ($data_nomor_saat_ini > 0) {
				foreach ($datas['antrian']  as $key) {
					$nomor_antrian = $nomor[0] . '-' .  $data_nomor_saat_ini;
					if ($key->antrian_nomor == $this->input->post('antrian_saat_ini')) {
						$data2['antrian_nomor']       = $key->antrian_nomor;
						$this->m_antrian->delete($data2);
						// $datas2['antrian_kode']       = $key->antrian_kode;
						// $datas2['service_start_time']       = date('H:i:s');
						// $datas2['antrian_status']       = 'start_service';
						// $this->m_antrian->update($datas2);
					}
				}
				foreach ($datas['antrian']  as $key) {
					$nomor_antrian = $nomor[0] . '-' .  $data_nomor_berikutnya;
					if ($key->antrian_nomor == $nomor_antrian) {
						$datas2['antrian_kode']       = $key->antrian_kode;
						$datas2['service_start_time']       = date('H:i:s');
						$datas2['antrian_status']       = 'start_service';
						$this->m_antrian->update($datas2);
					}
				}
			}

			$data['antrian_berjalan_id']       = $this->input->post('antrian_berjalan_id');
			$data['antrian_saat_ini'] = $nomor[1] + 1;
			// POST
			$this->m_antrian_saat_ini->update($data);

			redirect('admin/kontrol');
		} else {
			// ALERT
			$alertStatus  = "failed";
			$alertMessage = "Tidak Terdapat Antrian!!";
			getAlert($alertStatus, $alertMessage);
			redirect('admin/kontrol');
		}
	}
	public function selesai()
	{
		csrfValidate();

		$datas['antrian']   = $this->m_antrian->read('', '', '');
		$nomor_antrian = $this->input->post('antrian_saat_ini');
		$nomor = explode('-', $nomor_antrian);


		if ($datas['antrian']) {
			if ($nomor[1] != 0) {
				foreach ($datas['antrian']  as $key) {
					if ($key->antrian_nomor == $this->input->post('antrian_saat_ini')) {
						$data['riwayat_antrian_id']       = '';
						$data['user_id'] = $key->user_id;
						$data['spesialis_id'] = $key->spesialis_id;
						$data['antrian_nomor'] = str_replace(
							'-',
							'',
							$nomor_antrian
						);
						$data['arrival_time']       = $key->arrival_time;
						$data['service_start_time']       =  $key->service_start_time;
						$data['service_end_time']       =  date('H:i:s');
						$data['createtime']       = date('Y-m-d');
						$this->m_riwayat->create($data);
						if ($this->input->post('antrian_saat_ini') > 0) {
							$data3['antrian_kode']  = '';
							$data3['antrian_status'] = '';
							$data3['service_end_time'] = '';
							foreach ($datas['antrian'] as $key) {
								$nomor_antrian = $this->input->post('antrian_saat_ini');

								if ($key->antrian_nomor == $nomor_antrian) {
									$data3['antrian_kode']       = $key->antrian_kode;
									$data3['antrian_status']       = 'end_service';
									$data3['service_end_time']       =  date('H:i:s');
								}
							}
							if ($data3['antrian_kode'] == '') {
								// ALERT
								$alertStatus  = "failed";
								$alertMessage = "Tidak Terdapat Antrian !!";
								getAlert($alertStatus, $alertMessage);
								redirect('admin/kontrol');
							}
							$this->m_antrian->update($data3);
							foreach ($datas['antrian'] as $key) {
								$nomor_antrian = $this->input->post('antrian_saat_ini');
								if ($key->antrian_nomor == $nomor_antrian) {
									$nomor_antrian_berikutnya = explode('-', $key->antrian_nomor);
									$data4['antrian_nomor']       = $nomor_antrian_berikutnya[0] . '-' . $nomor_antrian_berikutnya[1] + 1;
									$data4['service_start_time']       =  date('H:i:s');
									$data4['antrian_status']       = 'start_service';
								}
							}
							$this->m_antrian->update_antrian_berikutnya($data4);
						}

						$data2['antrian_berjalan_id']       = $this->input->post('antrian_berjalan_id');
						$nomor = explode('-', $this->input->post('antrian_saat_ini'));
						$data2['antrian_saat_ini'] = $nomor[1] + 1;

						// POST
						$this->m_antrian_saat_ini->update($data2);

						redirect('admin/kontrol');
					}
				}
				// ALERT
				$alertStatus  = "failed";
				$alertMessage = "Tidak Terdapat Antrian !!";
				getAlert($alertStatus, $alertMessage);
				redirect('admin/kontrol');
			} else {
				$data_nomor_berikutnya = $nomor[1] + 1;

				foreach ($datas['antrian']  as $key) {
					$nomor_antrian = $nomor[0] . '-' .  $data_nomor_berikutnya;
					if ($key->antrian_nomor == $nomor_antrian) {
						$data2['antrian_kode']       = $key->antrian_kode;
						$data2['service_start_time']       = date('H:i:s');
						$data2['antrian_status']       = 'start_service';
						$this->m_antrian->update($data2);
					}
				}

				$data['antrian_berjalan_id']       = $this->input->post('antrian_berjalan_id');
				$data['antrian_saat_ini'] = $nomor[1] + 1;
				// POST
				$this->m_antrian_saat_ini->update($data);

				redirect('admin/kontrol');
			}
		} else {
			// ALERT
			$alertStatus  = "failed";
			$alertMessage = "Tidak Terdapat Antrian !!";
			getAlert($alertStatus, $alertMessage);
			redirect('admin/kontrol');
		}
	}

	public function reset()
	{
		for ($i = 1; $i < 6; $i++) {
			$data['antrian_berjalan_id'] =  $i;
			$data['antrian_saat_ini'] = 0;
			$this->m_antrian_saat_ini->update($data);
		}

		// ALERT
		$alertStatus  = "failder";
		$alertMessage = "Tidak Terdapat Antrian !!";
		getAlert($alertStatus, $alertMessage);
		redirect('admin/kontrol');
	}
}
