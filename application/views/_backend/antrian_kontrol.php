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
    <section class="content col-lg-7">
        <div class="box">
            <div class="box-header with-border ">
                <div class="box-tools pull-left">
                    <div style="padding-top:10px">
                        Antrian dibuka pukul <span class='label label-success label-inline font-weight-lighter mr-2'><?= $setting[0]->setting_jam_bukas ?> - <?= $setting[0]->setting_jam_tutups ?> WITA</span>
                    </div>
                </div>
                <div class="box-tools pull-right">
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
                        <th>Nama Pasien</th>
                        <th>Antrian Spesialis</th>
                        <th>AR</th>
                        <th>SST</th>
                        <th>SET</th>
                        <th>Status</th>
                    </tr>
                    <?php
                    if ($antrian) {
                        $nox = 1;
                        $no = 1;
                        foreach ($antrian as $key) {
                    ?>
                            <?php if($key->antrian_status != 'end_service') { ?>
                                <tr>
                                <td><b><?php echo str_replace('-', '', $key->antrian_nomor); ?></b></td>
                                <td><?php echo $key->user_fullname; ?></td>
                                <td><?php echo $key->spesialis_nama; ?></td>
                                <td><?php echo date("H:i", strtotime($key->arrival_time)); ?></td>
                                <td><?php echo date("H:i", strtotime($key->service_start_time)); ?></td>
                                <td><?php echo date("H:i", strtotime($key->service_end_time)); ?></td>
                                <td>
                                    <span class="label label-<?php if ($key->antrian_status == 'end_service') echo 'danger';
                                                                else if ($key->antrian_status == 'start_service') echo 'warning';
                                                                else if ($key->antrian_status == 'terhapus') echo 'default';
                                                                else echo 'success' ?>
                                                                "><?php echo $key->antrian_status; ?></span>
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
                                <?php } ?>
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
                        <div class="float-left">Jumlah yang sedang dalam antrian <?php echo ($no - 1); ?> Pasien
                        <?php } else { ?>
                            <div class="float-left">Tampil 0 <?php echo " dari " . $total_antrian; ?> Data</div>
                        <?php } ?> <br>
                        <small>Memuat Halaman <strong>{elapsed_time}</strong> detik.</small>
                        </div>
                </div>

    </section>
    <section class="content col-lg-5">
        <div class="box">
            <div class="box-header with-border ">
                <div class="box-tools pull-right">
                    <div style="padding-top:10px">
                        <a href="<?php echo site_url('admin/kontrol/reset') ?>" onclick="return confirm('Apa kamu yakin reset antrian?');" class="btn btn-danger btn-flat" title="Refresh halaman">Reset Antrian</a>
                        <a href="<?php echo site_url('admin/kontrol') ?>" class="btn btn-success btn-flat" title="Refresh halaman">refresh</a>
                    </div>
                </div>
            </div>
            <div class="box-body table-responsive">
                <h3>Kontrol Antrian</h3>
                <?php
                if ($this->session->flashdata('alert')) {
                    echo $this->session->flashdata('alert');
                    unset($_SESSION['alert']);
                }
                ?>
                <table class="table table-bordered">
                    <tr style="background-color: gray;color:white">
                        <th>Spesialis</th>
                        <th>Saat Ini</th>
                        <th>Kontrol</th>
                    </tr>
                    <?php foreach ($spesialis as $key) { ?>
                        <tr>
                            <td style="width: 50%"><?= $key->spesialis_nama ?></td>
                            <td style="width: 15%"><?= $key->spesialis_kode_antrian ?><?= $key->antrian_saat_ini ?></td>
                            <td style="width: 25%">
                                <div style="display: flex; justify-content: space-around;">
                                    <!-- next -->
                                    <?php echo form_open("admin/kontrol/selesai") ?>
                                    <?php echo csrf(); ?>
                                    <input type="hidden" name="antrian_saat_ini" value="<?= $key->spesialis_kode_antrian . '-' . $key->antrian_saat_ini  ?>">
                                    <input type="hidden" type="hidden" name="antrian_berjalan_id" value="<?= $key->antrian_berjalan_id ?>">
                                    <button type="submit" title="Selanjutnya" class="btn btn-sm btn-primary"><i class="fa fa-step-forward" aria-hidden="true"></i></button>
                                    <?php echo form_close(); ?>
                                    <!-- reload -->
                                    <?php echo form_open("admin/kontrol/callback") ?>
                                    <?php echo csrf(); ?>
                                    <input type="hidden" name="antrian_saat_ini" value="<?= $key->spesialis_kode_antrian . '-' . $key->antrian_saat_ini  ?>">
                                    <input type="hidden" type="hidden" name="antrian_berjalan_id" value="<?= $key->antrian_berjalan_id ?>">
                                    <button <?php if ($key->antrian_saat_ini < 1) echo 'disabled' ?> type="submit" title="start service" class="btn btn-sm btn-primary"><i class="fa fa-refresh" aria-hidden="true"></i></button>
                                    <?php echo form_close(); ?>
                                    <!-- skip -->
                                    <?php echo form_open("admin/kontrol/lewati") ?>
                                    <?php echo csrf(); ?>
                                    <input type="hidden" name="antrian_saat_ini" value="<?= $key->spesialis_kode_antrian . '-' . $key->antrian_saat_ini  ?>">
                                    <input type="hidden" type="hidden" name="antrian_berjalan_id" value="<?= $key->antrian_berjalan_id ?>">
                                    <button <?php if ($key->antrian_saat_ini < 1) echo 'disabled' ?> type="submit" title="Selanjutnya" class="btn btn-sm btn-danger">Lewati</button>
                                    <?php echo form_close(); ?>
                                </div>
                            </td>
                        </tr>
                    <?php } ?>
                </table>
            </div>

    </section>
</div>