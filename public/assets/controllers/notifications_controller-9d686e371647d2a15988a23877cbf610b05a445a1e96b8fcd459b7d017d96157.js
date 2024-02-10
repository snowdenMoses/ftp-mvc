import { Controller } from "@hotwired/stimulus"
export default class extends Controller{
  connect() {
    super.connect()
    setTimeout(() => {
      this.hide();
    }, 10000);
  }

  hide(){
    this.element.classList.add('hidden')
  }
};
