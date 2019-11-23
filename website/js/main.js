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

});

