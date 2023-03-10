<?php defined('BASEPATH') or exit('No direct script access allowed');
class Auth extends CI_Controller
{
	function __construct()
	{
		parent::__construct();
		$this->load->model('m_auth');
		$this->load->model('m_user');
	}


	public function index()
	{
		// check session data
		if ($this->session->userdata('user_id')) {
			// ALERT
			$alertStatus  = 'success';
			$alertMessage = 'Selamat Datang, ' . $this->session->userdata('user_fullname');
			getAlert($alertStatus, $alertMessage);
			redirect('admin/dashboard');
		} else {
			// DATA
			$data['setting'] = getSetting();

			// TEMPLATE
			$view         = "_backend/auth/login";
			$viewCategory = "single";
			renderTemplate($data, $view, $viewCategory);
		}
	}


	public function validate()
	{
		csrfValidate();
		if ($_POST) {
			$result           = $this->m_auth->validate(str_replace(' ', '', $this->db->escape_str($this->input->post('user_phone'))));
			if (!!($result)) {
				if (password_verify($this->input->post('password'), $result[0]->user_password)) {
					// SESSION DATA
					$data = array(
						'user_id'         => $result[0]->user_id,
						'user_fullname'   => $result[0]->user_fullname,
						'user_photo'      => $result[0]->user_photo,
						'user_phone'      => $result[0]->user_phone,
						'user_group'      => $result[0]->group_id,
						'user_group_name' => $result[0]->group_name,
						'user_createtime' => $result[0]->createtime,
						'sess_rowpage'    => 10,
						'IsAuthorized'    => true
					);
					$this->session->set_userdata($data);
					// LOG
					$logMessage = $data['user_fullname'] . " melakukan login ke sistem";
					createLog($logMessage);

					if ($data['user_group'] < 3 or $data['user_group'] == 4) {
						redirect('admin/dashboard');
					} else redirect('eboard');
				} else {
					// ALERT
					$alertStatus  = 'failed';
					$alertMessage = 'Username atau Password salah';
					getAlert($alertStatus, $alertMessage);
					redirect('auth');
				}
			} else {
				// ALERT
				$alertStatus  = 'failed';
				$alertMessage = 'Akun tidak valid';
				getAlert($alertStatus, $alertMessage);
				redirect('auth');
			}
		}
	}


	public function logout()
	{
		$this->session->sess_destroy();
		redirect('auth');
	}


	public function register()
	{
		// DATA
		$data['setting'] = getSetting();
		$data['user_password'] = '';
		$data['password_confirm'] = '';
		$data['user_fullname']  = '';
		$data['user_phone']     = '';
		$data['user_umur']     = '';
		$data['user_alamat']     = '';
		$data['user_jk']     = '';

		// TEMPLATE
		$view         = "_backend/auth/register";
		$viewCategory = "single";
		renderTemplate($data, $view, $viewCategory);
	}

	public function create()
	{
		csrfValidate();

		$data['user_password'] = $this->input->post('user_password');
		$data['user_fullname']  = $this->input->post('user_fullname');
		$data['user_phone']     = $this->input->post('user_phone');
		$data['user_alamat']     = $this->input->post('user_alamat');
		$data['user_umur']     = $this->input->post('user_umur');
		$data['user_jk']     = $this->input->post('user_jk');

		if ($this->input->post('user_password') == $this->input->post('password_confirm')) {
			// POST
			$data['user_id']        = '';
			$data['user_password']  = password_hash($this->input->post('user_password'), PASSWORD_BCRYPT);
			$data['user_lastlogin'] = '';
			$data['user_photo']     = '';
			$data['group_id']       = 3;
			$data['createtime']     = date('Y-m-d H:i:s');
			$this->m_user->create($data);

			// ALERT
			$alertStatus  = "success";
			$alertMessage = "Berhasil menambah data user " . $data['user_name'];
			getAlert($alertStatus, $alertMessage);

			redirect('auth/');
		} else {

			// ALERT
			$alertStatus  = "failed";
			$alertMessage = "Password Tidak Sama ";
			getAlert($alertStatus, $alertMessage);

			redirect('auth/register/', $data);
		}
	}
}
