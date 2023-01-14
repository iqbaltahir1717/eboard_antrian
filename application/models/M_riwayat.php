<?php
defined('BASEPATH') or exit('No direct script access allowed');
class M_riwayat extends CI_Model
{
    function __construct()
    {
        parent::__construct();
    }

    public function read($start_date, $end_date, $spesialis_id)
    {
        $this->db->select('a.*, b.user_fullname, c.spesialis_nama');
        $this->db->from('tbl_riwayat_antrian a');
        $this->db->join('tbl_user b', 'a.user_id = b.user_id', 'LEFT');
        $this->db->join('tbl_spesialis c', 'a.spesialis_id = c.spesialis_id', 'LEFT');

        if ($spesialis_id != "") {
            $this->db->where("c.spesialis_id ", $spesialis_id);
        }

        if ($start_date != "" and $end_date != "") {
            $this->db->where("a.createtime >=", $start_date);
            $this->db->where("a.createtime <=", $end_date);
            $this->db->order_by("a.arrival_time", "ASC");
        } else {
            $this->db->order_by("a.arrival_time", "ASC");
        }


        $query = $this->db->get();
        if ($query->num_rows() > 0) {
            foreach ($query->result() as $row) {
                $data[] = $row;
            }
            return $data;
        }
        return null;
    }

    public function create($data)
    {
        $this->db->insert('tbl_riwayat_antrian', $data);
    }
    function __destruct()
    {
        $this->db->close();
    }

    public function count_kunjungan_bulan()
    {
        $date_now = date('Y-m');
        $query  = $this->db->query(" SELECT
            (SELECT count('user_id') FROM tbl_riwayat_antrian WHERE createtime = MONTH($date_now)) as total");
        return $query->result();
    }
}
