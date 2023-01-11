<?php
defined('BASEPATH') or exit('No direct script access allowed');
class M_antrian_saat_ini extends CI_Model
{

    function __construct()
    {
        parent::__construct();
    }


    public function create($data)
    {
        $this->db->insert('tbl_antrian', $data);
    }

    public function update($data)
    {
        $this->db->update('tbl_antrian_berjalan', $data, array('antrian_berjalan_id' => $data['antrian_berjalan_id']));
    }

    public function delete($id)
    {
        $this->db->delete('tbl_antrian', array('antrian_kode' => $id));
    }

    public function get($id)
    {
        $this->db->where('riwayat_id', $id);
        $query = $this->db->get('antrain_kode', 1);
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
}
