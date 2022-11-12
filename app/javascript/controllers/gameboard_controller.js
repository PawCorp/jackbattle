import {Controller} from "@hotwired/stimulus";
import participant_presence_channel from "channels/participant_presence_channel";

export default class extends Controller {
    static values = {
        gameId: Number
    }
    consumer = participant_presence_channel;

    connect() {
        if (this.hasGameIdValue) {
            this.consumer.arriveAtGame(this.gameIdValue)
        }
    }

    disconnect() {
        this.consumer.leaveGame()
    }
}
