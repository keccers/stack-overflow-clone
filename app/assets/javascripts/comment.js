$(document).ready(function(){
  $('.js-comment').on('click', '.new-comment', function(event){
    event.preventDefault()
    var url = $(this).attr('href')
    var that = $(this)
    $(this).hide()
    $.get(url, function(form){
      that.after(form)
    })
  })
  $('.js-comment').on('submit', 'form', function(event){
    event.preventDefault()
    var url = $(this).attr('action')
    var data = $(this).serialize()
    $(this).remove()
    $.post(url, data, function(response){
      $('.js-comment').before(response)
      $('.new-comment').show()
    })
  })
})