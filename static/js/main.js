jQuery(document).ready(function () {

  // toggle menu for small screen

  const menuIcon = $("#menu-icon");
  const sidebar = $("#sidebar");
  const sidebarOverlay = $("#sidebar-overlay");
  $(".menu-content").first().clone().appendTo("#sidebar");
  const menuContentSelect = sidebar.find(".menu-content select");

  function showMenu() {
    sidebarOverlay.show();
    sidebar.css("right", "0");
  }

  function hideMenu() {
    sidebar.css("right", "-250px");
    setTimeout(function () {
      // avoid to open and to close menu too quickly
      sidebarOverlay.hide();
    }, 900);
  }

  menuIcon.click(function () {
    showMenu();
  });

  sidebarOverlay.click(function (event) {
    const target = $(event.target)
    if (target.is(".menu-content select")) {
      return;
    }
    hideMenu();
  });

  menuContentSelect.change(function() {
    hideMenu();
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

});

