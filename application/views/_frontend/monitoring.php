<section id="monitoring" class="d-flex justify-content-center align-content-center" style="flex-wrap: wrap;">
    <?php foreach ($spesialis as $s) {  ?>
        <div class="col-lg-2 box-item">
            <h3 id="antrian<?= $s->spesialis_id ?>"><?php echo $s->spesialis_kode_antrian . $s->antrian_saat_ini; ?></h3>
            <h4>Antrian Saat Ini</h4>
        </div>
    <?php } ?>

    <?php foreach ($spesialis as $s) {  ?>
        <div class="col-lg-2 box-item box-item-color">
            <h3><?php echo $s->spesialis_kode_antrian . $s->antrian_saat_ini + 1; ?></h3>
            <h4>Antrian Berikutnya
            </h4>
        </div>
    <?php } ?>
</section>

<script>
    $(document).ready(function() {
        function antrian() {
            url = "<?php echo base_url(); ?>monitoring/realtime";
            $.get(url, function(data, status) {
                data = JSON.parse(data);

                <?php $i = 0;
                foreach ($spesialis as $s) { ?>
                    antrian_nomor<?= $s->spesialis_id ?> = data[<?= $i ?>]['antrian_saat_ini'];
                    $("#antrian<?= $s->spesialis_id ?>").html(antrian_nomor<?= $s->spesialis_id ?>);
                <?php $i++;
                } ?>

            });
        }
        antrian();

        setInterval(function() {
            antrian();
        }, 3000)

    });
</script>