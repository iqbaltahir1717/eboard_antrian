<?php
defined('BASEPATH') or exit('No direct script access allowed');
class M_setting extends CI_Model
{

    function __construct()
    {
        parent::__construct();
    }


    public function fetch_setting()
    {
        $this->db->select("*, DATE_FORMAT(setting_jam_buka, '%H:%i') as setting_jam_bukas, DATE_FORMAT(setting_jam_tutup, '%H:%i') as setting_jam_tutups");
        $this->db->from('tbl_setting');
        $this->db->where('setting_id', 1);
        $query = $this->db->get();
        if ($query->num_rows() > 0) {
            foreach ($query->result() as $row) {
                $data[] = $row;
            }
            return $data;
        }
        return false;
    }


    public function update_setting($data)
    {
        $this->db->update('tbl_setting', $data, array('setting_id' => $data['setting_id']));
    }


    function __destruct()
    {
        $this->db->close();
    }
}
