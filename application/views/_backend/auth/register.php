<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title><?php echo $setting[0]->setting_appname; ?> | Login</title>
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <link rel="icon" href="<?php echo base_url(); ?>assets/core-images/<?php echo $setting[0]->setting_logo; ?>">
    <link rel="stylesheet" href="<?php echo base_url(); ?>assets/core-admin/core-component/bootstrap/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="<?php echo base_url(); ?>assets/core-admin/core-component/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="<?php echo base_url(); ?>assets/core-admin/core-component/Ionicons/css/ionicons.min.css">
    <link rel="stylesheet" href="<?php echo base_url(); ?>assets/core-admin/core-dist/css/AdminLTE.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
    <link href="https://fonts.googleapis.com/css?family=Anton|Permanent+Marker|Quicksand" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;400&display=swap" rel="stylesheet">
    <style type="text/css">
        .fontQuicksand {
            font-family: 'Quicksand', sans-serif;
        }

        .fontPoppins {
            font-family: 'Poppins', sans-serif;
        }

        .login-box-body {

            background: radial-gradient(100% 1036.14% at 0% 0%, rgba(126, 126, 126, 0.42) 0%, rgba(129, 129, 129, 0.06) 100%)
                /* warning: gradient uses a rotation that is not supported by CSS and may not behave as expected */
            ;
            border: 1px solid rgba(255, 255, 255, 0.3);
            box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
            backdrop-filter: blur(12px);
            /* Note: backdrop-filter has minimal browser support */

            border-radius: 31px;
            padding: 20px 40px !important;
        }

        input {
            border-radius: 12px !important;
            padding: 20px !important;
        }
    </style>
</head>

<body class="hold-transition login-page fontPoppins" style="background-position: center; background-repeat: no-repeat; background-size: cover; background-image: url(<?php echo base_url(); ?>assets/core-images/<?php echo $setting[0]->setting_background; ?>)">

    <div class="login-box">
        <div class="login-logo">
            <img src="<?php echo base_url(); ?>assets/core-images/<?php echo $setting[0]->setting_logo; ?>" alt="" width="30%">
        </div>

        <div class="login-box-body">
            <br>
            <?php
            if ($this->session->flashdata('alert')) {
                echo $this->session->flashdata('alert');
                unset($_SESSION['alert']);
            }
            ?>
            <!-- Start Form Login -->
            <?php echo form_open("auth/create"); ?>
            <div class="form-group has-feedback">
                <?php echo csrf(); ?>
                <input type="text" class="form-control" placeholder="Masukkan Nama Lengkap" name="user_fullname" required value="<?= $user_fullname; ?>">
            </div>
            <div class="form-group has-feedback">
                <?php echo csrf(); ?>
                <input type="text" class="form-control" placeholder="Nomor Telpon" name="user_phone" required value="<?= $user_phone ?>">
            </div>
            <div class="form-group has-feedback">
                <input type="password" class="form-control" placeholder="Masukkan Password" name="user_password" required value="<?= $user_password ?>">
            </div>
            <div class="form-group has-feedback">
                <input type="password" class="form-control" placeholder="Masukkan Konfirmasi Password" name="password_confirm" required value="<?= $password_confirm ?>">
            </div>
            <hr style="border: 0.5px dashed #fff">
            <div class="row">
                <div class="col-xs-12">
                    <button type="submit" class="btn btn-primary btn-block btn-flat hovers" style="border-radius: 12px;padding: 12px 0">Daftar</button>
                </div>
            </div>
            <?php echo form_close(); ?>
            <!-- End Form Login -->
            <br>
            <p class="text-center" style="color: #ffff;">
                Sudah mempunyai akun ? <a href="<?php echo site_url('auth/') ?>" style="color:#8bff6c;"><u>masuk disini</u></a><br>
                <?php echo $setting[0]->setting_owner_name; ?><br>
            </p>
        </div>
    </div>

    <script src="<?php echo base_url(); ?>assets/core-admin/core-component/jquery/dist/jquery.min.js"></script>
    <script src="<?php echo base_url(); ?>assets/core-admin/core-component/bootstrap/dist/js/bootstrap.min.js"></script>
</body>

</html>