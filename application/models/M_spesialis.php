<?php
defined('BASEPATH') or exit('No direct script access allowed');
class M_spesialis extends CI_Model
{

    function __construct()
    {
        parent::__construct();
    }

    public function read($limit, $start, $key)
    {
        $this->db->select('a.*, b.user_fullname, c.*');
        $this->db->from('tbl_spesialis a');
        $this->db->join('tbl_user b', 'a.user_id = b.user_id', 'LEFT');
        $this->db->join('tbl_antrian_berjalan c', 'a.spesialis_id = c.spesialis_id', 'LEFT');

        if ($key != '') {
            $this->db->like("spesialis_nama", $key);
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
        $this->db->insert('tbl_spesialis', $data);
    }

    public function update($data)
    {
        $this->db->update('tbl_spesialis', $data, array('spesialis_id' => $data['spesialis_id']));
    }

    public function delete($id)
    {
        $this->db->delete('tbl_spesialis', array('spesialis_id' => $id));
    }

    public function get($id)
    {
        $this->db->where('tbl_spesialis', $id);
        $query = $this->db->get('tbl_group', 1);
        return $query->result();
    }

    function __destruct()
    {
        $this->db->close();
    }
}
