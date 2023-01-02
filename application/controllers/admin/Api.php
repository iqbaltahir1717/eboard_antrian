<?php
defined('BASEPATH') or exit('No direct script access allowed');
class Api extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('m_api');
    }


    public function get_kumpulan_doa()
    {
        header("Access-Control-Allow-Origin: *");
        header("Content-Type: application/json; charset=UTF-8");
        http_response_code(200);


        $doa    = $this->m_api->getKumpulanDoa();
        $resultData = $doa;

        echo json_encode($resultData, JSON_PRETTY_PRINT);
    }

    public function detail_doa()
    {
        header("Access-Control-Allow-Origin: *");
        header("Content-Type: application/json; charset=UTF-8");
        http_response_code(200);

        $doa    = $this->m_api->get_detail_doa(29);
        $resultData = array(
            'respon_code' => 'RC200',
            'status'      => true,
            'message'     => 'Data Profil Saya',
            'data'        => array(
                'doa' => $doa,
            ),
        );

        echo json_encode($resultData, JSON_PRETTY_PRINT);
    }
}
