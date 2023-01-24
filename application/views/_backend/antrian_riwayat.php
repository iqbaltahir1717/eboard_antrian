<div class="content-wrapper">
    <section class="content-header">
        <h1 class="fontPoppins">
            <?php echo strtoupper($title); ?>
        </h1>
        <ol class="breadcrumb">
            <li><a href="<?php echo site_url('admin/dashboard'); ?>"><i class="fa fa-dashboard"></i> DASHBOARD</a></li>
            <?php
            if ($this->uri->segment(3)) {
                echo '<li class="active"><a href="' . site_url('admin/' . $this->uri->segment(2)) . '">' . strtoupper($title) . '</a></li>';
                echo '<li class="active">' . strtoupper($this->uri->segment(3)) . '</li>';
            } else {
                echo '<li class="active">' . strtoupper($title) . '</li>';
            }
            ?>

        </ol>
    </section>
    <section class="content">
        <div class="box">
            <div class="box-header with-border">
                <div class="box-tools pull-left" style="margin-top:8px">
                    <small>Halaman dimuat dalam waktu <strong>{elapsed_time}</strong> detik.</small>
                </div>
                <div class="box-tools pull-right">
                    <div style="padding-top:10px">
                        <a href="<?php echo site_url('admin/riwayat') ?>" class="btn btn-success btn-flat" title="Refresh halaman">refresh</a>
                        <button class="btn btn-primary btn-flat" title="print data" data-toggle="modal" data-target="#modalFilter">Filter Data</button>
                    </div>
                    <!-- Modal-->
                    <div class="modal fade" id="modalFilter" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="staticBackdrop" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">Filter Data</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <i aria-hidden="true" class="ki ki-close"></i>
                                    </button>
                                </div>
                                <?php echo form_open("admin/riwayat/search") ?>
                                <?php echo csrf(); ?>
                                <div class="modal-body">
                                    <div class="form-group margin">
                                        <label for="inputName" class=" control-label">Dari Tanggal</label><br>
                                        <input type="date" class="form-control" placeholder="Dari Tanggal" name="start_date" required>
                                    </div>
                                    <div class="form-group margin">
                                        <label class=" control-label">Sampai Tanggal</label><br>
                                        <input type="date" class="form-control" placeholder="Sampai Tanggal" name="end_date" required>
                                    </div>
                                    <div class="form-group margin">
                                        <label class=" control-label">Pilih Spesialis</label><br>
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
                                    <button type="submit" class="btn btn-primary font-weight-bold">Filter</button>
                                    <?php echo form_close(); ?>
                                    <button type="button" class="btn btn-light-primary font-weight-bold" data-dismiss="modal">Batal</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="box-body">
                <?php
                if ($this->session->flashdata('alert')) {
                    echo $this->session->flashdata('alert');
                    unset($_SESSION['alert']);
                }
                if ($this->uri->segment(3) == "search") {
                    echo "Filter Tanggal : <span class='label label-danger label-inline font-weight-lighter mr-2'>" . $start_date . "</span> - <span class='label label-warning label-inline font-weight-lighter mr-2'>" . $end_date . "</span> <hr style='border: 0.5px dashed #d2d6de'>";
                }
                ?>
                <table class="table table-bordered table-responsive">
                    <tr style="background-color: gray;color:white">
                        <th style="width: 60px">No</th>
                        <th>Tanggal</th>
                        <th>Nama Pasien</th>
                        <th>Spesialis</th>
                        <th>Nomor Antrian</th>
                        <th>AT</th>
                        <th>SST</th>
                        <th>SET</th>
                        <th>ST</th>
                        <th>TIQ</th>
                        <th>TIS</th>
                    </tr>
                    <?php
                    if ($riwayat) {
                        $nox = 1;
                        $no = 1;
                        foreach ($output as $f => $key) {
                    ?>
                            <tr>
                                <td><?php echo $no; ?></td>
                                <td><?php echo $key[0]; ?></td>
                                <td><?php echo $key[1]; ?></td>
                                <td><?php echo $key[2]; ?></td>
                                <td><?php echo $key[3]; ?></td>
                                <td><?php echo $key[4]; ?></td>
                                <td><?php echo $key[5]; ?></td>
                                <td><?php echo $key[6]; ?></td>
                                <td><?php echo $key[7]; ?></td>
                                <td><?php echo $key[8]; ?></td>
                                <td><?php echo $key[9]; ?></td>
                            </tr>
                        <?php
                            $no++;
                        }
                        ?>
                        <tr style="background-color: gray;color:white">
                            <th colspan="5">∑</th>
                            <?php foreach ($averages as $f => $key) {
                            ?>
                                <th><?= $key[0]; ?></th>
                            <?php } ?>
                        </tr>
                    <?php
                    } else {
                        echo '
                            <tr>
                                <td colspan="3">Tidak ada ditemukan</td>
                            </tr>
                            ';
                    }
                    ?>

                </table>
            </div>
            <div class="box-footer">
                <!-- COUNT DATA -->
                <?php if ($riwayat) { ?>
                    <div class="float-left">Tampil <?php echo ($nox) . " - " . (count($riwayat)) ?> Data</div>
                <?php } else { ?>
                    <div class="float-left">Tampil 0 Data</div>
                <?php } ?>
            </div>
        </div>

        <div class="box">
            <div class="box-header with-border">
                <div class="box-tools pull-left" style="margin-top:8px">
                    <small>Analisa Sistem Antrian dengan Model Antrian Single Channel Single Phase atau (M/M/1)</small>
                </div>
            </div>
            <div class="box-body">
                <div class="container">
                    <div class="row">
                        <!-- <div class="col-lg-6">
                            <p><b>Waktu rata-rata pasien menunggu dalam antrian (TIQ)</b></p>
                            <p>Rata-Rata TIQ = <?= $menunggu[0][1] . " Menit / " . $total_data; ?> Pasien</p>
                            (x) = <?= $menunggu[0][0]; ?> Menit
                            <hr>
                        </div>
                        <div class="col-lg-6">
                            <p><b>Waktu rata-rata pasien menunggu dalam sistem (TIS)</b></p>
                            <p>Rata-Rata TIS = <?= $menunggu[1][1] . " Menit / " . $total_data; ?> Pasien</p>
                            (y) = <?= $menunggu[1][0]; ?> Menit
                            <hr>
                        </div> -->
                        <div class="col-lg-6">
                            <h4><b>Tingkat kedatangan rata-rata persatuan waktu (AT)</b></h4>
                            <p>AT = <?= $averages[0][0] ?> => <?= $tingkat[0][1] . " Menit / " . $total_data . " Pasien"; ?> </p>
                            <b> λ = <?= $tingkat[0][0]; ?> Menit</b>
                            <hr>
                        </div>
                        <div class="col-lg-6">
                            <h4><b>Tingkat pelayanan rata-rata persatuan waktu (SST)</b></h4>
                            <p>SST = <?= $averages[1][0] ?> => <?= $tingkat[1][1] . " Menit / " . $total_data . " Pasien"; ?></p>
                            <b>μ = <?= $tingkat[1][0]; ?> Menit</b>
                            <hr>
                        </div>
                    </div>
                </div>
                <table class="table table-bordered table-hover table-striped table-responsive">
                    <tr>
                        <th>Rata-rata yang mengantri dalam sistem (Ls)</th>
                        <td><?php echo $ls ?> ( <?= floor($ls) ?> Orang)</td>
                    </tr>
                    <tr>
                        <th>Rata-rata yang mengantri dalam antrian (La)</th>
                        <td><?php echo round($la, 2) ?> ( <?= floor($la) ?> Orang)</td>
                    </tr>
                    <tr>
                        <th>Rata-rata waktu menunggu dalam sistem (Ws)</th>
                        <td><?php echo round($ws, 2) ?> Menit</td>
                    </tr>
                    <tr>
                        <th>Rata-rata waktu menunggu dalam antrian (Wa)</th>
                        <td><?php echo round($wa, 2); ?> menit</td>
                    </tr>
                    <tr>
                        <th>Tingkat kesibukan server (K)</th>
                        <td><?php echo round($K, 2); ?> %</td>
                    </tr>
                    <tr>
                        <th>Tingkat penganggruan server (W)</th>
                        <td><?php echo round($W, 2) ?> %</td>
                    </tr>
                </table>
            </div>
        </div>

    </section>


</div>