App.article = App.cable.subscriptions.create "ArticleChannel",
speak: (message) ->
    @perform 'speak', message: message
    
received: (data) -> 
    alert data['message']