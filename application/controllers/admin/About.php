<?php
defined('BASEPATH') or exit('No direct script access allowed');
class About extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
        if (!$this->session->userdata('user_id') or $this->session->userdata('user_group') > 3) {
            // ALERT
            $alertStatus  = 'failed';
            $alertMessage = 'Anda tidak memiliki Hak Akses atau Session anda sudah habis';
            getAlert($alertStatus, $alertMessage);
            redirect('admin/dashboard');
        }
    }

    public function index()
    {
        //DATA
        $data['setting'] = getSetting();
        $data['title']   = 'Tentang Aplikasi & Aplikasi';
        // TEMPLATE
        $view         = "_backend/about";
        $viewCategory = "all";
        renderTemplate($data, $view, $viewCategory);
    }
}
