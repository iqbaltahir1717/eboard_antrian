<?php
defined('BASEPATH') or exit('No direct script access allowed');
class M_antrian extends CI_Model
{

    function __construct()
    {
        parent::__construct();
    }

    public function read($limit, $start, $key)
    {
        $date = date('Y-m-d');
        $this->db->select('a.*, b.user_fullname, c.spesialis_nama');
        $this->db->from('tbl_antrian a');
        $this->db->join('tbl_user b', 'a.user_id=b.user_id', 'LEFT');
        $this->db->join('tbl_spesialis c', 'a.spesialis_id=c.spesialis_id', 'LEFT');
        $this->db->where('a.createtime =', $date);
        $this->db->order_by('a.antrian_nomor', 'ASC');

        if ($key != '') {
            $this->db->like("user_fullname", $key);
            $this->db->or_like("antrain_kode", $key);
        }

        if ($limit != "" or $start != "") {
            $this->db->limit($limit, $start);
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

    public function check_data_count($psesialis)
    {
        $this->db->select('a.*, b.user_fullname, c.spesialis_nama');
        $this->db->from('tbl_antrian a');
        $this->db->join('tbl_user b', 'a.user_id=b.user_id', 'LEFT');
        $this->db->join('tbl_spesialis c', 'a.spesialis_id=c.spesialis_id', 'LEFT');
        $this->db->where('a.spesialis_id =', $psesialis);

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
        $this->db->insert('tbl_antrian', $data);
    }

    public function update($data)
    {
        $this->db->update('tbl_antrian', $data, array('antrian_kode' => $data['antrian_kode']));
    }

    public function update_antrian_berikutnya($data)
    {
        $this->db->update('tbl_antrian', $data, array('antrian_nomor' => $data['antrian_nomor']));
    }

    public function delete($data)
    {
        $this->db->delete('tbl_antrian', array('antrian_nomor' => $data['antrian_nomor']));
    }

    public function delete_eboard($data)
    {
        $this->db->delete('tbl_antrian', array('antrian_kode' => $data['antrian_kode']));
    }

    // public function get($id)
    // {
    //     $this->db->where('riwayat_id', $id);
    //     $query = $this->db->get('antrain_kode', 1);
    //     return $query->result();
    // }
    public function get($id)
    {
        $this->db->where('user_id', $id);
        $query = $this->db->get('tbl_antrian', 1);
        return $query->result();
    }

    public function get_antrian($id)
    {
        $this->db->select('*');
        $this->db->where('spesialis_id', $id);
        $query = $this->db->get('tbl_antrian');
        return $query->result();
    }

    function __destruct()
    {
        $this->db->close();
    }

    public function widget()
    {
        $query  = $this->db->query(" SELECT
            (SELECT count(tbl_antrian) FROM tbl_riwayat) as total");
        return $query->result();
    }

    public function validate($user_id)
    {
        $this->db->select("*");
        $this->db->from('tbl_antrian');
        $this->db->where('user_id', $user_id);
        $query = $this->db->get();
        if ($query->num_rows() > 0) {
            foreach ($query->result() as $row) {
                $data[] = $row;
            }
            return $data;
        }
        return false;
    }

    public function count_kunjungan()
    {
        $query  = $this->db->query(" SELECT
            (SELECT count('user_id') FROM tbl_antrian) as total");
        return $query->result();
    }
}
