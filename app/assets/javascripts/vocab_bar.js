$(document).ready(function() {

  function hideVocabSheetOnMobile() {
    var bar = $('.vocab_sheet_bar');
    var windowWidth = $(window).width();
    if((windowWidth < 640) || (bar.length && bar.find('.vocab_sheet_bar_item').length === 0)) {
      bar.hide();
      $('.not_sticky_footer').removeClass('vocab_sheet_background');
    } else if ((windowWidth > 639) && ($('.vocab_sheet_bar').length)) {
      bar.show();
      $('.not_sticky_footer').addClass('vocab_sheet_background');
    }
  }

  function changeVocabLocation() {
    if($('.search-result-banner').length > 0 && $('.flash').length > 0) {
      $('.vocab_sheet_bar').css("top", "350px")
    } else if ($('.search-result-banner').length > 0 && $('.flash').length < 1) {
      $('.vocab_sheet_bar').css("top", "320px")
    } else {
      return
    }
  }

  $(window).resize(function() {
    hideVocabSheetOnMobile();
  })

  hideVocabSheetOnMobile();
  changeVocabLocation();
});
