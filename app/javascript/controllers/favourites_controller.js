import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="favourites"
export default class extends Controller {
  static targets = ["favbtn"]
  connect() {
  }

  changeColor(){
    this.favbtnTarget.style = "color: red"
  }
}
