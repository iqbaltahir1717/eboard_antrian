<section id="monitoring" class="d-flex justify-content-center align-content-center" style="flex-wrap: wrap;">
    <?php foreach ($spesialis as $s) {  ?>
        <div class="col-lg-2 box-item box-item-color">
            <h3 id="antrian<?= $s->spesialis_id ?>"><?php echo $s->spesialis_kode_antrian . $s->antrian_saat_ini; ?></h3>
            <h4>Antrian Saat Ini</h4>
        </div>
    <?php } ?>

    <!-- <?php foreach ($spesialis as $s) {  ?>
        <div class="col-lg-2 box-item ">
            <h3 id="antrian-next<?= $s->spesialis_id ?>"><?php echo $s->spesialis_kode_antrian . $s->antrian_saat_ini + 1; ?></h3>
            <h4>Antrian Berikutnya
            </h4>
        </div>
    <?php } ?> -->
    <!-- <div class="col-lg-4 box-item" style="padding:0">
        <iframe width="100%" height="100%" autoplay src="https://www.youtube.com/embed/tgbNymZ7vqY?autoplay=1&controls=0">
        </iframe>
    </div> -->
    <div class="col-lg-4 box-item" style="padding:0">
        <h5>
            Waktu Buka Antrian <br>
            <p class="badge badge-success" style="font-size: 25px !important"> <?= date('H:i', strtotime($setting[0]->setting_jam_buka)) . ' - ' .  date('H:i', strtotime($setting[0]->setting_jam_tutup)); ?> WITA</p>
        </h5>
        <h5>
            Waktu Saat Ini
            <p style="font-size: 45px !important"> <span id="jam"></span> : <span id="menit"></span> : <span id="detik"></span> WITA</p>
        </h5>

    </div>
</section>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    $(document).ready(function() {
        function antrian() {
            url = "<?php echo base_url(); ?>eboard/realtime";
            $.get(url, function(data, status) {
                const result = JSON.stringify(data)
                data = JSON.parse(result);
                <?php $i = 0;
                foreach ($spesialis as $s) { ?>
                    antrian_nomor<?= $s->spesialis_id ?> = data[<?= $i ?>]['antrian_saat_ini'];
                    $("#antrian<?= $s->spesialis_id ?>").html('<?= $s->spesialis_kode_antrian ?>' + antrian_nomor<?= $s->spesialis_id ?>);
                <?php $i++;
                } ?>

                <?php $j = 0;
                foreach ($spesialis as $s) { ?>
                    antrian_nomor2<?= $s->spesialis_id ?> = parseInt(data[<?= $j ?>]['antrian_saat_ini']);
                    $antrian_end2<?= $s->spesialis_id ?> = antrian_nomor2<?= $s->spesialis_id ?> + 1;
                    $("#antrian-next<?= $s->spesialis_id ?>").html('<?= $s->spesialis_kode_antrian ?>' + $antrian_end2<?= $s->spesialis_id ?>);
                <?php $j++;
                } ?>

            });
        }
        antrian();

        setInterval(function() {
            antrian();
        }, 100)

    });
</script>

<script src="<?php echo base_url(); ?>assets/core-admin/core-component/jquery/dist/jquery.min.js"></script>
<script src="<?php echo base_url(); ?>assets/core-admin/core-component/bootstrap/dist/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/particles.js@2.0.0/particles.js"></script>
<script src="https://cdn.jsdelivr.net/npm/particles.js@2.0.0/particles.min.js"></script>
<script>
    particlesJS({
        "particles": {
            "number": {
                "value": 80,
                "density": {
                    "enable": true,
                    "value_area": 800
                }
            },
            "color": {
                "value": "#ffffff"
            },
            "shape": {
                "type": "circle",
                "stroke": {
                    "width": 0,
                    "color": "#000000"
                },
                "polygon": {
                    "nb_sides": 5
                },
                "image": {
                    "src": "img/github.svg",
                    "width": 100,
                    "height": 100
                }
            },
            "opacity": {
                "value": 0.5,
                "random": false,
                "anim": {
                    "enable": false,
                    "speed": 1,
                    "opacity_min": 0.1,
                    "sync": false
                }
            },
            "size": {
                "value": 10,
                "random": true,
                "anim": {
                    "enable": false,
                    "speed": 80,
                    "size_min": 0.1,
                    "sync": false
                }
            },
            "line_linked": {
                "enable": true,
                "distance": 300,
                "color": "#ffffff",
                "opacity": 0.4,
                "width": 2
            },
            "move": {
                "enable": true,
                "speed": 4,
                "direction": "none",
                "random": false,
                "straight": false,
                "out_mode": "out",
                "bounce": false,
                "attract": {
                    "enable": false,
                    "rotateX": 600,
                    "rotateY": 1200
                }
            }
        },
        "interactivity": {
            "detect_on": "canvas",
            "events": {
                "onhover": {
                    "enable": false,
                    "mode": "repulse"
                },
                "onclick": {
                    "enable": true,
                    "mode": "push"
                },
                "resize": true
            },
            "modes": {
                "grab": {
                    "distance": 800,
                    "line_linked": {
                        "opacity": 1
                    }
                },
                "bubble": {
                    "distance": 10000,
                    "size": 80,
                    "duration": 2,
                    "opacity": 0.8,
                    "speed": 3
                },
                "repulse": {
                    "distance": 4000,
                    "duration": 0.4
                },
                "push": {
                    "particles_nb": 4
                },
                "remove": {
                    "particles_nb": 2
                }
            }
        },
        "retina_detect": true
    });
</script>

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