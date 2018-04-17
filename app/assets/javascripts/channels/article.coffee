App.article = App.cable.subscriptions.create "ArticleChannel",
speak: (message) ->
    @perform 'speak', message: message
    
received: (data) -> 
    userkey = $('#randomkey').text().replace(/ /g,"" )
    if data['message'][0] == userkey
        $('.article').append '<div class="my_talk"><div class="my_talk_show">' + data['message'][1] + '</div></div>'
        $('html,body').animate scrollTop: $('#submit_chat').offset().top
    else
        if data['message'][2] == null
            data['message'][2] = "/assets/default.png"
        $('.article').append '<div class="other_people"><div class="other_people_user"><img src="'+ data['message'][2] + '" width="30" height="30">' + data['message'][3] + '</div><div class="other_people_talk">' +　data['message'][1] + '</div></div>'
        $('html,body').animate scrollTop: $('#submit_chat').offset().top