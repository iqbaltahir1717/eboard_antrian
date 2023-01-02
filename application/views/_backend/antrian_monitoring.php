<div class="content-wrapper">
    <section class="content-header">
        <h1 class="fontPoppins">
            <?php echo strtoupper($this->uri->segment(2)); ?>
        </h1>
        <ol class="breadcrumb">
            <li><a href="<?php echo site_url('admin/dashboard'); ?>"><i class="fa fa-dashboard"></i>Monitoring</a></li>
        </ol>
        </ol>
    </section>
    <section class="content">
        <div class="box">
            <div class="box-header with-border ">
                <div class="box-tools pull-left">
                    <div style="padding-top:10px">
                        Antrian dibuka pukul <span class='label label-danger label-inline font-weight-lighter mr-2'><?= $setting[0]->setting_jam_bukas ?> - <?= $setting[0]->setting_jam_tutups ?> WITA</span>
                    </div>
                </div>
                <div class="box-tools pull-right">
                    <div style="padding-top:10px">
                        <a href="<?php echo site_url('admin/monitoring') ?>" class="btn btn-success btn-flat" title="Refresh halaman">refresh</a>
                        <?php if ($total_antrian == $setting[0]->setting_max_antrian) { ?>
                            <button disabled class="btn btn-primary btn-flat"> Antrian Penuh</button>
                        <?php } else if (date('h:i') >= $setting[0]->setting_jam_bukas and  date('h:i') <= $setting[0]->setting_jam_tutups) { ?>
                            <button data-toggle="modal" data-target="#modalCreate" class="btn btn-primary btn-flat" title="Refresh halaman">Ambil Antrian</button>
                        <?php } else { ?>
                            <button disabled class="btn btn-primary btn-flat">Ambil Antrian</button>
                        <?php } ?>
                    </div>

                    <!-- Modal-->
                    <div class="modal fade" id="modalCreate" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="staticBackdrop" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">Ambil Nomor Antrian</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <i aria-hidden="true" class="ki ki-close"></i>
                                    </button>

                                </div>
                                <?php echo form_open("admin/monitoring/create_antrian") ?>
                                <div class="modal-body">
                                    <?php echo csrf(); ?>
                                    <div class="form-group">
                                        <select class="form-control" name="spesialis_id" required>
                                            <option value="">- Pilih Spesialis -</option>
                                            <?php
                                            foreach ($spesialis as $g) {
                                                echo '<option value="' . $g->spesialis_id . '">' . $g->spesialis_nama . '</option>';
                                            }
                                            ?>
                                        </select>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="submit" class="btn btn-primary font-weight-bold">Ambil Antrian</button>
                                    <?php echo form_close(); ?>
                                    <button type="button" class="btn btn-light-primary font-weight-bold" data-dismiss="modal">Batal</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="box-body">
                <h3>Pasien Dalam Antrian Hari Ini</h3>
                <?php
                if ($this->session->flashdata('alert')) {
                    echo $this->session->flashdata('alert');
                    unset($_SESSION['alert']);
                }
                ?>
                <table class="table table-bordered">
                    <tr style="background-color: gray;color:white">
                        <th style="width: 10%">Nomor Antrian</th>
                        <th style="width: 20%">Kode Antrian</th>
                        <th>Nama Pasien</th>
                        <th>Antrian Spesialis</th>
                        <th>Waktu Masuk</th>
                        <th>#aksi</th>
                    </tr>
                    <?php
                    if ($antrian) {
                        $nox = 1;
                        $no = 1;
                        foreach ($antrian as $key) {

                    ?>
                            <tr>
                                <td><b><?php echo str_replace('-', '', $key->antrian_nomor); ?></b></td>
                                <td><?php echo $key->antrian_kode; ?></td>
                                <td><?php echo $key->user_fullname; ?></td>
                                <td><?php echo $key->spesialis_nama; ?></td>
                                <td><?php echo date("H:i", strtotime($key->arrival_time)); ?></td>
                                <td>
                                    <?php if ($key->user_name == $this->session->userdata('user_name') or $this->session->userdata('user_group') < 3) { ?>
                                        <button class="btn btn-xs btn-flat btn-danger" data-toggle="modal" data-target="#modalDelete<?php echo $key->antrian_kode ?>">Hapus</button>
                                    <?php } ?>
                                </td>
                            </tr>

                            <!-- Modal Delete-->
                            <div class="modal fade" id="modalDelete<?php echo $key->antrian_kode ?>" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="staticBackdrop" aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="exampleModalLabel">Hapus Data</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <i aria-hidden="true" class="ki ki-close"></i>
                                            </button>
                                        </div>
                                        <?php echo form_open("admin/monitoring/delete") ?>
                                        <div class="modal-body">
                                            Apakah anda yakin akan menghapus data antrian ini : <?php echo $key->antrian_kode; ?> atas nama <?php echo $key->user_fullname; ?> ?
                                            <?php echo csrf(); ?>
                                            <input type="hidden" name="antrian_kode" value="<?php echo $key->antrian_kode; ?>">
                                        </div>
                                        <div class="modal-footer">
                                            <button type="submit" class="btn btn-danger font-weight-bold">Hapus</button>
                                            <?php echo form_close(); ?>
                                            <button type="button" class="btn btn-light-primary font-weight-bold" data-dismiss="modal">Batal</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                    <?php
                            $no++;
                        }
                    } else {
                        echo '
                                        <tr>
                                            <td colspan="3">Antrian Kosong</td>
                                        </tr>
                                        ';
                    }
                    ?>
                </table>
                <div class="box-footer">
                    <!-- COUNT DATA -->
                    <?php if ($antrian) { ?>
                        <div class="float-left">Jumlah yang sedang dalam antrian <?php echo ($no - 1); ?> Pasien dari <?php echo $setting[0]->setting_max_antrian ?> max antrian</div>
                    <?php } else { ?>
                        <div class="float-left">Tampil 0 <?php echo " dari " . $total_antrian; ?> Data</div>
                    <?php } ?>
                    <small>Memuat Halaman <strong>{elapsed_time}</strong> detik.</small>
                </div>
            </div>

    </section>
</div>