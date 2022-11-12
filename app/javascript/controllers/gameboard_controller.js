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

            /**
             * Hack to listen for ping event on actioncable.
             */
            this.consumer.consumer.connection.monitor.recordPing = new Proxy(
                this.consumer.consumer.connection.monitor.recordPing,
                {
                    apply: (target, thisArg) => {
                        this.ping()
                        return target.bind(thisArg)();
                    }
                }
            )
        }
    }

    ping () {
    }

    disconnect() {
        this.consumer.leaveGame()
    }
}
