    <footer id="footer">
        <div class="container">
            <div class="copyright">
                &copy; Copyright <strong><span><?php echo $setting[0]->setting_owner_name; ?></span></strong>. All Rights Reserved
            </div>
        </div>
    </footer><!-- End Footer -->

    <a href="#" class="back-to-top"><i class="ri-arrow-up-line"></i></a>
    <div id="preloader"></div>

    <!-- extention -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.19/js/dataTables.bootstrap4.min.js"></script>

    <script>
        $(document).ready(function() {
            $('#tabel-data').DataTable();
        });
    </script>

    <!-- Vendor JS Files -->
    <!-- <script src="<?php echo base_url() ?>assets/core-front/vendor/jquery/jquery.min.js"></script> -->
    <script src="<?php echo base_url() ?>assets/core-front/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="<?php echo base_url() ?>assets/core-front/vendor/jquery.easing/jquery.easing.min.js"></script>
    <script src="<?php echo base_url() ?>assets/core-front/vendor/php-email-form/validate.js"></script>
    <script src="<?php echo base_url() ?>assets/core-front/vendor/owl.carousel/owl.carousel.min.js"></script>
    <script src="<?php echo base_url() ?>assets/core-front/vendor/venobox/venobox.min.js"></script>
    <script src="<?php echo base_url() ?>assets/core-front/vendor/isotope-layout/isotope.pkgd.min.js"></script>
    <script src="<?php echo base_url() ?>assets/core-front/vendor/aos/aos.js"></script>
    <script src="<?php echo base_url() ?>assets/core-front/vendor/glightbox/js/glightbox.min.js"></script>
    <!-- Template Main JS File -->
    <script src="<?php echo base_url() ?>assets/core-front/js/main.js"></script>
    <script language="JavaScript" type="text/javascript">
        $(document).ready(function() {
            $('.carousel').carousel({
                interval: 5000
            })
        });
    </script>

    <script>
        var lightbox = GLightbox();
        lightbox.on('open', (target) => {
            console.log('lightbox opened');
        });
        var lightboxDescription = GLightbox({
            selector: '.glightbox2'
        });
        var lightboxVideo = GLightbox({
            selector: '.glightbox3'
        });
        lightboxVideo.on('slide_changed', ({
            prev,
            current
        }) => {
            console.log('Prev slide', prev);
            console.log('Current slide', current);

            const {
                slideIndex,
                slideNode,
                slideConfig,
                player
            } = current;

            if (player) {
                if (!player.ready) {
                    // If player is not ready
                    player.on('ready', (event) => {
                        // Do something when video is ready
                    });
                }

                player.on('play', (event) => {
                    console.log('Started play');
                });

                player.on('volumechange', (event) => {
                    console.log('Volume change');
                });

                player.on('ended', (event) => {
                    console.log('Video ended');
                });
            }
        });

        var lightboxInlineIframe = GLightbox({
            selector: '.glightbox4'
        });
    </script>

    </body>

    </html>