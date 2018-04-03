App.room = App.cable.subscriptions.create "RoomChannel",
speak: (message) ->
    @perform 'speak', message: message
    
received: (data) -> 
    alert data['message']