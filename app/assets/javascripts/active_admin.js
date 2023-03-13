//= require active_admin/base
//= require ckeditor/init

$(document).ready(function() {
  if ($('#site_title').length > 0) {
    $('#site_title').children('a').attr('target', '_blank');
  }

  $('.datepicker').datepicker({
    dateFormat: 'dd.mm.yy',
    firstDay: 1
  });
});
