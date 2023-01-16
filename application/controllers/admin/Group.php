<?php
defined('BASEPATH') or exit('No direct script access allowed');
class Group extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('m_group');
        $this->load->model('m_user');
        $this->load->model('m_spesialis');
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
        $this->session->unset_userdata('sess_search_group');

        // PAGINATION
        $baseUrl    = base_url() . "admin/group/index/";
        $totalRows  = count((array) $this->m_group->read('', '', ''));
        $perPage    = $this->session->userdata('sess_rowpage');
        $uriSegment = 4;
        $paging     = generatePagination($baseUrl, $totalRows, $perPage, $uriSegment);
        $page       = ($this->uri->segment($uriSegment)) ? $this->uri->segment($uriSegment) : 0;

        $data['numbers']    = $paging['numbers'];
        $data['links']      = $paging['links'];
        $data['total_data'] = $totalRows;



        //DATA
        $data['setting'] = getSetting();
        $data['title']   = 'Group';
        $data['group']   = $this->m_group->read($perPage, $page, '');


        // TEMPLATE
        $view         = "_backend/master_data/group";
        $viewCategory = "all";
        renderTemplate($data, $view, $viewCategory);
    }


    public function search()
    {
        if ($this->input->post('key')) {
            $data['search'] = $this->input->post('key');
            $this->session->set_userdata('sess_search_group', $data['search']);
        } else {
            $data['search'] = $this->session->userdata('sess_search_group');
        }

        // PAGINATION
        $baseUrl    = base_url() . "admin/group/search/" . $data['search'] . "/";
        $totalRows  = count((array)$this->m_group->read('', '', $data['search']));
        $perPage    = $this->session->userdata('sess_rowpage');
        $uriSegment = 5;
        $paging     = generatePagination($baseUrl, $totalRows, $perPage, $uriSegment);
        $page       = ($this->uri->segment($uriSegment)) ? $this->uri->segment($uriSegment) : 0;

        $data['numbers']    = $paging['numbers'];
        $data['links']      = $paging['links'];
        $data['total_data'] = $totalRows;

        //DATA
        $data['setting'] = getSetting();
        $data['title']   = 'Group';
        $data['group']   = $this->m_group->read($perPage, $page, $data['search']);

        // TEMPLATE
        $view         = "_backend/master_data/group";
        $viewCategory = "all";
        renderTemplate($data, $view, $viewCategory);
    }


    public function create()
    {
        csrfValidate();
        // POST
        $data['group_id']   = '';
        $data['group_name'] = $this->input->post('group_name');
        $data['createtime'] = date('Y-m-d H:i:s');
        $this->m_group->create($data);

        // LOG
        $message    = $this->session->userdata('user_name') . " menambah data group " . $data['group_name'];
        createLog($message);

        // ALERT
        $alertStatus  = "success";
        $alertMessage = "Berhasil menambah data group " . $data['group_name'];
        getAlert($alertStatus, $alertMessage);

        redirect('admin/group');
    }


    public function update()
    {
        csrfValidate();
        // POST
        $data['group_id']      = $this->input->post('group_id');
        $data['group_name']    = $this->input->post('group_name');
        $this->m_group->update($data);

        // LOG
        $message    = $this->session->userdata('user_name') . " mengubah data group dengan ID = " . $data['group_id'] . " - " . $data['group_name'];
        createLog($message);

        // ALERT
        $alertStatus  = "success";
        $alertMessage = "Berhasil mengubah data group : " . $data['group_name'];
        getAlert($alertStatus, $alertMessage);

        redirect('admin/group');
    }


    public function delete()
    {
        csrfValidate();
        // POST
        $this->m_group->delete($this->input->post('group_id'));

        // LOG
        $message    = $this->session->userdata('user_name') . " menghapus data group dengan ID = " . $this->input->post('group_id') . " - " . $this->input->post('group_name');
        createLog($message);

        // ALERT
        $alertStatus  = "failed";
        $alertMessage = "Menghapus data group : " . $this->input->post('group_name');
        getAlert($alertStatus, $alertMessage);

        redirect('admin/group');
    }

    public function spesialis()
    {
        $this->session->unset_userdata('sess_search_spesialis');

        // PAGINATION
        $baseUrl    = base_url() . "admin/spesialis/index/";
        $totalRows  = count((array) $this->m_spesialis->read('', '', ''));
        $perPage    = $this->session->userdata('sess_rowpage');
        $uriSegment = 4;
        $paging     = generatePagination($baseUrl, $totalRows, $perPage, $uriSegment);
        $page       = ($this->uri->segment($uriSegment)) ? $this->uri->segment($uriSegment) : 0;

        $data['numbers']    = $paging['numbers'];
        $data['links']      = $paging['links'];
        $data['total_data'] = $totalRows;

        //DATA
        $data['setting'] = getSetting();
        $data['title']   = 'Spesialis';
        $data['spesialis']   = $this->m_spesialis->read($perPage, $page, '');
        $data['dokter']   = $this->m_user->read_group('', '', '', 4);


        // TEMPLATE
        $view         = "_backend/master_data/spesialis";
        $viewCategory = "all";
        renderTemplate($data, $view, $viewCategory);
    }

    public function spesialis_search()
    {
        if ($this->input->post('key')) {
            $data['search'] = $this->input->post('key');
            $this->session->set_userdata('sess_search_spesialis', $data['search']);
        } else {
            $data['search'] = $this->session->userdata('sess_search_spesialis');
        }

        // PAGINATION
        $baseUrl    = base_url() . "admin/group/spesialis_search/" . $data['search'] . "/";
        $totalRows  = count((array)$this->m_spesialis->read('', '', $data['search']));
        $perPage    = $this->session->userdata('sess_rowpage');
        $uriSegment = 5;
        $paging     = generatePagination($baseUrl, $totalRows, $perPage, $uriSegment);
        $page       = ($this->uri->segment($uriSegment)) ? $this->uri->segment($uriSegment) : 0;

        $data['numbers']    = $paging['numbers'];
        $data['links']      = $paging['links'];
        $data['total_data'] = $totalRows;

        //DATA
        $data['setting'] = getSetting();
        $data['title']   = 'Spesialis';
        $data['spesialis']   = $this->m_spesialis->read($perPage, $page, $data['search']);

        // TEMPLATE
        $view         = "_backend/master_data/spesialis";
        $viewCategory = "all";
        renderTemplate($data, $view, $viewCategory);
    }

    public function spesialis_create()
    {
        csrfValidate();
        // POST
        $data['spesialis_id']   = '';
        $data['spesialis_nama'] = $this->input->post('spesialis_nama');
        $data['user_id'] = $this->input->post('user_id');
        $data['spesialis_active'] = $this->input->post('spesialis_active');
        $this->m_spesialis->create($data);

        // LOG
        $message    = $this->session->userdata('user_name') . " menambah data spesialis " . $data['spesialis_nama'];
        createLog($message);

        // ALERT
        $alertStatus  = "success";
        $alertMessage = "Berhasil menambah data spesialis " . $data['spesialis_nama'];
        getAlert($alertStatus, $alertMessage);

        redirect('admin/group/spesialis');
    }

    public function spesialis_update()
    {
        csrfValidate();
        // POST
        $data['spesialis_id']   = $this->input->post('spesialis_id');
        $data['spesialis_nama'] = $this->input->post('spesialis_nama');
        $data['user_id'] = $this->input->post('user_id');
        $data['spesialis_active'] = $this->input->post('spesialis_active');
        $this->m_spesialis->update($data);

        // LOG
        $message    = $this->session->userdata('user_name') . " mengubah data spesialis dengan ID = " . $data['spesialis_id'] . " - " . $data['spesialis_nama'];
        createLog($message);

        // ALERT
        $alertStatus  = "success";
        $alertMessage = "Berhasil mengubah data spesialis : " . $data['spesialis_nama'];
        getAlert($alertStatus, $alertMessage);

        redirect('admin/group/spesialis');
    }


    public function spesialis_delete()
    {
        csrfValidate();
        // POST
        $this->m_spesialis->delete($this->input->post('spesialis_id'));

        // LOG
        $message    = $this->session->userdata('user_name') . " menghapus data spesialis dengan ID = " . $this->input->post('spesialis_id') . " - " . $this->input->post('spesialis_nama');
        createLog($message);

        // ALERT
        $alertStatus  = "failed";
        $alertMessage = "Menghapus data spesialis : " . $this->input->post('spesialis_nama');
        getAlert($alertStatus, $alertMessage);

        redirect('admin/group/spesialis');
    }
}
