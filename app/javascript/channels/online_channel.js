import consumer from "channels/consumer"

window.addEventListener("load", () => connectToOnlineChannel());

function connectToOnlineChannel() {
    const usersBox = document.querySelector("#users");

    consumer.subscriptions.create("OnlineChannel", {
        connected() {
            // Called when the subscription is ready for use on the server
        },

        disconnected() {
            // Called when the subscription has been terminated by the server
        },

        received(data) {
            if (usersBox) {
                if (data["user"]){
                    usersBox.insertAdjacentHTML("beforeend", data["user"]);
                }
                else if(data["user_id"]){
                    let user = usersBox.querySelector(`#user_id_${data["user_id"]}`);
                    usersBox.removeChild(user);
                }
            }
        }
    });
}


