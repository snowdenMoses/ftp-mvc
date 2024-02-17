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

  toggleSidePanel(event){
    event.preventDefault()
    const sidePanel = document.getElementById('side-panel')
    const sidePanelClosedMenuBar = document.getElementById('side-panel-closed-menu-toggle')
    const sidePanelOpenMenuBar = document.getElementById('side-panel-open-menu-toggle')
    sidePanel.classList.toggle("side-panel")
    sidePanelOpenMenuBar.classList.toggle("hidden")
    sidePanelClosedMenuBar.classList.toggle("hidden")

  }

  showStatemodal(event){
    event.preventDefault()
    const stateModal = document.getElementById('state-modal')
    const stateModalOverlay = document.getElementById('state-modal-overlay')
    stateModal.classList.remove("hidden")
    stateModalOverlay.classList.remove("overlay-hide")

  }

  hideStatemodal(event){
    event.preventDefault()
    const stateModalOverlay = document.getElementById('state-modal-overlay')
    const stateModal = document.getElementById('state-modal')
    stateModal.classList.add("hidden")
    stateModalOverlay.classList.add ("overlay-hide")
  }
};
