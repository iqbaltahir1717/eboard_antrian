<?php
defined('BASEPATH') or exit('No direct script access allowed');
class M_auth extends CI_Model
{

    function __construct()
    {
        parent::__construct();
    }

    public function validate($user_phone)
    {
        $this->db->select("a.*, b.group_name");
        $this->db->from('tbl_user a');
        $this->db->join('tbl_group b', 'a.group_id=b.group_id', 'LEFT');
        $this->db->where('a.user_phone', $user_phone);
        $query = $this->db->get();
        if ($query->num_rows() > 0) {
            foreach ($query->result() as $row) {
                $data[] = $row;
            }
            return $data;
        }
        return false;
    }

    function __destruct()
    {
        $this->db->close();
    }
}
