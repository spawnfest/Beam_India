// We need to import the CSS so that webpack will load it.
// The MiniCssExtractPlugin is used to separate it out into
// its own CSS file.
import css from "../css/app.css"

// webpack automatically bundles all modules in your
// entry points. Those entry points can be configured
// in "webpack.config.js".
//
// Import dependencies
//
import "phoenix_html"

// Import local files
//
// Local files can be imported directly using relative paths, for example:
// import socket from "./socket"
import {Socket} from "phoenix"
import LiveSocket from "phoenix_live_view"

let Hooks = {}

Hooks.Card = {
    mounted(){
        this.el.addEventListener("dragstart", e => {
            console.log("drag card started")
        });

        this.el.addEventListener("dragend", e => {
            console.log("drag card end")
        });

        this.el.addEventListener("dragover", e => {
            e.preventDefault();
            console.log("drag over card, card id")
        });

        this.el.addEventListener("drop", e => {
            console.log("drop over card, card id");
            console.log(e.target.innerHTML);
        });
    }
}


let liveSocket = new LiveSocket("/live", Socket, {hooks: Hooks})
liveSocket.connect()
