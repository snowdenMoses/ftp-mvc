import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="general"
export default class extends Controller {
  connect() {
  }

  menubar_toggle(event){
    event.preventDefault()
    const openMenuBar = document.getElementById('open-menu-toggle')
    const closedMenuBar = document.getElementById('closed-menu-toggle')
    const loginButton = document.getElementById('login-button')
    const menuCard = document.getElementById('menu-card')
    // loginButton.classList.toggle('log-in-button')
    menuCard.classList.toggle('hidden')
    openMenuBar.classList.toggle('hidden')
    closedMenuBar.classList.toggle('hidden')

  }

  menuItemsClose(event){
    event.preventDefault()
    const openMenuBar = document.getElementById('open-menu-toggle')
    const closedMenuBar = document.getElementById('closed-menu-toggle')
    const loginButton = document.getElementById('login-button')
    const menuCard = document.getElementById('menu-card')
    // loginButton.classList.toggle('log-in-button')
    menuCard.style.display = "hidden"
    openMenuBar.classList.toggle('hidden')
    closedMenuBar.classList.toggle('hidden')

  }
}
