<section id="monitoring" class="d-flex justify-content-center align-content-center" style="flex-wrap: wrap;">
    <?php foreach ($spesialis as $s) {  ?>
        <div class="col-lg-2 box-item">
            <h3><?php echo $s->spesialis_kode_antrian; ?>3</h3>
            <h4>Antrian Saat Ini</h4>
        </div>
    <?php } ?>

    <?php foreach ($spesialis as $s) {  ?>
        <div class="col-lg-2 box-item box-item-color">
            <h3><?php echo $s->spesialis_kode_antrian; ?>4</h3>
            <h4>Antrian Berikutnya
            </h4>
        </div>
    <?php } ?>
</section>