$(document).ready(function(){
  $('.best-answer').on('submit', function(event){
    event.preventDefault()
    var url = $(this).attr('action')
    var data = $(this).serialize()
    var that = this
    $.post(url, data, function(response){
      $(that).replaceWith(response)
    })
  })
})
