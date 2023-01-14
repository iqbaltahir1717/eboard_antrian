            <div class="content-wrapper">
                <section class="content-header">
                    <h1 class="fontPoppins">
                        <?php echo strtoupper($title); ?>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="<?php echo site_url('admin/dashboard'); ?>"><i class="fa fa-dashboard"></i> DASHBOARD</a></li>
                        <?php
                        if ($this->uri->segment(3)) {
                            echo '<li class="active"><a href="' . site_url('admin/' . $this->uri->segment(2)) . '">' . strtoupper($this->uri->segment(2)) . '</a></li>';
                            echo '<li class="active">' . strtoupper($this->uri->segment(3)) . '</li>';
                        } else {
                            echo '<li class="active">' . strtoupper($this->uri->segment(2)) . '</li>';
                        }
                        ?>

                    </ol>
                </section>

                <section class="content">
                    <div class="box">
                        <div class="box-header with-border">

                        </div>
                        <div class="box-body" style="text-align: center;">
                            <div class="image">
                                <img src="<?php echo base_url(); ?>assets/core-images/<?php echo $setting[0]->setting_logo; ?>" alt="" width="250px">
                            </div>
                            <br>
                            <p><b><?php echo $setting[0]->setting_owner_name; ?></b></p>
                            <p><i class="fa fa-location-arrow"></i> <?php echo $setting[0]->setting_address; ?></p>
                            <p><i class="fa fa-phone"></i> <?php echo $setting[0]->setting_phone; ?></p>
                            <p><i class="fa fa-envelope-o"></i> <?php echo $setting[0]->setting_email; ?></p>
                            <p> <i class="fa fa-clock-o"></i> Jam Buka Pukul <?php echo $setting[0]->setting_jam_bukas . ' - ' . $setting[0]->setting_jam_tutups; ?> WITA</p>
                            <p><?php echo $setting[0]->setting_about; ?></p>

                        </div>
                        <div class="box-footer">
                            <h2>Bantuan</h2>
                            <?php echo $setting[0]->setting_help; ?>
                        </div>
                    </div>
                </section>
            </div>