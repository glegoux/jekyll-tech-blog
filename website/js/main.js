jQuery(document).ready(function () {

  // toggle menu for small screen

  let menuIcon = $("#menu-icon");
  let menuContent = $(".menu-content");
  let sidebarOverlay = $("#sidebar-overlay");
  let sidebar = $("#sidebar");

  menuContent.clone().appendTo("#sidebar");

  menuIcon.click(function () {
    sidebarOverlay.show();
    sidebar.css("right", "0");
  });

  sidebarOverlay.click(function () {
    sidebar.css("right", "-250px");
    setTimeout(function () {
      sidebarOverlay.hide();
    }, 900);
  });

  // focus for menu

  $("header li a").each(function () {
    let urlPath = window.location.pathname;
    let focusPath = $(this).attr("href");
    if (urlPath.startsWith(focusPath)) {
      $(this).addClass("focus");
    } else {
      $(this).removeClass("focus");
    }
  });

  // Multi-lang

  let originalLanguage = "english";
  let originalLangHeader = $("#original-lang");
  let langs = $(".lang");

  function changeLanguage(language) {
    if (originalLanguage === language) {
      originalLangHeader.hide();
    } else {
      originalLangHeader.show();
    }
    langs.each(function () {
      if (language === $(this).data("lang")) {
        $(this).find("span").addClass("focus");
      } else {
        $(this).find("span").removeClass("focus");
      }
    });
    // Called twice
    googleTranslate(language);
    googleTranslate(language);
    window.localStorage.setItem('lang', language);
  }

  // init translation
  let currentLanguage = window.localStorage.getItem('lang');
  if (currentLanguage === null) {
    let browserLanguage = navigator.language.substring(0, 2);
    if (browserLanguage === "fr") {
      changeLanguage("french");
    } else {
      changeLanguage(originalLanguage);
    }
  } else {
    changeLanguage(currentLanguage);
  }

  // update translation
  langs.click(function () {
    let language = $(this).data("lang");
    changeLanguage(language);
  });

});

