//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require turbolinks
//= require bootsy
function sub_cate(value){
$.ajax({
  type: "GET",
  url: '/sub_cate?id='+value,
  data: 'text',
  success: function(data){
    $(".auction").html(data);
  }
})
}
