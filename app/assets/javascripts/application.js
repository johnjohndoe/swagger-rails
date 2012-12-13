//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require twitter/bootstrap/alert
//= require jquery_nested_form
//= require_self

$(document).ready(function() {
  $("[data-type=data-types-select]").each(function(){
    var data_type = $(this);
    data_type.siblings("[data-type=selector]").on("change", function() {
      var v = $(this).val()
      if(v == "Set" || v == "List" || v == "Array") {
        data_type.val(v+"[]");
        data_type.focus();
        data_type.selectRange(v.length+1, v.length+1);
      } else {
        data_type.val(v);
      }
    })
  });

});

$.fn.selectRange = function(start, end) { 
    return this.each(function() { 
        if (this.setSelectionRange) { 
            this.focus(); 
            this.setSelectionRange(start, end); 
        } else if (this. createTextRange) { 
            var range = this.createTextRange(); 
            range.collapse(true); 
            range.moveEnd('character', end); 
            range.moveStart('character', start); 
            range.select(); 
        } 
    }) ; 
};