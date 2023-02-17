import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="flash"
export default class extends Controller {
  hideTargets() {
    let flash = document.getElementById('flash'); 
    flash.classList.add("d-none"); 
  }
} 
