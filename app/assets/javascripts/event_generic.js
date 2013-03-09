$(document).ready(function(){
  $('.most_recent').click(function(){
    var id = $(this).attr("id")
    $('#' + id + '.less_recent').toggleClass('hidden');
  });
});
