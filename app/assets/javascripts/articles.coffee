# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'click', '[id~=submit_chat]', ->
  userkey = $('#randomkey').text().replace(/ /g,"" )
  m_value = $('[data-behavior~=chat_input]')[0].value
  if m_value != ""
    App.article.speak [userkey,m_value]
    $('[data-behavior~=chat_input]')[0].value = ''
    return

$ ->
    $('html,body').animate scrollTop: $('#submit_chat').offset().top

$(document).on 'keypress', '[data-behavior~=chat_input]', (event) ->
　　  if event.keyCode is 13 # return = send
　　    if event.target.value != ""
　　        userkey = $('#randomkey').text().replace(/ /g,"" )
　　        App.article.speak [userkey,event.target.value]
　　        event.target.value = ''
　　        event.preventDefault()