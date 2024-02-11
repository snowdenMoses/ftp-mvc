import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="categories"
export default class extends Controller {
  static targets = ["content"];
  static targets = ["test"];
  static values = {limitedCategories: {type: Array}, allCategories: {type: Array}};

  connect(){

  }
  toggle(event) {
    event.preventDefault();
    const link = event.currentTarget;
    const showAll = document.getElementById("show_all")
    const showLimited = document.getElementById("show_limited")
    if (link.dataset.showingMore === "false") {
      showAll.classList.toggle('hidden')
      showLimited.classList.toggle('hidden')
      link.textContent = "Show Less";
      link.dataset.showingMore = "true";
    } else {
      showAll.classList.toggle('hidden')
      showLimited.classList.toggle('hidden')
      link.textContent = "Show More";
      link.dataset.showingMore = "false";
    }
  }
};
