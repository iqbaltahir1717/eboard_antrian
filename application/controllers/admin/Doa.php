<?php
defined('BASEPATH') or exit('No direct script access allowed');
class Doa extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('m_doa');
        $this->load->model('m_kategori');
        $this->load->model('m_riwayat');
        $this->load->library('upload');

        if (!($this->session->userdata('user_id'))) {
            // ALERT
            $alertStatus  = 'failed';
            $alertMessage = 'Anda tidak memiliki Hak Akses atau Session anda sudah habis';
            getAlert($alertStatus, $alertMessage);
            redirect('auth');
        }
    }


    public function index()
    {
        $this->session->unset_userdata('sess_search_doa');

        // PAGINATION
        $baseUrl    = base_url() . "admin/doa/index/";
        $totalRows  = count((array) $this->m_doa->read('', '', '', '', ''));
        $perPage    = $this->session->userdata('sess_rowpage');
        $uriSegment = 4;
        $paging     = generatePagination($baseUrl, $totalRows, $perPage, $uriSegment);
        $page       = ($this->uri->segment($uriSegment)) ? $this->uri->segment($uriSegment) : 0;

        $data['numbers']    = $paging['numbers'];
        $data['links']      = $paging['links'];
        $data['total_data'] = $totalRows;



        //DATA
        $data['setting'] = getSetting();
        $data['title']   = 'Kumpulan Doa';
        $data['doa']    = $this->m_doa->read($perPage, $page, '', '', '');
        $data['riwayat']         = $this->m_riwayat->read('', '', '');


        // TEMPLATE
        $view         = "_backend/doa/data";
        $viewCategory = "all";
        renderTemplate($data, $view, $viewCategory);
    }


    public function search()
    {
        if ($this->input->post('key')) {
            $data['search'] = $this->input->post('key');
            $this->session->set_userdata('sess_search_doa', $data['search']);
        } else {
            $data['search'] = $this->session->userdata('sess_search_doa');
        }

        // PAGINATION
        $baseUrl    = base_url() . "admin/doa/search/" . $data['search'] . "/";
        $totalRows  = count((array)$this->m_doa->read('', '', $data['search'], '', ''));
        $perPage    = $this->session->userdata('sess_rowpage');
        $uriSegment = 5;
        $paging     = generatePagination($baseUrl, $totalRows, $perPage, $uriSegment);
        $page       = ($this->uri->segment($uriSegment)) ? $this->uri->segment($uriSegment) : 0;

        $data['numbers']    = $paging['numbers'];
        $data['links']      = $paging['links'];
        $data['total_data'] = $totalRows;

        //DATA
        $data['setting'] = getSetting();
        $data['title']   = 'Kumpulan Doa';
        $data['doa']    = $this->m_doa->read($perPage, $page, $data['search'], '', '');
        $data['riwayat']         = $this->m_riwayat->read('', '', '');

        // TEMPLATE
        $view         = "_backend/doa/data";
        $viewCategory = "all";
        renderTemplate($data, $view, $viewCategory);
    }


    public function create_page()
    {
        //DATA
        $data['setting']       = getSetting();
        $data['title']         = 'Tambah Doa';
        $data['riwayat']         = $this->m_riwayat->read('', '', '',);
        $data['kategori'] = $this->m_kategori->read('', '', '');

        // TEMPLATE
        $view         = "_backend/doa/_create";
        $viewCategory = "all";
        renderTemplate($data, $view, $viewCategory);
    }


    public function update_page()
    {
        //DATA
        $data['setting']       = getSetting();
        $data['title']         = 'Update Doa';
        $data['doa']          = $this->m_doa->get($this->uri->segment(4));
        $data['riwayat']         = $this->m_riwayat->read('', '', '');
        $data['kategori'] = $this->m_kategori->read('', '', '');

        // TEMPLATE
        $view         = "_backend/doa/_update";
        $viewCategory = "all";
        renderTemplate($data, $view, $viewCategory);
    }


    public function detail_page()
    {
        //DATA
        $data['setting']       = getSetting();
        $data['title']         = 'Detail Doa';
        $data['doa']          = $this->m_doa->get($this->uri->segment(4));
        $data['riwayat']         = $this->m_riwayat->read('', '', '');
        $data['kategori'] = $this->m_kategori->read('', '', '');

        // TEMPLATE
        $view         = "_backend/doa/_detail";
        $viewCategory = "all";
        renderTemplate($data, $view, $viewCategory);
    }


    public function create()
    {
        csrfValidate();
        // POST
        $data['doa_id']          = '';
        $data['doa_title']       = $this->input->post('doa_title');
        $data['doa_sumber']       = $this->input->post('doa_sumber');
        $data['doa_text']        = $this->input->post('doa_text');
        $data['doa_date']        = date('Y-m-d');
        $data['doa_count_view']  = 0;
        $data['doa_slug']        = url_title($data['doa_title'], 'dash', true);
        if ($this->input->post('riwayat_id') == null) {
            $data['riwayat_id']  = "-";
            $data['kategori_id'] = $this->input->post('kategori_id');
            $data['tingkat_hadits'] = "-";
        } else {
            $data['riwayat_id']         = implode(', ', $this->input->post('riwayat_id'));
            $data['kategori_id'] = $this->input->post('kategori_id');
            $data['tingkat_hadits'] = $this->input->post('tingkat_hadits');
        }

        $data['user_id']          = $this->session->userdata('user_id');
        $data['createtime']       = date('Y-m-d H:i:s');
        $this->m_doa->create($data);

        // LOG
        $message    = $this->session->userdata('user_name') . " menambah data informasi ";
        createLog($message);

        // ALERT
        $alertStatus  = "success";
        $alertMessage = "Berhasil menambah data informasi ";
        getAlert($alertStatus, $alertMessage);

        redirect('admin/doa');
    }


    public function update()
    {
        csrfValidate();

        // POST
        $data['doa_id']          = $this->input->post('doa_id');
        $data['doa_title']       = $this->input->post('doa_title');
        $data['doa_sumber']       = $this->input->post('doa_sumber');
        $data['doa_text']        = $this->input->post('doa_text');
        $data['doa_slug']        = url_title($data['doa_title'], 'dash', true);
        if ($this->input->post('riwayat_id') == null) {
            $data['riwayat_id']  = "-";
            $data['kategori_id'] = $this->input->post('kategori_id');
            $data['tingkat_hadits'] = "-";
        } else {
            $data['riwayat_id']         = implode(', ', $this->input->post('riwayat_id'));
            $data['kategori_id'] = $this->input->post('kategori_id');
            $data['tingkat_hadits'] = $this->input->post('tingkat_hadits');
        }
        $this->m_doa->update($data);

        // LOG
        $message    = $this->session->userdata('user_name') . " mengubah data doa dengan ID = " . $data['doa_id'];
        createLog($message);

        // ALERT
        $alertStatus  = "success";
        $alertMessage = "Berhasil mengubah data doa ID : " . $data['doa_id'];
        getAlert($alertStatus, $alertMessage);




        redirect('admin/doa');
    }


    public function delete()
    {
        csrfValidate();
        // POST
        $this->m_doa->delete($this->input->post('doa_id'));

        // LOG
        $message    = $this->session->userdata('user_name') . " menghapus data doa dengan ID = " . $this->input->post('doa_id');
        createLog($message);

        // ALERT
        $alertStatus  = "failed";
        $alertMessage = "Menghapus data doa ID : " . $this->input->post('doa_id');
        getAlert($alertStatus, $alertMessage);

        redirect('admin/doa');
    }
}
