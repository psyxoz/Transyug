// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery.ui
//= require jquery_ujs
//= require twitter/bootstrap
//= require admin/bootstrap
//= require admin/ckeditor/ckeditor

function remove_fields(link) {
  $(link).prev("input[type=hidden]").val("1");
  $(link).closest(".fields").hide();
}

function add_fields(link, association, content) {
  var new_id = new Date().getTime();
  var regexp = new RegExp("new_" + association, "g")
  if (association !== 'children') {
    $(link).before(content.replace(regexp, new_id));
  } else {
    $(link).after(content.replace(regexp, new_id));
  }
  $('input[id*="_' + association + '_attributes_' + new_id + '_file"]').show().trigger('click');

  if (association == 'children') {
    $('.parent_fields').sortable({handle: 'i.child_icon', items: 'div', update: function(event, ui) {reorder()}});
  }
}

$('.nav-tabs a').click(function (e) {
  e.preventDefault()
  $(this).tab('show')
})