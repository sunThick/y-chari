// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "popper"
import "bootstrap"



let set_position = 0;
window.addEventListener('scroll', function () {
  let element = document.getElementById('upperHeader');
  if (window.pageYOffset > 30 && screen.width < 768) {
    if (set_position < document.documentElement.scrollTop) {
      element.classList.add("d-none");
    } else {
      element.classList.remove("d-none");
    }
    set_position = document.documentElement.scrollTop;
  }    
});


//ヘッダーの位置維持//////////

var scrollpoint = 0 

document.addEventListener('turbo:before-visit', function() { //遷移する前に動くイベント
  get_scroll_point(); 
});

document.addEventListener('turbo:load', function() { //遷移後に動くイベント
  restore_scroll();
});

// スクロール位置を復元
function get_scroll_point() {
  let tableScrollYPoint = document.getElementById("upperHeader").scrollLeft; 
  scrollpoint = tableScrollYPoint  
}

function restore_scroll() {
  document.getElementById("upperHeader").scrollLeft = scrollpoint;  //遷移前のスクロール位置をテーブルに設定し、復元する
}


