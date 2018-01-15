App.post_revisions = App.cable.subscriptions.create("ApplicationCable::PostRevisionsChannel", {
  connected: function() {
    // Called when the subscription is ready for use on the server
  },

  disconnected: function() {
    // Called when the subscription has been terminated by the server
  },

  received: function(data) {
    // Called when there's incoming data on the websocket for this channel
    var result = Math.round(data.revision_count * 100 / data.users_count).toFixed(2);
    $("#post-" + data.post_id ).text(result+'%');
  }
});
