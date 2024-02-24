jQuery(document).ready(function () {

  /* Advanced search for Articles */

  let filterResultAdvancedSearchElements = $('.filter-result-advanced-search');
  let resultAdvancedSearchElement = $('#result-advanced-search');

  // Show search result(s)

  function showSearchResult(articles, request) {
    filterResultAdvancedSearchElements.hide();
    resultAdvancedSearchElement.html('');
    let plural = articles.length > 1 ? 's' : '';
    resultAdvancedSearchElement.append(
      '<div class="article-request-search-result">' + articles.length + ' search result' + plural + ' for \'' + request + '\'</div>'
    );
    articles.forEach(article => {
      resultAdvancedSearchElement.append(
        '<div class="article-search-result">' +
        '<a href="' + article.url + '">' +
        '<div class="article-title">' + article.title + '</div>' +
        '<div class="article-description">' + article.description + '</div>' +
        '<div class="article-details">' +
        [article.yearMonthDay, article.category, article.tags].filter(detail => {
          return detail !== "";
        }).join(' - ') +
        '</div>' +
        '<a>' +
        '</div>'
      )
    });
    resultAdvancedSearchElement.show();
  }

  function hideSearchResult() {
    filterResultAdvancedSearchElements.hide();
    resultAdvancedSearchElement.hide();
  }

  // Text search

  let textSearchInputElement = $('#articles-text-search input');
  let textSearchIconElement = $('#articles-text-search i');

  textSearchInputElement.focus();

  let textSearchOptions = {
    shouldSort: true,
    threshold: 0.6,
    location: 0,
    distance: 0,
    maxPatternLength: 32,
    minMatchCharLength: 1,
    keys: [
      "title",
      "description",
      "authors",
      "category",
      "tags",
      "yearMonthDay"
    ]
  };

  function showTextSearchResult(searchEngineText, textSearch) {
    if (textSearch === "") {
      hideSearchResult();
      return;
    }
    let articles = searchEngineText.search(textSearch);
    showSearchResult(articles, textSearch);
  }

  function decorateTextSelector(searchEngineText) {
    textSearchInputElement.keypress(function (event) {
      var key = event.which;
      if (key !== 13) { // the enter key code
        return;
      }
      let textSearch = $(this).val();
      showTextSearchResult(searchEngineText, textSearch);
    });

    textSearchIconElement.click(function (event) {
      let textSearch = textSearchInputElement.val();
      showTextSearchResult(searchEngineText, textSearch);
    });
  }

  // Archive search

  let archiveButtonElement = $('.articles-archive-button');
  let archiveContainerElement = $('#articles-archive-container');

  function buildArchiveStructure(articles) {
    let archiveStructure = new Map();
    articles.forEach(article => {
        let year = article.year;
        let month = article.month;
        if (!archiveStructure.has(year)) {
          archiveStructure.set(year, new Set());
        }
        archiveStructure.get(year).add(month);
      }
    );
    return archiveStructure;
  }

  function buildArchivesContainerElement(archiveStructure) {
    let years = Array.from(archiveStructure.keys()).sort().reverse();
    years.forEach(year => {
      archiveContainerElement.append(
        '<div class="link search-year-article" data-year="' + year + '">' +
        year +
        '</div>');
      let months = Array.from(archiveStructure.get(year)).sort();
      archiveContainerElement.append('<ul>');
      let monthsUlElement = archiveContainerElement.find('ul').last();
      months.forEach(month => {
        let monthName = moment(month, 'MM').format('MMMM');
        let yearMonth = year + "-" + month;
        monthsUlElement.append(
          '<li>' +
          '<span class="link search-year-month-article" data-year-month="' + yearMonth + '">' +
          monthName +
          '</span>' +
          '</li>');
      });
    });
  }

  function decorateArchiveYearSelectors(articles) {
    archiveContainerElement.find('.search-year-article').click(function () {
      let year = $(this).data('year').toString();
      showSearchResult(articles.filter(article => {
        return article.year === year;
      }), year);
    });
  }

  function decorateArchiveMonthSelectors(articles) {
    archiveContainerElement.find('.search-year-month-article').click(function () {
      let yearMonth = $(this).data('year-month').toString();
      showSearchResult(articles.filter(article => {
        return article.yearMonth === yearMonth;
      }), yearMonth);
    });
  }

  archiveButtonElement.click(function () {
    resultAdvancedSearchElement.hide();
    if (archiveContainerElement.css('display') === 'none') {
      filterResultAdvancedSearchElements.hide();
      archiveContainerElement.show();
    } else {
      filterResultAdvancedSearchElements.hide();
    }
  });

  // Category search

  let categoriesButtonElement = $('.articles-categories-button');
  let categoriesContainerElement = $('#articles-categories-container');

  function buildCategoriesStructure(articles) {
    let categoriesStructure = new Set();
    articles.forEach(article => {
        let categories = article.category.split(',').filter(category => {
          return category !== '';
        });
        categories.forEach(category => categoriesStructure.add(category));
      }
    );
    return [...categoriesStructure].sort();
  }

  function buildCategoriesContainerElement(categoriesStructure) {
    categoriesContainerElement.append('<div class="article-category">');
    categoriesContainerElement.find('div').append('<ul>');
    let categoriesUlElement = categoriesContainerElement.find('ul');
    categoriesStructure.forEach(category => {
      categoriesUlElement.append(
        '<li class="search-article-category" data-category="' + category + '">' +
        '<a href="javascript:void(0);">' +
        category +
        '</a></li>');
    });
  }

  function decorateCategorySelectors(articles) {
    categoriesContainerElement.find('.search-article-category').click(function () {
      let category = $(this).data('category').toString();
      showSearchResult(articles.filter(article => {
        return article.category.split(',').includes(category);
      }), category);
    })
  }

  categoriesButtonElement.click(function () {
    resultAdvancedSearchElement.hide();
    if (categoriesContainerElement.css('display') === 'none') {
      filterResultAdvancedSearchElements.hide();
      categoriesContainerElement.show();
    } else {
      filterResultAdvancedSearchElements.hide();
    }
  });

  // Build

  $.getJSON('/search.json', function (articles) {
    let searchEngineText = new Fuse(articles, textSearchOptions);
    decorateTextSelector(searchEngineText);
    // Articles archive
    let archiveStructure = buildArchiveStructure(articles);
    buildArchivesContainerElement(archiveStructure);
    decorateArchiveYearSelectors(articles);
    decorateArchiveMonthSelectors(articles);
    // Articles categories
    let categoriesStructure = buildCategoriesStructure(articles);
    buildCategoriesContainerElement(categoriesStructure);
    decorateCategorySelectors(articles);
  });

});
