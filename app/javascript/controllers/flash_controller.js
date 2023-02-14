import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="flash"
export default class extends Controller {
  hideTargets() {
    console.log('tmato');
    let flash = document.getElementById('flash'); 
    flash.classList.add("d-none"); 
  }
} 
