<?php defined('BASEPATH') or exit('No direct script access allowed');
class Riwayat extends CI_Controller
{
    function __construct()
    {
        parent::__construct();
        $this->load->model('m_riwayat');
        $this->load->model('m_spesialis');

        // check session data
        if (!$this->session->userdata('user_id') or $this->session->userdata('user_group') > 2) {
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
        $data['riwayat'] = $this->m_riwayat->read('', '', '');
        $data['spesialis'] = $this->m_spesialis->read('', '', '');

        if ($data['riwayat']) {
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
            $data["total_data"] =  $total_data;

            //average
            $array = array(1, 2, 3, 4, 5, 6);
            $i = 10;
            foreach ($array as $f) {
                $total_at = 0;
                foreach ($data["output"] as $key => $q) {
                    $total_at = $total_at + $q[$i];
                    $data["total_at"][] = [$total_at];
                }
                $total_end_at = end($data["total_at"]);

                if ($i >= 10 and $i <= 12) {
                    $total_data_average_at = $total_end_at[0] / $total_data;
                    $data['output1'] = date("H:i", $total_data_average_at);
                } else {
                    $total_data_average_at = $total_end_at[0];
                    $jam    = floor($total_data_average_at / (60 * 60));
                    $menit    = floor(($total_data_average_at - $jam * (60 * 60)) / 60);
                    if ($menit  < 10)
                        $data['output1'] = $jam . ":0" . $menit;
                    else  $data['output1'] = $jam . ":" . $menit;
                }
                $i++;
                $data['averages'][] = [$data['output1'], $total_data_average_at];
            }

            // waktu rata-rata pasien menunggu dalam antrian (TIQ)
            //waktu rata-rata pasien menunggu dalam sistem {TIS}
            for ($i = 4; $i < 6; $i++) {
                $menunggu = $data['averages'][$i][0];
                $jam2    = explode(":", $menunggu);
                $menit2    = (($jam2[0] * 60) + $jam2[1]);
                $data['menunggu'][] = [round($menit2 / $total_data, 1), $menit2, $menunggu];
            }
            // echo "<pre>";
            // print_r($data['menunggu']);
            // echo "</pre>";
            // die;

            // Tingkat kedatangan rata-rata persatuan waktu (AT), Tingkat pelayanan rata-rata persatuan waktu (SST)
            for ($i = 0; $i < 2; $i++) {
                $tingkat = $data['averages'][$i][1];
                $jam4    = explode(":", date("H:i", $tingkat));
                $menit4 = ($jam4[0] * 60) + $jam4[1];
                $data['tingkat'][] =  [round($total_data / $menit4, 6), $menit4];
            }

            //Tingkat Intensitas fasilitas pelayanan
            $y = round($data['tingkat'][0][0], 6);
            $n = round($data['tingkat'][1][0], 6);
            $data["K"] = round($y /  $n, 2);
            $data["W"] = abs(100 - $data["K"]);
            $data["ls"] = $data["K"] / $data["W"];
            $data["la"] = abs(pow($y, 2) / ($n * ($n - $y)));
            $data["ws"] = abs(1 / ($n - $y));
            $data["wa"] = abs($y  / ($n * ($n - $y)));
        } else {
            // ALERT
            $alertStatus  = 'failed';
            $alertMessage = "Tidak ada data <span class='label label-success label-inline font-weight-lighter mr-2'>" . $data['start_date'] . "</span> - <span class='label label-warning label-inline font-weight-lighter mr-2'>" . $data['end_date'] . "</span>";
            getAlert($alertStatus, $alertMessage);

            redirect('admin/riwayat');
        }

        // TEMPLATE
        $view         = "_backend/antrian_riwayat";
        $viewCategory = "all";
        renderTemplate($data, $view, $viewCategory);
    }

    public function search()
    {
        $data['start_date'] = $this->input->post('start_date');
        $data['end_date'] = $this->input->post('end_date');
        $data['spesialis_id'] = $this->input->post('spesialis_id');

        // if ($data['spesialis_id']) {
        //     $data['spesialis_id'] = '';
        // }

        //DATA
        $data['setting'] = getSetting();
        $data['title'] = 'Riwayat Antrian';
        $data['riwayat'] = $this->m_riwayat->read($data['start_date'], $data['end_date'], $data['spesialis_id']);
        $data['spesialis'] = $this->m_spesialis->read('', '', '');

        // echo "<pre>";
        // print_r($data['riwayat']);
        // echo "</pre>";
        // die;
        if ($data['riwayat']) {
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
            $data["total_data"] =  $total_data;

            //average
            $array = array(1, 2, 3, 4, 5, 6);
            $i = 10;
            foreach ($array as $f) {
                $total_at = 0;
                foreach ($data["output"] as $key => $q) {
                    $total_at = $total_at + $q[$i];
                    $data["total_at"][] = [$total_at];
                }
                $total_end_at = end($data["total_at"]);

                if ($i >= 10 and $i <= 12) {
                    $total_data_average_at = $total_end_at[0] / $total_data;
                    $data['output1'] = date("H:i", $total_data_average_at);
                } else {
                    $total_data_average_at = $total_end_at[0];
                    $jam    = floor($total_data_average_at / (60 * 60));
                    $menit    = floor(($total_data_average_at - $jam * (60 * 60)) / 60);
                    if ($menit  < 10)
                        $data['output1'] = $jam . ":0" . $menit;
                    else  $data['output1'] = $jam . ":" . $menit;
                }
                $i++;
                $data['averages'][] = [$data['output1'], $total_data_average_at];
            }

            // waktu rata-rata pasien menunggu dalam antrian (TIQ)
            //waktu rata-rata pasien menunggu dalam sistem {TIS}
            for ($i = 4; $i < 6; $i++) {
                $menunggu = $data['averages'][$i][0];
                $jam2    = explode(":", $menunggu);
                $menit2    = (($jam2[0] * 60) + $jam2[1]);
                $data['menunggu'][] = [round($menit2 / $total_data, 1), $menit2, $menunggu];
            }


            // Tingkat kedatangan rata-rata persatuan waktu (AT), Tingkat pelayanan rata-rata persatuan waktu (SST)
            for ($i = 0; $i < 2; $i++) {
                $tingkat = $data['averages'][$i][1];
                $jam4    = explode(":", date("H:i", $tingkat));
                $menit4 = ($jam4[0] * 60) + $jam4[1];
                $data['tingkat'][] =  [round($total_data / $menit4, 6), $menit4];
            }

            //Tingkat Intensitas fasilitas pelayanan
            $y = round($data['tingkat'][0][0], 6);
            $n = round($data['tingkat'][1][0], 6);
            $data["K"] = round($y /  $n, 2);
            $data["W"] = abs(100 - $data["K"]);
            $data["ls"] = $data["K"] / $data["W"];
            $data["la"] = abs(pow($y, 2) / ($n * ($n - $y)));
            $data["ws"] = abs(1 / ($n - $y));
            $data["wa"] = abs($y  / ($n * ($n - $y)));
        } else {
            // ALERT
            $alertStatus  = 'failed';
            $alertMessage = "Tidak ada data <span class='label label-success label-inline font-weight-lighter mr-2'>" . $data['start_date'] . "</span> - <span class='label label-warning label-inline font-weight-lighter mr-2'>" . $data['end_date'] . "</span>";
            getAlert($alertStatus, $alertMessage);

            redirect('admin/riwayat');
        }


        // TEMPLATE
        $view         = "_backend/antrian_riwayat";
        $viewCategory = "all";
        renderTemplate($data, $view, $viewCategory);
    }
}
