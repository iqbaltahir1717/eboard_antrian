<?php
defined('BASEPATH') or exit('No direct script access allowed');
class M_panduan extends CI_Model
{

    function __construct()
    {
        parent::__construct();
    }

    public function read($limit, $start, $key)
    {
        $this->db->select('*');
        $this->db->from('tbl_panduan');

        if ($key != '') {
            $this->db->like("panduan_title", $key);
            $this->db->or_like("panduan_deskripsi", $key);
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

    public function create($data)
    {
        $this->db->insert('tbl_panduan', $data);
    }

    public function update($data)
    {
        $this->db->update('tbl_panduan', $data, array('panduan_id' => $data['panduan_id']));
    }

    public function delete($id)
    {
        $this->db->delete('tbl_panduan', array('panduan_id' => $id));
    }

    public function get($id)
    {
        $this->db->where('panduan_id', $id);
        $query = $this->db->get('tbl_panduan', 1);
        return $query->result();
    }

    function __destruct()
    {
        $this->db->close();
    }

    public function widget()
    {
        $query  = $this->db->query(" SELECT
            (SELECT count(panduan_id) FROM tbl_panduan) as total");
        return $query->result();
    }
}
