<?php
defined('BASEPATH') or exit('No direct script access allowed');
class User extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('m_user');
        $this->load->model('m_group');

        if (!$this->session->userdata('user_id') or $this->session->userdata('user_group') > 2) {
            // ALERT
            $alertStatus  = 'failed';
            $alertMessage = 'Anda tidak memiliki Hak Akses atau Session anda sudah habis';
            getAlert($alertStatus, $alertMessage);
            redirect('admin/dashboard');
        }
    }


    public function index()
    {
        $this->session->unset_userdata('sess_search_user');
        $data['group_name'] = '';

        // PAGINATION
        $baseUrl    = base_url() . "admin/user/index/";
        $totalRows  = count((array) $this->m_user->read('', '', '', ''));
        $perPage    = $this->session->userdata('sess_rowpage');
        $uriSegment = 4;
        $paging     = generatePagination($baseUrl, $totalRows, $perPage, $uriSegment);
        $page       = ($this->uri->segment($uriSegment)) ? $this->uri->segment($uriSegment) : 0;

        $data['numbers']    = $paging['numbers'];
        $data['links']      = $paging['links'];
        $data['total_data'] = $totalRows;

        //DATA
        $data['setting'] = getSetting();
        $data['title']   = 'User';
        $data['user']    = $this->m_user->read($perPage, $page, '', '');
        $data['group']   = $this->m_group->read('', '', '');


        // TEMPLATE
        $view         = "_backend/master_data/user";
        $viewCategory = "all";
        renderTemplate($data, $view, $viewCategory);
    }

    public function pasien()
    {
        $this->session->unset_userdata('sess_search_user_pasien');
        $data['group_name'] = 'pasien';

        // PAGINATION
        $baseUrl    = base_url() . "admin/user/pasien/";
        $totalRows  = count((array) $this->m_user->read('', '', '', 3));
        $perPage    = $this->session->userdata('sess_rowpage');
        $uriSegment = 4;
        $paging     = generatePagination($baseUrl, $totalRows, $perPage, $uriSegment);
        $page       = ($this->uri->segment($uriSegment)) ? $this->uri->segment($uriSegment) : 0;

        $data['numbers']    = $paging['numbers'];
        $data['links']      = $paging['links'];
        $data['total_data'] = $totalRows;

        //DATA
        $data['setting'] = getSetting();
        $data['title']   = 'User Pasien';
        $data['user']    = $this->m_user->read_group($perPage, $page, '', 3);
        $data['group']   = $this->m_group->read_user(3);

        // TEMPLATE
        $view         = "_backend/master_data/user";
        $viewCategory = "all";
        renderTemplate($data, $view, $viewCategory);
    }

    public function admin()
    {
        $this->session->unset_userdata('sess_search_user_pasien');
        $data['group_name'] = 'admin';

        // PAGINATION
        $baseUrl    = base_url() . "admin/user/admin/";
        $totalRows  = count((array) $this->m_user->read('', '', '',  2));
        $perPage    = $this->session->userdata('sess_rowpage');
        $uriSegment = 4;
        $paging     = generatePagination($baseUrl, $totalRows, $perPage, $uriSegment);
        $page       = ($this->uri->segment($uriSegment)) ? $this->uri->segment($uriSegment) : 0;

        $data['numbers']    = $paging['numbers'];
        $data['links']      = $paging['links'];
        $data['total_data'] = $totalRows;

        //DATA
        $data['setting'] = getSetting();
        $data['title']   = 'User Admin';
        $data['user']    = $this->m_user->read_group($perPage, $page, '',  2);
        $data['group']   = $this->m_group->read_user(2);


        // TEMPLATE
        $view         = "_backend/master_data/user";
        $viewCategory = "all";
        renderTemplate($data, $view, $viewCategory);
    }

    public function dokter()
    {
        $this->session->unset_userdata('sess_search_user_pasien');
        $data['group_name'] = 'dokter';

        // PAGINATION
        $baseUrl    = base_url() . "admin/user/dokter/";
        $totalRows  = count((array) $this->m_user->read('', '', '', 4));
        $perPage    = $this->session->userdata('sess_rowpage');
        $uriSegment = 4;
        $paging     = generatePagination($baseUrl, $totalRows, $perPage, $uriSegment);
        $page       = ($this->uri->segment($uriSegment)) ? $this->uri->segment($uriSegment) : 0;

        $data['numbers']    = $paging['numbers'];
        $data['links']      = $paging['links'];
        $data['total_data'] = $totalRows;

        //DATA
        $data['setting'] = getSetting();
        $data['title']   = 'User Dokter';
        $data['user']    = $this->m_user->read_group($perPage, $page, '', 4);
        $data['group']   = $this->m_group->read_user(4);

        // TEMPLATE
        $view         = "_backend/master_data/user";
        $viewCategory = "all";
        renderTemplate($data, $view, $viewCategory);
    }


    public function search()
    {
        if ($this->input->post('key')) {
            $data['search'] = $this->input->post('key');
            $this->session->set_userdata('sess_search_user', $data['search']);
        } else {
            $data['search'] = $this->session->userdata('sess_search_user');
        }

        $data['group_name'] = '';

        // PAGINATION
        $baseUrl    = base_url() . "admin/user/search/" . $data['search'] . "/";
        $totalRows  = count((array)$this->m_user->read('', '', $data['search']));
        $perPage    = $this->session->userdata('sess_rowpage');
        $uriSegment = 5;
        $paging     = generatePagination($baseUrl, $totalRows, $perPage, $uriSegment);
        $page       = ($this->uri->segment($uriSegment)) ? $this->uri->segment($uriSegment) : 0;

        $data['numbers']    = $paging['numbers'];
        $data['links']      = $paging['links'];
        $data['total_data'] = $totalRows;

        //DATA
        $data['setting'] = getSetting();
        $data['title']   = 'User';
        $data['user']    = $this->m_user->read($perPage, $page, $data['search']);
        $data['group']   = $this->m_group->read('', '', '');

        // TEMPLATE
        $view         = "_backend/master_data/user";
        $viewCategory = "all";
        renderTemplate($data, $view, $viewCategory);
    }


    public function create()
    {
        csrfValidate();
        // POST
        $data['user_id']        = '';
        $data['user_password']  = password_hash($this->input->post('user_password'), PASSWORD_BCRYPT);
        $data['user_fullname']  = $this->input->post('user_fullname');
        $data['user_phone']     = $this->input->post('user_phone');
        $data['user_lastlogin'] = '';
        $data['user_photo']     = '';
        $data['group_id']       = $this->input->post('group_id');
        $data['createtime']     = date('Y-m-d H:i:s');
        $this->m_user->create($data);

        $group_name     = $this->input->post('group_name');
        // LOG
        $message    = $this->session->userdata('user_fullname') . " menambah data user " . $data['user_fullname'];
        createLog($message);

        // ALERT
        $alertStatus  = "success";
        $alertMessage = "Berhasil menambah data user " . $data['user_fullname'];
        getAlert($alertStatus, $alertMessage);

        if ($group_name == null) {
            redirect('admin/user/');
        } else {
            redirect('admin/user/' .   $group_name);
        }
    }


    public function update()
    {
        csrfValidate();
        // POST
        $data['user_id']       = $this->input->post('user_id');

        if ($this->input->post('user_password') != "") {
            $data['user_password'] = password_hash($this->input->post('user_password'), PASSWORD_BCRYPT);
        }

        $data['user_fullname'] = $this->input->post('user_fullname');
        $data['user_phone']    = $this->input->post('user_phone');
        $data['group_id']      = $this->input->post('group_id');
        $this->m_user->update($data);

        $data['group_name']     = $this->input->post('group_name');

        // LOG
        $message    = $this->session->userdata('user_fullname') . " mengubah data user dengan ID = " . $data['user_id'] . " - " . $data['user_fullname'];
        createLog($message);

        // ALERT
        $alertStatus  = "success";
        $alertMessage = "Berhasil mengubah data user : " . $data['user_fullname'];
        getAlert($alertStatus, $alertMessage);

        redirect('admin/user/' .  $data['group_name']);
    }


    public function delete()
    {
        csrfValidate();
        // POST
        $this->m_user->delete($this->input->post('user_id'));

        // LOG
        $message    = $this->session->userdata('user_fullname') . " menghapus data user dengan ID = " . $this->input->post('user_id') . " - " . $this->input->post('user_fullname');
        createLog($message);

        // ALERT
        $alertStatus  = "failed";
        $alertMessage = "Menghapus data user : " . $this->input->post('user_fullname');
        getAlert($alertStatus, $alertMessage);

        redirect('admin/user');
    }
}
