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
                            <div class="box-tools pull-left">
                                <div class="form-inline">
                                </div>
                            </div>
                            <div class="box-tools pull-right">
                                <div style="padding-top:10px">
                                    <a href="<?php echo site_url('admin/spesialis') ?>" class="btn btn-success btn-flat" title="Refresh halaman">refresh</a>
                                    <!-- <button type="submit" class="btn btn-primary btn-flat" title="Tambah data" data-toggle="modal" data-target="#modalCreate"> tambah</button> -->
                                </div>

                                <!-- Modal-->
                                <div class="modal fade" id="modalCreate" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="staticBackdrop" aria-hidden="true">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="exampleModalLabel">Tambah Data Baru</h5>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <i aria-hidden="true" class="ki ki-close"></i>
                                                </button>
                                            </div>
                                            <?php echo form_open("admin/group/spesialis_create") ?>
                                            <div class="modal-body">
                                                <div class="form-group">
                                                    <label for=""><b style="color: black">Nama Spesialis <span style="color:red">*</span></b></label>
                                                    <?php echo csrf(); ?>
                                                    <input type="text" class="form-control" placeholder="Nama Spesialis" name="spesialis_nama" required="required">
                                                </div>
                                                <div class="form-group">
                                                    <label for=""><b style="color: black">Nama Dokter <span style="color:red">*</span></b></label><br>
                                                    <select class="form-control select2" name="user_id" required style="width: 100%">
                                                        <option value="">- Pilih Dokter -</option>
                                                        <?php
                                                        foreach ($dokter as $g) {
                                                            if ($key->user_id == $g->user_id) {
                                                                echo '<option value="' . $g->user_id . '" selected>' . $g->user_fullname . '</option>';
                                                            } else {
                                                                echo '<option value="' . $g->user_id . '">' . $g->user_fullname . '</option>';
                                                            }
                                                        }
                                                        ?>
                                                    </select>
                                                </div>
                                                <div class="form-group">
                                                    <label for=""><b style="color: black">Layanan <span style="color:red">*</span></b></label>
                                                    <select class="form-control" name="spesialis_active" required>
                                                        <option value="1">- Aktif </option>
                                                        <option value="0">- TIdak Aktif -</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="submit" class="btn btn-primary font-weight-bold">Simpan</button>
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
                                echo "Kata Kunci Pencarian : <span class='label label-danger label-inline font-weight-lighter mr-2'>" . $search . "</span><hr style='border: 0.5px dashed #d2d6de'>";
                            }
                            ?>
                            <table class="table table-bordered">
                                <tr style="background-color: gray;color:white">
                                    <th style="width: 60px">No</th>
                                    <th style="width: 20%">#aksi</th>
                                    <th>Nama Spesialis</th>
                                    <th>Nama Dokter Aktif</th>
                                    <!-- <th>Layanan</th> -->
                                </tr>
                                <?php
                                if ($spesialis) {
                                    $nox = 1;
                                    $no = 1;
                                    foreach ($spesialis as $key) {
                                ?>
                                        <tr>
                                            <td><?php echo $no + $numbers; ?></td>
                                            <td>
                                                <!-- <button class="btn btn-xs btn-flat btn-info" data-toggle="modal" data-target="#modalDetail<?php echo $key->spesialis_id; ?>">detail</button> -->
                                                <button class="btn btn-xs btn-flat btn-primary" data-toggle="modal" data-target="#modalUpdate<?php echo $key->spesialis_id; ?>">update</button>
                                                <!-- <button class="btn btn-xs btn-flat btn-danger" data-toggle="modal" data-target="#modalDelete<?php echo $key->spesialis_id ?>">hapus</button> -->
                                            </td>
                                            <td><?php echo $key->spesialis_nama; ?></td>
                                            <td><?php echo $key->user_fullname; ?></td>
                                            <!-- <td><?php if ($key->spesialis_active == 1) { ?>
                                                    <i class="fa fa-circle   text-green"></i> Aktif
                                                <?php } else { ?> <i class="fa fa-circle text-red"></i> Tidak Aktif <?php } ?>
                                            </td> -->
                                        </tr>
                                        <!-- Modal Update-->
                                        <div class="modal fade" id="modalUpdate<?php echo $key->spesialis_id ?>" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="staticBackdrop" aria-hidden="true">
                                            <div class="modal-dialog" role="document">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title" id="exampleModalLabel">Update Data</h5>
                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                            <i aria-hidden="true" class="ki ki-close"></i>
                                                        </button>
                                                    </div>
                                                    <?php echo form_open("admin/group/spesialis_update") ?>
                                                    <div class="modal-body">
                                                        <div class="form-group">
                                                            <label for=""><b style="color: black">Nama Spesialis <span style="color:red">*</span></b></label>
                                                            <?php echo csrf(); ?>
                                                            <input type="text" class="form-control" placeholder="Nama Group" name="spesialis_nama" required="required" value="<?php echo $key->spesialis_nama; ?>">
                                                            <input type="hidden" class="form-control" name="spesialis_id" required="required" value="<?php echo $key->spesialis_id; ?>">
                                                        </div>
                                                        <div class="form-group">
                                                            <label for=""><b style="color: black">Nama Dokter <span style="color:red">*</span></b></label>
                                                            <select class="form-control select2" name="user_id" required style="width: 100%">
                                                                <option value="">- Pilih Dokter -</option>
                                                                <?php
                                                                foreach ($dokter as $g) {
                                                                    if ($key->user_id == $g->user_id) {
                                                                        echo '<option value="' . $g->user_id . '" selected>' . $g->user_fullname . '</option>';
                                                                    } else {
                                                                        echo '<option value="' . $g->user_id . '">' . $g->user_fullname . '</option>';
                                                                    }
                                                                }
                                                                ?>
                                                            </select>
                                                        </div>
                                                        <!-- <div class="form-group">
                                                            <label for=""><b style="color: black">Layanan <span style="color:red">*</span></b></label>
                                                            <select class="form-control" name="spesialis_active" required>
                                                                <?php
                                                                $active = array('Aktif', 'Tidak Aktif');
                                                                $active_id = array(1, 0);
                                                                if ($key->spesialis_active == 1) $key->spesialis_active = 'Aktif';
                                                                else $key->spesialis_active = 'Tidak Aktif';
                                                                for ($c = 0; $c < count($active); $c++) {
                                                                    if ($active[$c] == $key->spesialis_active) {
                                                                        echo '<option value="' . $active_id[$c] . '" selected>' . $active[$c] . '</option>';
                                                                    } else {
                                                                        echo '<option value="' . $active_id[$c] . '">' . $active[$c] . '</option>';
                                                                    }
                                                                }
                                                                ?>
                                                            </select>
                                                        </div> -->
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="submit" class="btn btn-warning font-weight-bold">Update</button>
                                                        <?php echo form_close(); ?>
                                                        <button type="button" class="btn btn-light-primary font-weight-bold" data-dismiss="modal">Batal</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <!-- Modal Delete-->
                                        <div class="modal fade" id="modalDelete<?php echo $key->spesialis_id ?>" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="staticBackdrop" aria-hidden="true">
                                            <div class="modal-dialog" role="document">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title" id="exampleModalLabel">Hapus Data</h5>
                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                            <i aria-hidden="true" class="ki ki-close"></i>
                                                        </button>
                                                    </div>
                                                    <?php echo form_open("admin/group/spesialis_delete") ?>
                                                    <div class="modal-body">
                                                        Apakah anda yakin akan menghapus data spesialis : <?php echo $key->spesialis_nama; ?> ?
                                                        <?php echo csrf(); ?>
                                                        <input type="hidden" class="form-control" placeholder="Nama Group" name="spesialis_nama" required="required" value="<?php echo $key->spesialis_nama; ?>">
                                                        <input type="hidden" class="form-control" name="spesialis_id" required="required" value="<?php echo $key->spesialis_id; ?>">
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="submit" class="btn btn-danger font-weight-bold">Hapus</button>
                                                        <?php echo form_close(); ?>
                                                        <button type="button" class="btn btn-light-primary font-weight-bold" data-dismiss="modal">Batal</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <!-- Modal Detail-->
                                        <div class="modal fade" id="modalDetail<?php echo $key->spesialis_id ?>" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="staticBackdrop" aria-hidden="true">
                                            <div class="modal-dialog" role="document">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title" id="exampleModalLabel">Detail Data</h5>
                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                            <i aria-hidden="true" class="ki ki-close"></i>
                                                        </button>
                                                    </div>

                                                    <div class="modal-body">
                                                        <b>Nama Spesialis : </b><br><?php echo $key->spesialis_nama; ?><br><br>
                                                        <b>Nama Dokter : </b><br><?php echo $key->user_fullname; ?><br><br>
                                                        <b>Layanan : </b><br><?php echo $key->spesialis_active; ?><br><br>

                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-light-primary font-weight-bold" data-dismiss="modal">Tutup</button>
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
                                            <td colspan="3">Tidak ada ditemukan</td>
                                        </tr>
                                        ';
                                }
                                ?>


                            </table>
                        </div>
                        <div class="box-footer">



                            <!-- PAGINATION -->
                            <div class="float-right"><?php echo $links; ?></div>

                            <!-- COUNT DATA -->
                            <?php if ($spesialis) { ?>
                                <div class="float-left">Tampil <?php echo ($nox + $numbers) . " - " . (count($spesialis) + $numbers) . " dari " . $total_data; ?> Data</div>
                            <?php } else { ?>
                                <div class="float-left">Tampil 0 <?php echo " dari " . $total_data; ?> Data</div>
                            <?php } ?>
                            <small>Page rendered in <strong>{elapsed_time}</strong> seconds.</small>
                        </div>
                    </div>
                </section>
            </div>