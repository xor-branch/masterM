import consumer from "./consumer"

document.addEventListener('turbolinks:load', () => {
  const room_element = document.getElementById('room-id');
  const room_id = room_element.getAttribute('data-room-id');
  const user_element = document.getElementById('user_element')
  const current_user = user_element.getAttribute('data-user-id');



  consumer.subscriptions.subscriptions.forEach((subscription) => {
    consumer.subscriptions.remove(subscription)
  })
  consumer.subscriptions.create({channel: "RoomChannel", room_id: room_id}, {
    connected() {
      console.log("connected to " + room_id)
      $('#room_area').append("<div class='p-2'>"+
        "<p class='text-primary' style='font-size:13px'>"+current_user+" connected to this classroom</p><div>");
      // Called when the subscription is ready for use on the server
    },

    disconnected() {
      // Called when the subscription has been terminated by the server
    },

    received(data) {
      console.log(data)
      $('#room_area').append("<div class='p-2'>"+
        "<p class='rounded bg-secondary text-primary p-2' style='font-size:13px'><small>"
        +data.user_name+"</small><br>"+data.body+"</p><div>");
      $("input[type='text']").val('');
     },
  });
})
