App.article = App.cable.subscriptions.create "ArticleChannel",
speak: (message) ->
    @perform 'speak', message: message
    
received: (data) -> 
    $('tbody').append '<tr><td>' + data['message'][0] + '</td><td>' + data['message'][1] + '</td></tr>'
    $('html,body').animate scrollTop: $('[href="/users/sign_out"]').offset().top