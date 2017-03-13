$(document).ready(function () {
   $('#submit_product').on('click', function() {
     var product_name = $("#product_name").val();
     var product_code = $("#product_code").val();
     var category_name = $(".category_name").val();
     var unit_name = $(".unit_name").val();
     if (product_name == '' || product_code == '' || category_name == '' || unit_name == '') {
       $(".error_show").text("Vui lòng nhập các trường bắt buộc *");
       $(".error_require").removeClass("display_hidden");
       $("#show_fail").removeClass("display_hidden");
     } else {
       $(".error_require").addClass("display_hidden");
       $("#show_fail").addClass("display_hidden");
        $(".error_show").text("");
        $(".form_product").submit();
     }
   });
  $(".price").keypress(function (e) {
   if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
    $("#error_price").html("Vui lòng nhập số").show();
        return false;
    } else {
      $("#error_price").html("").hide();
      return true;
    }
  });
  $(".price_special").keypress(function (e) {
    if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
     $("#error_special").html("Vui lòng nhập số").show();
         return false;
     } else {
       $("#error_special").html("").hide();
       return true;
     }
   });

 });
