import consumer from "channels/consumer"

export default consumer.subscriptions.create("ParticipantPresenceChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    this.leaveGame()
  },

  arriveAtGame(gameId) {
    this.perform('arrive_at_game', {game_id: gameId})
  },

  leaveGame() {
    this.perform('leave_game')
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel
  }
});
