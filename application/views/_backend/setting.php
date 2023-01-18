<div class="content-wrapper">
    <section class="content-header">
        <h1 class="fontPoppins">
            <?php echo strtoupper($title); ?>
        </h1>
        <ol class="breadcrumb">
            <li><a href="<?php echo site_url('admin/dashboard'); ?>"><i class="fa fa-dashboard"></i> DASHBOARD</a></li>
            <li class="active"><?php echo strtoupper($title); ?></li>
        </ol>
    </section>

    <section class="content">
        <div class="box">
            <?php echo form_open_multipart("admin/setting/update") ?>
            <div class="box-header with-border">
                <div class="box-tools pull-right">
                    <a href="<?php echo site_url('admin/setting') ?>" class="btn btn-success btn-flat" title="Refresh halaman">Refresh</a>
                    <button type="submit" class="btn btn-primary btn-flat" title="Update data setting">Update Data Setting</button>
                </div>
            </div>
            <div class="box-body">
                <?php
                if ($this->session->flashdata('alert')) {
                    echo $this->session->flashdata('alert') . "<br>";
                }
                ?>
                <div class="row">
                    <div class="col-md-7">
                        <div class="row">
                            <div class="col-md-12">
                                <h2 class="fontPoppins"><i class="text-red fa fa-info-circle"></i> Informasi Aplikasi</h2>
                                <hr style="border: 0.5px dashed #d2d6de">
                            </div>
                            <div class="col-md-8">
                                <div class="form-group">
                                    <label>Nama Aplikasi <small class="text-red">*</small></label>
                                    <?php echo csrf(); ?>
                                    <input type="hidden" class="form-control" name="setting_id" value="<?php echo $setting[0]->setting_id; ?>" required>
                                    <input type="hidden" class="form-control" name="setting_logo" value="<?php echo $setting[0]->setting_logo; ?>" required>
                                    <input type="hidden" class="form-control" name="setting_background" value="<?php echo $setting[0]->setting_background; ?>" required>
                                    <input type="text" class="form-control" placeholder="Nama Aplikasi" name="setting_appname" value="<?php echo $setting[0]->setting_appname; ?>" required>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Singkatan (Max 10 Huruf) <small class="text-red">*</small></label>
                                    <input type="text" class="form-control" maxlength="10" placeholder="Singkatan Aplikasi" name="setting_short_appname" value="<?php echo $setting[0]->setting_short_appname; ?>" required>
                                </div>
                            </div>
                            <div class="col-md-8">
                                <div class="form-group">
                                    <label>Logo</label>
                                    <input type="file" class="form-control" name="logo">
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Preview Logo</label><br>
                                    <img src="<?php echo base_url(); ?>assets/core-images/<?php echo $setting[0]->setting_logo; ?>" height="57">
                                </div>
                            </div>
                            <div class="col-md-8">
                                <div class="form-group">
                                    <label>Background Login</label>
                                    <input type="file" class="form-control" name="background">
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Preview Background</label><br>
                                    <a href="<?php echo base_url(); ?>assets/core-images/<?php echo $setting[0]->setting_background; ?>" class="btn btn-sm btn-success" target="_blank">Preview Disini</a>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label>Tentang Aplikasi</label>
                                    <textarea class="form-control" name="setting_about" placeholder="Penjelasan Singkat Aplikasi" rows="3"><?php echo $setting[0]->setting_about; ?></textarea>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-5">
                        <div class="row">
                            <div class="col-md-12">
                                <h2 class="fontPoppins"><i class="text-red fa fa-info-circle"></i> Pengaturan Antrian</h2>
                                <hr style="border: 0.5px dashed #d2d6de">
                            </div>
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label>Max jumlah Antrian <small class="text-red">*</small></label>
                                    <?php echo csrf(); ?>
                                    <input type="number" class="form-control" name="setting_max_antrian" value="<?php echo $setting[0]->setting_max_antrian; ?>" required>
                                </div>
                            </div>
                            <div class="col-md-5">
                                <div class="form-group">
                                    <label>Jam Buka Antrian <small class="text-red">*</small></label>
                                    <input type="time" class="form-control" placeholder="Jam Buka" name="setting_jam_buka" value="<?php echo $setting[0]->setting_jam_buka; ?>" required>
                                </div>
                            </div>
                            <div class="col-md-5">
                                <div class="form-group">
                                    <label>Jam Tutup Antrian <small class="text-red">*</small></label>
                                    <input type="time" class="form-control" placeholder="Jam Tutup" name="setting_jam_tutup" value="<?php echo $setting[0]->setting_jam_tutup; ?>" required>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-7">
                        <div class="row">
                            <div class="col-md-12">
                                <h2 class="fontPoppins"><i class="text-red fa fa-user"></i> Pemiliki Aplikasi</h2>
                                <hr style="border: 0.5px dashed #d2d6de">
                            </div>
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label> Pemilik/Kantor/Instansi <small class="text-red">*</small></label>
                                    <input type="text" class="form-control" placeholder="Pemiliki/Kantor/Instansi" name="setting_owner_name" value="<?php echo $setting[0]->setting_owner_name; ?>" required>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label> Telepon </label>
                                    <input type="text" class="form-control" placeholder="Telepon" name="setting_phone" value="<?php echo $setting[0]->setting_phone; ?>">
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label> Email </label>
                                    <input type="text" class="form-control" placeholder="Email" name="setting_email" value="<?php echo $setting[0]->setting_email; ?>">
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label> Kota/Kabupaten <small class="text-red">*</small></label>
                                    <input type="text" class="form-control" placeholder="Asal/Kota/kabupaten" name="setting_origin_app" value="<?php echo $setting[0]->setting_origin_app; ?>" required>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label> Alamat <small class="text-red">*</small></label>
                                    <textarea class="form-control" name="setting_address" placeholder="Alamat" rows="5"><?php echo $setting[0]->setting_address; ?></textarea>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-5">
                        <div class="row">
                            <div class="col-md-12">
                                <h2 class="fontPoppins"><i class="text-red fa fa-sliders"></i> Preference</h2>
                                <hr style="border: 0.5px dashed #d2d6de">
                            </div>

                            <div class="col-md-12">
                                <div class="form-group">
                                    <label> Layout</label>
                                    <select class="form-control" name="setting_layout">
                                        <?php
                                        $layout = array('default', 'sidebar-collapse', 'layout-boxed');
                                        for ($l = 0; $l < count($layout); $l++) {
                                            if ($layout[$l] == $setting[0]->setting_layout) {
                                                echo '<option value="' . $layout[$l] . '" selected>' . $layout[$l] . '</option>';
                                            } else {
                                                echo '<option value="' . $layout[$l] . '">' . $layout[$l] . '</option>';
                                            }
                                        }
                                        ?>

                                    </select>
                                </div>
                            </div>

                            <div class="col-md-12">
                                <div class="form-group">
                                    <label> Warna</label>
                                    <select class="form-control" name="setting_color">
                                        <?php
                                        $color = array('skin-black', 'skin-black-light', 'skin-red', 'skin-red-light', 'skin-green', 'skin-green-light', 'skin-blue', 'skin-blue-light', 'skin-yellow', 'skin-yellow-light', 'skin-purple', 'skin-purple-light');
                                        for ($c = 0; $c < count($color); $c++) {
                                            if ($color[$c] == $setting[0]->setting_color) {
                                                echo '<option value="' . $color[$c] . '" selected>' . $color[$c] . '</option>';
                                            } else {
                                                echo '<option value="' . $color[$c] . '">' . $color[$c] . '</option>';
                                            }
                                        }
                                        ?>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">

                    <div class="col-md-12">
                        <div class="form-group">
                            <label for=""><b style="color: black">Isi Informasi Bantuan <span style="color:red">*</span></b></label>
                            <textarea cols="80" id="editor" name="setting_help" rows="10" style="resize:none;max-width:700px;">
                                <?= $setting[0]->setting_help ?></textarea>
                        </div>
                    </div>

                </div>





            </div>
            <div class="box-footer">
                <small>Page rendered in <strong>{elapsed_time}</strong> seconds.</small>
            </div>
            <?php echo form_close(); ?>
        </div>
    </section>
</div>