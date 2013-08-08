$(document).ready(function(){
  $('.best-answer').on('submit', function(event){
    event.preventDefault()
    var url = $(this).attr('action')
    var data = $(this).serialize()
    console.log(url)
    console.log(data)
    var that = this
    $.post(url, data, function(response){
      console.log(response)
      $(that).replaceWith(response)
    })
  })
})
