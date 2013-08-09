$(document).ready(function(){
  $('.vote').on('submit', 'form', function(event){
    event.preventDefault()
    var url = $(this).attr('action')
    var data = $(this).serialize()
    var that = $(this).parent()
    $.post(url, data, function(response){
      $(that).replaceWith(response)
    })
  })
})