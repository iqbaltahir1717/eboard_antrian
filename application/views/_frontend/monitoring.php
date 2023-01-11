<section id="monitoring" class="d-flex justify-content-center align-content-center" style="flex-wrap: wrap;">
    <?php foreach ($spesialis as $s) {  ?>
        <div class="col-lg-2 box-item">
            <h3 id="antrian<?= $s->spesialis_id ?>"><?php echo $s->spesialis_kode_antrian . $s->antrian_saat_ini; ?></h3>
            <h4>Antrian Saat Ini</h4>
        </div>
    <?php } ?>

    <?php foreach ($spesialis as $s) {  ?>
        <div class="col-lg-2 box-item box-item-color">
            <h3 id="antrian-next<?= $s->spesialis_id ?>"><?php echo $s->spesialis_kode_antrian . $s->antrian_saat_ini + 1; ?></h3>
            <h4>Antrian Berikutnya
            </h4>
        </div>
    <?php } ?>
</section>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    $(document).ready(function() {
        function antrian() {
            url = "<?php echo base_url(); ?>monitoring/realtime";
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