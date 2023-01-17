    <body class="<?php echo $setting[0]->setting_layout; ?> sidebar-mini <?php echo $setting[0]->setting_color; ?> fontPoppins">
        <div class="preloader">
            <div class="loading text-center">
                <img src="<?php echo base_url(); ?>assets/core-images/load.gif" width="50">
                <br>
                <p><b class="fontPoppins">Harap Tunggu</b></p>
            </div>
        </div>
        <div class="wrapper">
            <header class="main-header">
                <a href="<?php echo site_url('admin/dashboard') ?>" class="logo">
                    <span class="logo-mini"><b><?php echo $setting[0]->setting_short_appname; ?></b></span>
                    <span class="logo-lg"><b><?php echo $setting[0]->setting_short_appname; ?></b></span>
                </a>
                <nav class="navbar navbar-static-top">
                    <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </a>
                    <div class="navbar-custom-menu">
                        <ul class="nav navbar-nav">
                            <li><a href="">Antrian Buka Pukul <?php echo $setting[0]->setting_jam_bukas; ?> - <?= $setting[0]->setting_jam_tutups ?> WITA</a></li>
                            <li class="dropdown user user-menu">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                    <?php
                                    if ($this->session->userdata('user_photo') == "") {
                                        echo '<img src="' . base_url() . 'upload/user/noimage.png" class="user-image" alt="User Image">';
                                    } else {
                                        echo '<img src="' . base_url() . 'upload/user/' . $this->session->userdata('user_photo') . '" class="user-image" alt="User Image">';
                                    }
                                    ?>
                                    <span class="hidden-xs"><?php echo $this->session->userdata('user_name'); ?></span>
                                </a>
                                <ul class="dropdown-menu">
                                    <li class="user-header">
                                        <?php
                                        if ($this->session->userdata('user_photo') == "") {
                                            echo '<img src="' . base_url() . 'upload/user/noimage.png" class="img-circle" alt="User Image">';
                                        } else {
                                            echo '<img src="' . base_url() . 'upload/user/' . $this->session->userdata('user_photo') . '" class="img-circle" alt="User Image">';
                                        }
                                        ?>
                                        <p>
                                            <?php echo $this->session->userdata('user_fullname'); ?>
                                            <small>Member since<br><?php echo $this->session->userdata('user_createtime'); ?></small>
                                        </p>
                                    </li>

                                    <li class="user-footer">
                                        <div class="pull-left">
                                            <a href="<?php echo site_url('admin/profile') ?>" class="btn btn-default btn-flat">Profile</a>
                                        </div>
                                        <div class="pull-right">
                                            <a href="<?php echo site_url('auth/logout') ?>" class="btn btn-google btn-flat">Sign out</a>
                                        </div>
                                    </li>
                                </ul>
                            </li>
                            <?php if ($this->session->userdata('user_group') == 1) { ?>
                                <li>
                                    <a href="<?php echo site_url('admin/setting'); ?>" title="Pengaturan Aplikasi"><i class="fa fa-gears"></i></a>
                                </li>
                            <?php } ?>
                        </ul>
                    </div>
                </nav>
            </header>

            <aside class="main-sidebar">
                <section class="sidebar">
                    <div class="user-panel">
                        <div class="pull-left image">
                            <?php
                            if ($this->session->userdata('user_photo') == "") {
                                echo '<img src="' . base_url() . 'upload/user/noimage.png" class="img-circle" alt="User Image">';
                            } else {
                                echo '<img src="' . base_url() . 'upload/user/' . $this->session->userdata('user_photo') . '" class="img-circle" alt="User Image">';
                            }
                            ?>
                        </div>
                        <div class="pull-left info">
                            <?php
                            if (strlen($this->session->userdata('user_fullname')) > 15) {
                                echo '<p>' . substr($this->session->userdata('user_fullname'), 0, 15) . '..</p>';
                            } else {
                                echo '<p>' . $this->session->userdata('user_fullname') . '</p>';
                            }
                            ?>
                            <a href="#"><i class="fa fa-circle text-success"></i> Online | <?= $this->session->userdata('user_group_name')  ?></a>
                        </div>
                    </div>

                    <?php if ($this->session->userdata('user_group') == 1) { ?>
                        <!-- Administrator Menu -->
                        <ul class="sidebar-menu" data-widget="tree">
                            <li class="header">Menu Utama</li>
                            <li class="active"><a href="<?php echo site_url('admin/dashboard') ?>"><i class="fa fa-dashboard"></i> <span>Dashboard</span></a></li>
                            <li><a href="<?php echo site_url('admin/monitoring') ?>"><i class="fa fa-newspaper-o"></i> <span>Monitoring</span></a></li>
                            <li class="header">Menu Antrian</li>
                            <li><a href="<?php echo site_url('admin/kontrol') ?>"> <i class="fa fa-circle-o text-green"></i> <span>Kontrol Antrian</span></a></li>
                            <li><a href="<?php echo site_url('admin/riwayat') ?>"> <i class="fa fa-user-o"></i> <span>Riwayat Antrian Pasien</span></a></li>
                            <li class="header">Menu Manajamen Pengguna</li>
                            <li class="treeview">
                                <a href="#"> <i class="fa fa-database"></i> <span>Pengaturan User</span>
                                    <span class="pull-right-container">
                                        <i class="fa fa-angle-left pull-right"></i>
                                    </span>
                                </a>
                                <ul class="treeview-menu">
                                    <li><a href="<?php echo site_url('admin/group/spesialis'); ?>"><i class="fa fa-circle-o"></i> Spesialis Dokter</a></li>
                                    <li><a href="<?php echo site_url('admin/group'); ?>"><i class="fa fa-circle-o"></i> Kategori User</a></li>
                                    <li><a href="<?php echo site_url('admin/user'); ?>"><i class="fa fa-circle-o"></i> Semua User</a></li>
                                    <li><a href="<?php echo site_url('admin/user/admin'); ?>"><i class="fa fa-circle-o"></i> Admin</a></li>
                                    <li><a href="<?php echo site_url('admin/user/dokter'); ?>"><i class="fa fa-circle-o"></i> Dokter</a></li>
                                    <li><a href="<?php echo site_url('admin/user/pasien'); ?>"><i class="fa fa-circle-o"></i> Pasien</a></li>

                                </ul>
                            </li>
                            <li class="header">Menu Lainnya</li>
                            <li><a href="<?php echo site_url('admin/log'); ?>"><i class="fa fa-circle-o text-red"></i> <span>Log User</span></a></li>
                            <li><a href="<?php echo site_url('admin/about'); ?>"><i class="fa fa-info"></i> <span>Tentang Kami & Bantuan</span></a></li>
                        </ul>
                    <?php } ?>

                    <?php if ($this->session->userdata('user_group') == 2) { ?>
                        <!-- Administrator Menu -->
                        <ul class="sidebar-menu" data-widget="tree">
                            <li class="header">Main Menu</li>
                            <li class="active"><a href="<?php echo site_url('admin/dashboard') ?>"><i class="fa fa-dashboard"></i> <span>Dashboard</span></a></li>
                            <li class="header">Queue Menu</li>
                            <li><a href="<?php echo site_url('admin/kontrol') ?>"> <i class="fa fa-circle-o text-green"></i> Kontrol Antrian<span></span></a></li>
                            <li><a href="<?php echo site_url('admin/riwayat') ?>"> <i class="fa fa-user-o"></i> Riwayat Antrian Pasien<span></span></a></li>
                            <li class="header">Others Menu</li>

                            <li class="treeview">
                                <a href="#"> <i class="fa fa-database"></i> <span>Pengaturan User</span>
                                    <span class="pull-right-container">
                                        <i class="fa fa-angle-left pull-right"></i>
                                    </span>
                                </a>
                                <ul class="treeview-menu">
                                    <li><a href="<?php echo site_url('admin/group/spesialis'); ?>"><i class="fa fa-circle-o"></i> Spesialis Dokter</a></li>
                                    <li><a href="<?php echo site_url('admin/user/dokter'); ?>"><i class="fa fa-circle-o"></i> Dokter</a></li>
                                    <li><a href="<?php echo site_url('admin/user/pasien'); ?>"><i class="fa fa-circle-o"></i> Pasien</a></li>

                                </ul>
                            </li>
                            <li><a href="<?php echo site_url('admin/log'); ?>"><i class="fa fa-circle-o text-red"></i> <span>Log User</span></a></li>
                            <li><a href="<?php echo site_url('admin/about'); ?>"><i class="fa fa-info"></i> <span>Tentang Kami & Bantuan</span></a></li>
                        </ul>
                    <?php } ?>

                    <?php if ($this->session->userdata('user_group') == 3) { ?>
                        <!-- Administrator Menu -->
                        <ul class="sidebar-menu" data-widget="tree">
                            <li class="header">Main Menu</li>
                            <li><a href="<?php echo site_url('admin/monitoring') ?>"><i class="fa fa-newspaper-o"></i>Monitoring</a></li>
                            <li><a href="<?php echo site_url('admin/about'); ?>"><i class="fa fa-info"></i> <span>Tentang Kami & Bantuan</span></a></li>
                        </ul>
                    <?php } ?>
                    <?php if ($this->session->userdata('user_group') == 4) { ?>
                        <!-- Administrator Menu -->
                        <ul class="sidebar-menu" data-widget="tree">
                            <li class="header">Main Menu</li>
                            <li class="active"><a href="<?php echo site_url('admin/dashboard') ?>"><i class="fa fa-dashboard"></i> <span>Dashboard</span></a></li>
                            <li><a href="<?php echo site_url('admin/about'); ?>"><i class="fa fa-info"></i> <span>Tentang Kami & Bantuan</span></a></li>
                        </ul>
                    <?php } ?>
                </section>
            </aside>