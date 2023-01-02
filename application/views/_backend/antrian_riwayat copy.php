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
                        <a href="<?php echo site_url('admin/user') ?>" class="btn btn-success btn-flat" title="Refresh halaman">refresh</a>
                        <button class="btn btn-warning btn-flat" title="print data" data-toggle="modal" data-target="#modalFilter">Filter Data</button>
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
                    echo "Filter Tanggal : <span class='label label-danger label-inline font-weight-lighter mr-2'>" . $start_date . "</span> - <span class='label label-warning label-inline font-weight-lighter mr-2'>" . $end_date . "</span>   <hr style='border: 0.5px dashed #d2d6de'>";
                }
                ?>
                <table class="table table-bordered">
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
                        <tr>
                            <th colspan="5">Rata-Rata</th>
                            <?php foreach ($averages as $f => $key) {
                            ?>
                                <th><?= $key[0]; ?></th>
                            <?php } ?>
                            <th><?= $average_sts ?></th>
                            <th><?= $average_tiqs ?></th>
                            <th><?= $average_tiss ?></th>
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

    </section>


</div>