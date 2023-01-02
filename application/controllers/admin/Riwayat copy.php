<?php defined('BASEPATH') or exit('No direct script access allowed');
class Riwayat extends CI_Controller
{
    function __construct()
    {
        parent::__construct();
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
        $data['title'] = 'Riwayat Antrian';
        $data['riwayat'] = $this->m_riwayat->read('', '');

        foreach ($data['riwayat'] as $key) {
            $arrival_time =     date("H:i", strtotime($key->arrival_time));
            $service_start_time =    date("H:i", strtotime($key->service_start_time));
            $service_end_time =      date("H:i", strtotime($key->service_end_time));
            $arrival_time2 =     strtotime($key->arrival_time);
            $service_start_time2 =    strtotime($key->service_start_time);
            $service_end_time2 =     strtotime($key->service_end_time);

            //selisih_ST
            $diff_st    = $service_end_time2 - $service_start_time2;
            $jam_st    = floor($diff_st / (60 * 60));
            $menit_st    = floor(($diff_st - $jam_st * (60 * 60)) / 60);
            if ($menit_st  < 10)
                $output_st = $jam_st . ":0" . $menit_st;
            else  $output_st = $jam_st . ":" . $menit_st;

            //selisih_TIQ
            $diff_tiq   = $service_start_time2 - $arrival_time2;
            $jam_tiq    = floor($diff_tiq / (60 * 60));
            $menit_tiq    = floor(($diff_tiq - $jam_tiq * (60 * 60)) / 60);
            if ($menit_tiq  < 10)
                $output_tiq = $jam_tiq . ":0" . $menit_tiq;
            else  $output_tiq = $jam_tiq . ":" . $menit_tiq;

            //selisih_TIS
            $diff_tis   = $service_end_time2 - $arrival_time2;
            $jam_tis    = floor($diff_tis / (60 * 60));
            $menit_tis    = floor(($diff_tis - $jam_tis * (60 * 60)) / 60);
            if ($menit_tis  < 10)
                $output_tis = $jam_tis . ":0" . $menit_tis;
            else  $output_tis = $jam_tis . ":" . $menit_tis;

            $data["output"][] = [$key->createtime, $key->user_fullname, $key->spesialis_nama, $key->antrian_nomor, $arrival_time, $service_start_time, $service_end_time,  $output_st, $output_tiq, $output_tis, $arrival_time2, $service_start_time2, $service_end_time2, $diff_st, $diff_tiq, $diff_tis];
        }

        $total_data = count($data['riwayat']);

        //average_at_sst_set
        $array = array(1, 2, 3);
        $i = 10;
        foreach ($array as $f) {
            $total_at = 0;
            foreach ($data["output"] as $key => $q) {
                $total_at = $total_at + $q[$i];
                $data["total_at"][] = [$total_at];
            }
            $total_end_at = end($data["total_at"]);
            $total_data_average_at = $total_end_at[0] / $total_data;
            $data['output1'] = date("H:i", $total_data_average_at);
            $i++;
            $data['averages'][] = [$data['output1']];
        }

        //average_st
        $total_st = 0;
        foreach ($data["output"] as $key => $r) {
            $total_st = $total_st + $r[13];
            $data["average_st"][] = [$total_st];
        }
        $total_end_st = end($data["average_st"]);
        $total_data_average_st = $total_end_st[0] / $total_data;
        $jam    = floor($total_data_average_st / (60 * 60));
        $menit    = floor(($total_data_average_st - $jam * (60 * 60)) / 60);
        if ($menit  < 10)
            $total_ends_st = $jam . ":0" . $menit;
        else  $total_ends_st = $jam . ":" . $menit;
        $data['average_sts'] = $total_ends_st;

        //average_tiq
        $total_tiq = 0;
        foreach ($data["output"] as $key => $r) {
            $total_tiq = $total_tiq + $r[14];
            $data["average_tiq"][] = [$total_tiq];
        }
        $total_end_tiq = end($data["average_tiq"]);
        $total_data_average_tiq = $total_end_tiq[0] / $total_data;
        $jam_2    = floor($total_data_average_tiq / (60 * 60));
        $menit_2    = floor(($total_data_average_tiq - $jam_2 * (60 * 60)) / 60);
        if ($menit_2  < 10)
            $total_ends_tiq = $jam_2 . ":0" . $menit_2;
        else  $total_ends_tiq = $jam_2 . ":" . $menit_2;
        $data['average_tiqs'] = $total_ends_tiq;

        //average_tis
        $total_tis = 0;
        foreach ($data["output"] as $key => $r) {
            $total_tis = $total_tis + $r[15];
            $data["average_tis"][] = [$total_tis];
        }
        $total_end_tis = end($data["average_tis"]);
        $total_data_average_tis = $total_end_tis[0] / $total_data;
        $jam_3    = floor($total_data_average_tis / (60 * 60));
        $menit_3    = floor(($total_data_average_tis - $jam_3 * (60 * 60)) / 60);
        if ($menit_3  < 10)
            $total_ends_tis = $jam_3 . ":0" . $menit_3;
        else  $total_ends_tis = $jam_3 . ":" . $menit_3;
        $data['average_tiss'] = $total_ends_tis;


        // echo "<pre>";
        // print_r($data['average_tis']);
        // echo "</pre>";
        // die;

        // TEMPLATE
        $view         = "_backend/antrian_riwayat";
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
}
