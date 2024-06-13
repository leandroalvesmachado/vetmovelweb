// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

Turbo.session.drive = false

import "./theme/plugins/jquery/jquery"
import "./theme/plugins/bootstrap/js/bootstrap.bundle.min"
import "./theme/plugins/inputmask/jquery.inputmask.min"
import "./theme/plugins/select2/js/select2.full"
import "./theme/dist/js/adminlte"

$(document).ready(function() {
  $(".mask_cpf").inputmask({
    mask: "999.999.999-99", 
    clearIncomplete: true, 
    showMaskOnHover: false, 
    showMaskOnFocus: false 
  });

  $(".mask_date").inputmask({ 
    mask: "99/99/9999",
    placeholder: "dd/mm/yyyy",
    clearIncomplete: true, 
    showMaskOnHover: false, 
    showMaskOnFocus: false 
  });

  $(".mask_phone_with_ddd").inputmask({ 
    mask: "(99) 9999[9]-9999"
  });

  $('.select2').select2();
});