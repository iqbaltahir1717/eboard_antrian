<div class="content-wrapper">
    <section class="content-header">
        <h1 class="fontPoppins">
            <?php echo strtoupper($this->uri->segment(2)); ?>
        </h1>
        <ol class="breadcrumb">
            <li><a href="<?php echo site_url('admin/dashboard'); ?>"><i class="fa fa-dashboard"></i> DASHBOARD</a></li>
        </ol>
        </ol>
    </section>
    <section class="content">
        <div class="box">
            <div class="box-header with-border">

                <div class="box-tools pull-right">
                    <button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="Collapse">
                        <i class="fa fa-minus"></i></button>
                    <button type="button" class="btn btn-box-tool" data-widget="remove" data-toggle="tooltip" title="Remove">
                        <i class="fa fa-times"></i></button>
                </div>
            </div>
            <div class="box-body">
                <?php
                if ($this->session->flashdata('alert')) {
                    echo $this->session->flashdata('alert');
                    unset($_SESSION['alert']);
                }
                ?>

                <div class="row">

                    <div class="col-lg-6 col-xs-6">
                        <!-- small box -->
                        <div class="small-box bg-primary">
                            <div class="inner">
                                <h3><?php echo $widget_pasien[0]->total; ?></h3>
                                <p>Total Pasien</p>
                            </div>
                            <div class="icon">
                                <i class="fa fa-book"></i>
                            </div>
                            <a href="<?php echo site_url('admin/user/pasien'); ?>" class="small-box-footer">
                                Selengkapnya <i class="fa fa-arrow-circle-right"></i>
                            </a>
                        </div>
                    </div>
                    <!-- ./col -->
                    <div class="col-lg-6 col-xs-6">
                        <!-- small box -->
                        <div class="small-box bg-primary">
                            <div class="inner">
                                <h3><?php echo $widget_kunjungan_bulan[0]->total; ?></h3>
                                <p>Total Kunjungan Perbulan</p>
                            </div>
                            <div class="icon">
                                <i class="fa fa-history"></i>
                            </div>
                            <a href="<?php echo site_url('admin/riwayat'); ?>" class="small-box-footer">
                                Selengkapnya <i class="fa fa-arrow-circle-right"></i>
                            </a>
                        </div>
                    </div>
                    <div class="col-lg-6 col-xs-6">
                        <!-- small box -->
                        <div class="small-box bg-primary">
                            <div class="inner">
                                <h3><?php echo $widget_dokter[0]->total; ?></h3>
                                <p>Total Dokter</p>
                            </div>
                            <div class="icon">
                                <i class="fa fa-book"></i>
                            </div>
                            <a href="<?php echo site_url('admin/user/dokter'); ?>" class="small-box-footer">
                                Selengkapnya <i class="fa fa-arrow-circle-right"></i>
                            </a>
                        </div>
                    </div>
                    <div class="col-lg-6 col-xs-6">
                        <!-- small box -->
                        <div class="small-box bg-primary">
                            <div class="inner">
                                <h3><?php echo $widget_kunjungan_hari[0]->total; ?></h3>
                                <p>Total Kunjungan Hari ini</p>
                            </div>
                            <div class="icon">
                                <i class="fa fa-rss-square"></i>
                            </div>
                            <a href="<?php echo site_url('admin/monitoring'); ?>" class="small-box-footer">
                                Selengkapnya <i class="fa fa-arrow-circle-right"></i>
                            </a>
                        </div>
                    </div>
                    <!-- ./col -->

                </div>
                <div class="box-footer">
                    <small>Page rendered in <strong>{elapsed_time}</strong> seconds.</small>
                </div>
            </div>
    </section>
</div>