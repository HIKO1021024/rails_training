# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$(document).on 'keypress', '[data-behavior~=chat_input]', (event) ->
　　  if event.keyCode is 13 # return = send
　　    userkey = $('#randomkey').text().replace(/ /g,"" )
    　　App.article.speak [userkey,event.target.value]
    　　event.target.value = ''
    　　event.preventDefault()