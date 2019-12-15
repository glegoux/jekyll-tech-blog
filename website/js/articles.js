jQuery(document).ready(function () {

  /* Advanced Search */

  // Text search

  let commonSearchOptions = {
    shouldSort: true,
    threshold: 0.6,
    location: 0,
    distance: 0,
    maxPatternLength: 32,
    minMatchCharLength: 3
  };

  let filterResultAdvancedSearchElements = $('.filter-result-advanced-search');
  let resultAdvancedSearchElement = $('#result-advanced-search');

  // Show result

  function showResult(articles) {
    filterResultAdvancedSearchElements.hide();
    resultAdvancedSearchElement.html('');
    articles.forEach(article => {
      resultAdvancedSearchElement.append(
        '<div>' +
        '<a href="' + article.url + '">' +
        article.title +
        '<a>' +
        '</div>'
      )
    });
    resultAdvancedSearchElement.show();
  }

  // Articles archive

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
        '<div class="year" data-year="' + year + '">' +
        '<a href="javascript:">' +
        year +
        '</a></div>');
      let months = Array.from(archiveStructure.get(year)).sort();
      archiveContainerElement.append('<ul>');
      let monthsUlElement = archiveContainerElement.find('ul').last();
      months.forEach(month => {
        let monthName = moment(month, 'MM').format('MMMM');
        let yearMonth = year + "-" + month;
        monthsUlElement.append(
          '<li><a href="javascript:">' +
          '<span class="month" data-year-month="' + yearMonth + '">' +
          monthName +
          '</span>' +
          '</a></li>');
      });
    });
  }

  function decorateArchiveYearSelectors(articles) {
    archiveContainerElement.find('.year').click(function () {
      let year = $(this).data('year').toString();
      showResult(articles.filter(article => {
        return article.year === year;
      }));
    });
  }

  function decorateArchiveMonthSelectors(articles) {
    archiveContainerElement.find('.month').click(function () {
      let yearMonth = $(this).data('year-month').toString();
      showResult(articles.filter(article => {
        return article.yearMonth === yearMonth;
      }));
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

  // Articles categories

  let categoriesButtonElement = $('.articles-categories-button');
  let categoriesContainerElement = $('#articles-categories-container');

  function buildCategoriesStructure(articles) {
    let categoriesStructure = new Set();
    articles.forEach(article => {
        let categories = article.categories.split(',').filter(category => {
          return category !== '';
        });
        categories.forEach(category => categoriesStructure.add(category));
      }
    );
    return categoriesStructure;
  }

  function buildCategoriesContainerElement(categoriesStructure) {
    categoriesContainerElement.append('<div class="article-categories">');
    categoriesContainerElement.find('div').append('<ul>');
    let categoriesUlElement = categoriesContainerElement.find('ul');
    categoriesStructure.forEach(category => {
      categoriesUlElement.append(
        '<li class="article-category" data-category="' + category + '">' +
        '<a href="javascript:">' +
        category +
        '</a></li>');
    });
  }

  function decorateCategories(articles) {
    $('.article-category').click(function () {
      let category = $(this).data('category').toString();
      showResult(articles.filter(article => {
        return article.categories.split(',').includes(category);
      }));
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
    // Text search
    commonSearchOptions['keys'] = [
      "title",
      "categories",
      "description",
      "label"
    ];
    let searchEngineText = new Fuse(articles, commonSearchOptions);
    // TODO: Implement search text
    // Articles archive
    let archiveStructure = buildArchiveStructure(articles);
    buildArchivesContainerElement(archiveStructure);
    decorateArchiveYearSelectors(articles);
    decorateArchiveMonthSelectors(articles);
    // Articles categories
    let categoriesStructure = buildCategoriesStructure(articles);
    buildCategoriesContainerElement(categoriesStructure);
    decorateCategories(articles);
  });

});
