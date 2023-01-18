<div id="canvass">
    <div id="particles-js"></div>
</div>

<body class="fontRubik">
    <div class="fixed-top">
        <header id="header">
            <div class="container d-flex align-items-end">
            </div>
            <div class="container d-flex align-items-center">
                <h5 class="logo mr-auto"><a href="<?php echo base_url(); ?>" class="scrollto"><img src="<?php echo base_url() ?>assets/core-images/<?php echo $setting[0]->setting_logo; ?>"> <?php echo $setting[0]->setting_appname; ?> E-BOARD</a> </h5>
                <nav class="nav-menu d-none d-lg-block">
                    <ul>
                        <!-- <li><a href="#">Render Time Halaman <strong>{elapsed_time}</strong> detik.</a></li> -->
                        <!-- <li class="active"><a href="#">Pukul <span id="jam"></span> : <span id="menit"></span> : <span id="detik"></span></a></li> -->
                        <?php if ($this->session->userdata('user_fullname')) { ?>
                            <?php if (!$profile_antrian) { ?>
                                <li class="mt-1"><a type="button" href="#" data-dismiss="modal" data-toggle="modal" data-target="#modalAntrian">Ambil Antrian</a></li>
                            <?php } else { ?>
                                <li class="mt-1"><a type="button" href="#" data-dismiss="modal" data-toggle="modal" data-target="#modalNomor">Nomor Antrian Anda</a></li>
                            <?php } ?>
                            <li>
                                <a type="button" href="#" data-dismiss="modal" data-toggle="modal" data-target="#modalProfile">
                                    <?php if ($profile[0]->user_photo == "") { ?>
                                        <img style="width:30px; border-radius:50%;" src="<?= base_url() . '/upload/user/noimage.png'; ?>" alt=""> &nbsp;&nbsp;<?= $profile[0]->user_fullname ?>
                                    <?php } else { ?>
                                        <img style="width:30px; border-radius:50%;" src="<?= base_url() . '/upload/user/' . $profile[0]->user_photo; ?>" alt=""> &nbsp;&nbsp;<?= $profile[0]->user_fullname ?>
                                    <?php
                                    } ?>
                            <li class="mt-1"><a onclick="return confirm('Apa kamu yakin untuk keluar?');" href="<?php echo site_url('auth/logout') ?>">Log-out</a></li>
                            </a>
                            </li>
                        <?php } else { ?>
                            <li><a href="<?php echo site_url('auth') ?>">Log-in</a></li>
                        <?php } ?>
                    </ul>
                </nav><!-- .nav-menu -->
            </div>
        </header><!-- End Header -->
    </div>

    <div class="modal fade" id="modalAntrian" tabindex="-1" role="dialog" aria-labelledby="staticBackdrop" aria-hidden="ture">
        <div class="modal-dialog modal-md" role="document">
            <div class="modal-content" style="height: 300px" role="document">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLongTitle">Ambil Antrian</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <?php echo form_open("eboard/create_antrian") ?>
                    <div class="box-card">
                        <div class="form-group">
                            <?php echo csrf(); ?>
                            <label for="">Pilih Spesialis / Jenis Antrian</label>
                            <select class="form-control select2" name="spesialis_id" required>
                                <option value="">- Pilih Spesialis -</option>
                                <?php
                                foreach ($spesialis as $g) {
                                    echo '<option value="' . $g->spesialis_id . '">' . $g->spesialis_nama . '</option>';
                                }
                                ?>
                            </select>
                        </div>
                        <hr>
                        <button type="submit" class="btn btn-primary font-weight-bold btn-block">Ambil Antrian</button>
                        <?php echo form_close(); ?>
                    </div>
                </div>
                <div class="modal-footer">
                    <h6 class="modal-title" id="exampleModalLabel">&#169; <?php echo $setting[0]->setting_appname; ?></h6>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="modalProfile" tabindex="-1" role="dialog" aria-labelledby="staticBackdrop" aria-hidden="ture">
        <div class="modal-dialog modal-md" role="document">
            <div class="modal-content" style="height: 650px" role="document">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLongTitle">Update Profile</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <?php echo form_open("eboard/update"); ?>
                    <div class="box-card">
                        <div class="form-group has-feedback">
                            <label for="">Nama Lengkap</label>
                            <?php echo csrf(); ?>
                            <input type="text" value="<?= $profile[0]->user_fullname ?>" class="form-control" placeholder="Nama Lengkap" name="user_fullname" required>
                        </div>
                        <div class="form-group has-feedback">
                            <label for="">Nomor Telpon</label>
                            <input type="text" value="<?= $profile[0]->user_phone; ?>" class="form-control" placeholder="Nomor Telpon" name="user_phone" required>
                        </div>
                        <hr>
                        <div class="form-group has-feedback">
                            <label for="">Password Lama</label>
                            <input type="password" class="form-control" name="old_password">
                        </div>
                        <div class="form-group has-feedback">
                            <label for="">Password Baru</label>
                            <input type="password" class="form-control" name="new_password">
                        </div>
                        <div class="form-group has-feedback">
                            <label for="">Konfirmasi Password Baru</label>
                            <input type="password" class="form-control" name="confirm_password">
                        </div>
                        <button type="submit" class="btn btn-primary font-weight-bold btn btn-block">Update</button>
                        <?php echo form_close(); ?>
                    </div>
                </div>
                <div class="modal-footer">
                    <h6 class="modal-title" id="exampleModalLabel">&#169; <?php echo $setting[0]->setting_appname; ?></h6>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="modalNomor" tabindex="-1" role="dialog" aria-labelledby="staticBackdrop" aria-hidden="ture">
        <div class="modal-dialog modal-sm" role="document">
            <div class="modal-content" style="" role="document">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLongTitle">Nomor Antrian Anda</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="box-card">
                        <?php echo form_open("eboard/delete") ?>
                        <center>
                            <h1 style="font-size: 120px;"><?= $profile_antrian[0]->antrian_nomor ?></h1>
                            <?php echo csrf(); ?>
                            <input type="hidden" value="<?= $profile_antrian[0]->antrian_kode ?>" name="antrian_kode">
                            <button type="submit" onclick="return confirm('Apa kamu yakin hapus antrian anda?');" class="btn btn-danger">Hapus</button>
                        </center>
                        <?php echo form_close(); ?>

                    </div>
                </div>
                <div class="modal-footer">
                    <h6 class="modal-title" id="exampleModalLabel">&#169; <?php echo $setting[0]->setting_appname; ?></h6>
                </div>
            </div>
        </div>
    </div>
    <script src="<?php echo base_url() ?>assets/core-front/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <?php if ($profile_antrian) { ?>
        <script>
            $('#modalNomor').modal('show');
        </script>
    <?php } ?>