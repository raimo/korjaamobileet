(function($) {
  $.fn.commenter = function(options) {
    var options = jQuery.extend({
        hotList : "",
        jokeContent : "",
        valueMap: {}
    }, options);
    return this.each(function() {
      var container = this;


      $(container).find('.new-comment-button').click(function () {
        $.get($(this).attr('href'), function (data) {
          $(container).find('.new-comment').html(data);
          $(container).find('textarea').autogrow();

          $(container).find('.show-new-comment').hide();
          initializeFormHandler();
        });
        return false;
      });

      var initializeFormHandler = function () {
        $(container).find('form').submit(function () {
          var form = this;
          var data;
          $.ajax({
            type: 'post',
            url: $(form).attr('action'),
            data: $(form).serialize(),
            complete: function(xhr, status)  {

              if(xhr.status==203) {
                $(container).find('.new-comment').html(data);
              } else {
                $(container).find('.show-new-comment').show();
                $(container).find('.new-comment').after(data);
                $(container).find('.new-comment').html('');
              }

              initializeFormHandler();
            },
            error: function(req, c, gotData) {
              data = gotData;
            },
            success: function(gotData) {
              data = gotData;
            }
          });
          return false;
        });
      };
      initializeFormHandler();
    });
  };
})(jQuery);
