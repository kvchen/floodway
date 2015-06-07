

removeFromQueue = ->
  return

addToQueue = ->
  
  return

readyNotification = ->
  return if not Notification or Notification.permission == 'denied'

  if Notification.permission != 'granted'
    Notification.requestPermission()

  notification = new Notification 'Office Hours',
    icon: null
    body: 'An assistant is on the way! Raise your hand to help them find you.'


