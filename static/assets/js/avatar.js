var avatar5 = new KTImageInput('kt_image_5');

avatar5.on('cancel', function(imageInput) {
 swal.fire({
  title: 'Image successfully changed !',
  type: 'success',
  buttonsStyling: false,
  confirmButtonText: 'Awesome!',
  confirmButtonClass: 'btn btn-primary font-weight-bold'
 });
});

avatar5.on('change', function(imageInput) {
 swal.fire({
  title: 'Image successfully changed !',
  type: 'success',
  buttonsStyling: false,
  confirmButtonText: 'Awesome!',
  confirmButtonClass: 'btn btn-primary font-weight-bold'
 });
});

avatar5.on('remove', function(imageInput) {
 swal.fire({
  title: 'Image successfully removed !',
  type: 'error',
  buttonsStyling: false,
  confirmButtonText: 'Got it!',
  confirmButtonClass: 'btn btn-primary font-weight-bold'
 });
});