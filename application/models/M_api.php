<?php
defined('BASEPATH') or exit('No direct script access allowed');
class M_api extends CI_Model
{

    function __construct()
    {
        parent::__construct();
    }


    public function getKumpulanDoa()
    {
        $this->db->select('a.*, b.riwayat_name, c.user_fullname, d.kategori_name');
        $this->db->from('tbl_doa a');
        $this->db->join('tbl_riwayat b', 'a.riwayat_id=b.riwayat_id', 'LEFT');
        $this->db->join('tbl_user c', 'a.user_id=c.user_id', 'LEFT');
        $this->db->join('tbl_kategori d', 'a.kategori_id=d.kategori_id', 'LEFT');

        $this->db->order_by('a.doa_id', 'DESC');
        $query = $this->db->get();
        if ($query->num_rows() > 0) {
            foreach ($query->result() as $row) {
                $data[] = $row;
            }
            return $data;
        }
        return null;
    }

    public function get_detail_doa($id)
    {
        $this->db->select('*');
        $this->db->from('tbl_doa');
        $this->db->where('doa_id', $id);
        $query = $this->db->get();
        return $query->result();
    }

    public function get_doa()
    {
        $this->db->select('*');
        $this->db->from('tbl_doa');
        $query = $this->db->get();
        return $query->result();
    }
}
