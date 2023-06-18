// ==UserScript==
// @name        Redirect webpages
// @version     1.0.0
// @description Redirect webpages
// @run-at      document-start
// ==/UserScript==

//var current_location = content.document.location;
// @include     https://*.reddit.com/*
// @include     https://*.com/*
//if(content.document.location == "http://google.com"){
//    window.location.replace("http://yahoo.com")
//}

(function() {
  var url = location.href;

  // Old Reddit Redirect
  if (/(?:new|www)\.reddit\.com\//.test(url)) {
    location.href = url.replace(/(?:new|www)\./, 'old.');
    return;
  }

  // Reddit Redirect > Teddit
  //if (/www\.reddit\.com\//.test(url)) {
  //  location.href = url.replace(/www\.reddit\.com/, 'teddit.net.');
  //  return;
  //}
  
  // Delete the cookie message
  var x = document.getElementsByClassName("infobar-toaster-container");
  for (var y of x) {
    y.remove();
  }

  //Quora Redirect
  if (/www\.quora\.com\//.test(url)) {
    location.href = url.replace(/www\.quora\.com/, 'quetre.iket.me');
    return;
  }

})();
