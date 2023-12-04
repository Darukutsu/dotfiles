// ==UserScript==
// @name         Auto Skip YouTube Ads 
// @version      1.0.0
// @description  Speed up and skip YouTube ads automatically 
// @author       jso8910, Darukutsu
// @match        *://*.youtube.com/*
// @exclude      *://*.youtube.com/subscribe_embed?*
// ==/UserScript==
setInterval(() => {
    const btn = document.querySelector('.ytp-ad-skip-button-modern')
    //const btn = document.querySelector('.videoAdUiSkipButton,.ytp-ad-preview-container')
    //const btn = document.querySelector('.videoAdUiSkipButton,.ytp-ad-skip-button')

    if (btn) {
        btn.click()
    }

    const ad = [...document.querySelectorAll('.ad-showing')][0];
    if (ad) {
        //document.querySelector('video').playbackRate = 10;
        video = [...document.querySelectorAll('video')][0];
        video.currentTime =video.duration;
  }
}, 50)
