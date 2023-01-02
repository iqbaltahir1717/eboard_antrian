    <body class="fontRubik">
        <div class="fixed-top">
            <header id="header">
                <div class="container d-flex align-items-end">
                </div>
                <div class="container d-flex align-items-center">
                    <h5 class="logo mr-auto"><a href="<?php echo base_url(); ?>" class="scrollto"><img src="<?php echo base_url() ?>assets/core-images/<?php echo $setting[0]->setting_logo; ?>"> <?php echo $setting[0]->setting_appname; ?></a> </h5>
                    <nav class="nav-menu d-none d-lg-block">
                        <ul>
                            <li><a href="#">Render Time Halaman <strong>{elapsed_time}</strong> detik.</a></li>
                            <li><a href="#">Total Antrian Hari Ini = 18 / 20 </a></li>
                            <li class="active"><a href="#">Pukul <span id="jam"></span> : <span id="menit"></span> : <span id="detik"></span></a></li>
                        </ul>
                    </nav><!-- .nav-menu -->

                </div>
            </header><!-- End Header -->
        </div>
        <script>
            window.setTimeout("waktu()", 1000);

            function waktu() {
                var waktu = new Date();
                setTimeout("waktu()", 1000);
                document.getElementById("jam").innerHTML = waktu.getHours();
                document.getElementById("menit").innerHTML = waktu.getMinutes();
                document.getElementById("detik").innerHTML = waktu.getSeconds();
            }
        </script>