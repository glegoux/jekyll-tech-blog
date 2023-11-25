jQuery(document).ready(function () {

  let tableOfContentsButton = $('#table-of-contents');
  let tableOfContentsContainer = $('#table-of-contents-container');
  let parts = $('#article-content').find('h1, h2, h3');

  if (parts.length === 0) {
    tableOfContentsButton.hide();
  }

  parts.clone().each(function () {
    let id = $(this).attr('id');
    $(this).removeAttr("id");
    let link = $("<a>");
    link.attr("href", "#" + id);
    link.append($(this));
    tableOfContentsContainer.append(link);
  });

  tableOfContentsContainer.click(function () {
    $(this).toggle();
  });

  tableOfContentsButton.click(function () {
    tableOfContentsContainer.toggle();
  });

});
