            <div class="content-wrapper">
                <section class="content-header">
                    <h1>
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
                    <div class="row">
                        <div class="col-md-3">
                            <div class="box box-primary">
                                <div class="box-header with-border">
                                    <h3 class="box-title">Tentang Saya</h3>
                                </div>
                                <div class="box-body box-profile">
                                    <?php
                                    if ($this->session->userdata('user_photo') == "") {
                                        echo '<img class="profile-user-img img-responsive img-circle" src="' . base_url() . 'upload/user/noimage.png" alt="User profile picture">';
                                    } else {
                                        echo '<img class="profile-user-img img-responsive img-circle" src="' . base_url() . 'upload/user/' . $profile[0]->user_photo . '" alt="User profile picture">';
                                    }
                                    ?>
                                    <h3 class="profile-username text-center"><?php echo $profile[0]->user_fullname; ?></h3>
                                    <hr style="border: 0.5px dashed #d2d6de">

                                    <strong><i class="fa fa-circle-o text-red"></i> Nomor Telpon</strong>
                                    <p class="text-muted">
                                        <?php echo $profile[0]->user_phone; ?>
                                    </p>
                                    <hr style="border: 0.5px dashed #d2d6de">

                                    <strong><i class="fa fa-circle-o text-red"></i> Group</strong>
                                    <p class="text-muted">
                                        <?php echo $profile[0]->group_name; ?>
                                    </p>
                                    <hr style="border: 0.5px dashed #d2d6de">

                                    <small>Page rendered in <strong>{elapsed_time}</strong> seconds.</small>

                                </div>
                            </div>

                        </div>

                        <div class="col-md-9">
                            <div class="nav-tabs-custom">
                                <ul class="nav nav-tabs">
                                    <li class="active"><a href="#activity" data-toggle="tab">Form Profile</a></li>
                                </ul>
                                <div class="tab-content">
                                    <div class="active tab-pane" id="settings">
                                        <?php
                                        if ($this->session->flashdata('alert')) {
                                            echo $this->session->flashdata('alert');
                                            unset($_SESSION['alert']);
                                        }
                                        ?>
                                        <?php echo form_open_multipart("admin/profile/update", 'class="form-horizontal"') ?>
                                        <div class="form-group">
                                            <label for="inputName" class="col-sm-2 control-label">Nama Lengkap</label>
                                            <div class="col-sm-10">
                                                <?php echo csrf(); ?>
                                                <input type="text" class="form-control" placeholder="Nama User" name="user_fullname" value="<?php echo $profile[0]->user_fullname; ?>" required>
                                                <input type="hidden" class="form-control" name="user_id" value="<?php echo $profile[0]->user_id; ?>" required>
                                                <input type="hidden" class="form-control" name="old_photo" value="<?php echo $profile[0]->user_photo; ?>" required>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="inputEmail" class="col-sm-2 control-label">Nomor Telpon</label>
                                            <div class="col-sm-10">
                                                <input type="text" class="form-control" placeholder="Nomor Telpon" name="user_phone" value="<?php echo $profile[0]->user_phone; ?>" required>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">Alamat</label>
                                            <div class="col-sm-10">
                                                <input type="text" class="form-control" placeholder="Alamat" name="user_alamat" value="<?php echo $profile[0]->user_alamat; ?>" required>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">Umur</label>
                                            <div class="col-sm-10">
                                                <input type="number" class="form-control" placeholder="Umur" name="user_umur" value="<?php echo $profile[0]->user_umur; ?>" required>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">Jenis Kelamin</label>
                                            <div class="col-sm-10">
                                                <select name="user_jk" class="form-control" required>
                                                    <option value="">- Jenis Kelamin -</option>
                                                    <?php $jk = ['Laki-Laki', 'Perempuan'];
                                                    foreach ($jk as $key) { ?>
                                                        <option value="<?= $key ?>" <?php if ($key ==  $profile[0]->user_jk) echo 'selected'; ?>><?= $key ?></option>
                                                    <?php } ?>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="inputEmail" class="col-sm-2 control-label">Foto</label>
                                            <div class="col-sm-10">
                                                <input type="file" class="form-control" name="userfile">
                                            </div>
                                        </div>

                                        <hr style="border: 0.5px dashed #d2d6de">
                                        <div class="form-group">
                                            <label for="inputName" class="col-sm-2 control-label">Password</label>
                                            <div class="col-sm-10">
                                                <small style="color:red"><i>*Kosongkan jika tidak ingin mengubah password</i></small><br>
                                                <input style="margin-bottom:5px;" type="hidden" class="form-control" name="old_password" value="<?php echo $profile[0]->user_password; ?>">
                                                <input style="margin-bottom:5px;" type="text" class="form-control" placeholder="Password Lama" name="password">
                                                <input style="margin-bottom:5px;" type="text" class="form-control" placeholder="Password Baru" name="new_password">
                                                <input style="margin-bottom:5px;" type="text" class="form-control" placeholder="Konfirmasi Password Baru" name="confirm_password">
                                            </div>
                                        </div>
                                        <hr style="border: 0.5px dashed #d2d6de">
                                        <div class="form-group">
                                            <div class="col-sm-offset-2 col-sm-10">
                                                <button type="submit" class="btn btn-danger">Update Profile</button>
                                            </div>
                                        </div>
                                        <?php echo form_close(); ?>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </div>