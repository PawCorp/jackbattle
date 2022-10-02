import { Controller } from "@hotwired/stimulus";
import participant_presence_channel from "channels/participant_presence_channel";

export default class extends Controller {
  consumer = participant_presence_channel;

  connect() {
    this.consumer.arriveAtGame(1)
  }

  disconnect() {
    this.consumer.leaveGame()
  }
}
