<?php
defined('BASEPATH') or exit('No direct script access allowed');
class M_doa extends CI_Model
{

    function __construct()
    {
        parent::__construct();
    }

    public function read($limit, $start, $key, $category, $field)
    {
        $this->db->select('a.*, b.riwayat_name, c.user_fullname, d.kategori_name');
        $this->db->from('tbl_doa a');
        $this->db->join('tbl_riwayat b', 'a.riwayat_id=b.riwayat_id', 'LEFT');
        $this->db->join('tbl_user c', 'a.user_id=c.user_id', 'LEFT');
        $this->db->join('tbl_kategori d', 'a.kategori_id=d.kategori_id', 'LEFT');

        if ($category != "") {
            $this->db->where('a.kategori_id', $category);
        }

        if ($field != "") {
            $this->db->where('a.riwayat_id', $field);
        }

        if ($key != '') {
            $this->db->like("a.doa_title", $key);
            $this->db->or_like("b.riwayat_name", $key);
            $this->db->or_like("c.user_fullname", $key);
            $this->db->or_like("d.kategori_name", $key);
        }

        if ($limit != "" or $start != "") {
            $this->db->limit($limit, $start);
        }

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

    public function create($data)
    {
        $this->db->insert('tbl_doa', $data);
    }

    public function update($data)
    {
        $this->db->update('tbl_doa', $data, array('doa_id' => $data['doa_id']));
    }
    public function delete($id)
    {
        $this->db->delete('tbl_doa', array('doa_id' => $id));
    }

    public function get($id)
    {
        $this->db->where('doa_id', $id);
        $query = $this->db->get('tbl_doa', 1);
        return $query->result();
    }


    public function getBySlug($slug)
    {
        $this->db->select('a.*, b.riwayat_name, c.user_fullname, d.kategori_name');
        $this->db->from('tbl_doa a');
        $this->db->join('tbl_riwayat b', 'a.riwayat_id=b.riwayat_id', 'LEFT');
        $this->db->join('tbl_user c', 'a.user_id=c.user_id', 'LEFT');
        $this->db->join('tbl_kategori d', 'a.kategori_id=d.kategori_id', 'LEFT');
        $this->db->where('doa_slug', $slug);
        $query = $this->db->get();
        return $query->result();
    }

    function __destruct()
    {
        $this->db->close();
    }

    public function widget()
    {
        $query  = $this->db->query(" SELECT
            (SELECT count(doa_id) FROM tbl_doa) as total");
        return $query->result();
    }
}
