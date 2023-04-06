<html>
    <header>
        <style>
            p{
                font-size: 10px;
            }

            @page {
                size: 7cm 7.5cm;
                margin: 5mm 5mm 5mm 5mm;
                 /* change the margins as you want them to be. */
            }

            @media print {
                .btn {display: none;}
            }

            .btn{
                background-color: blue;
                color: white;
                padding: 20px;
                text-decoration: none;
                border-radius: 9px;
                position: absolute;
                left: 20px;
                top: 20px;
            }
        </style>
    </header>
    <body>
    <center>
        <h3><?php echo $setting[0]->setting_appname; ?></h3>
        <p><?php echo $setting[0]->setting_address; ?></p>
        <p>telp: <?php echo $setting[0]->setting_phone; ?></p>
        <p>email: <?php echo $setting[0]->setting_email; ?></p>
        <hr>

        <h1><?= $profile_antrian[0]->antrian_nomor ?></h1>
        <p>Arrival Time : <?= $profile_antrian[0]->createtime ?>; <?= $profile_antrian[0]->arrival_time ?> WITA</p>
        <p>Silahkan menunggu giliran antrian</p>
        
    </center>
    <a class="btn" onclick="history.back()">Back</a>
    </body>

    <script>
        window.print();
        setTimeout(window.close, 0);
    </script>
</html>