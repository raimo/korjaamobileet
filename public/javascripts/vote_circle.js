(function($) {
  $.fn.voteCircle = function(options) {
    var options = jQuery.extend({
        hotList : "",
        jokeContent : "",
        valueMap: {}
    }, options);
    return this.each(function() {
      var container = this;

      $(container).find('.vote-circle').click(function() {
        var jokeContentCall = '';
        
        if (options.hotList === "") {
          jokeContentCall = '?joke_content=1';
        }
        $.get($(container).find('a:first').attr('href') + '/votes/cast'+jokeContentCall, function (data) {
          if (jokeContentCall) {
            $(options.jokeContent).append(data);
          } else {
            $(options.hotList).html(data);
          }
        });
        return false;
      });
    });
  };
})(jQuery);
