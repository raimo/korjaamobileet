$.ajaxSetup({
  cache: false
});

$(document).ready(function(){

  $('textarea').autogrow();
  $('input[placeholder],textarea[placeholder]').placeholder();

  $(".razd_but").click(function () {
    $($(this).attr('href')).parent().effect("highlight", { }, 6000);
  });
  $("#about_link").click(function () {
    $($(this).attr('href')).effect("highlight", { }, 6000);
  });

  $('.list').editable_list();
});

(function ($) {
  $.fn.count_clicks = function (opts) {
    var options = jQuery.extend({
      url : ''
    }, opts);

    return this.each(function () {
      var link = $(this).attr('href');
      $(this).click(function() {
        $.ajax({type : 'get', url: options.url,
	  async : false,
          complete: function(xhr, status) {
	    document.location = link;
          }
        });
	return false;
      });
    });
  };
  $.fn.editable_list = function (options) {
    return this.each(function () {
      var container = this;
      var controls = $(container).children('.controls:first');
      var elements = $(container).children('.elements:first');
      var add_form = $(container).children('.add_form:first');

      var initializeElementForm = function (form_container) {
        $(controls).hide();
        $(form_container).find('form:first').inline_form({
          success : function (data) {
            $(elements).prepend(data);
            $(add_form).empty();
            $(controls).show();
          },
          invalid : function (data) {
            $(add_form).html(data);
            initializeElementForm($(add_form).children('.element'));
          },
          cancel : function () {
            $(add_form).empty();
            $(controls).show();
          }
        });
      };

      $(controls).find('a.add').click(function() {
        $.get($(this).attr('href'), function (form) {
          $(add_form).html(form);
          initializeElementForm($(add_form).children('.element'));
        });
        return false;
      });

    });
  };

  $.fn.inline_form = function (opts) {
    var options = jQuery.extend({
      success : '',
      invalid : '',
      cancel  : ''
    }, opts);
    return this.each(function () {
      var form = $(this);

      $(form).find('a.cancel').click(function() {
        options.cancel();
        return false;
      });

      $(form).submit(function() {
        $.ajax({type : 'post', url: $(this).attr('action'),
          data: $(this).serialize(),
          error: function(req, c, d) {
            data = d;
          },
          success: function(d) {
            data = d;
          },
          complete: function(xhr, status) {
            if (xhr.status === 203) {
              options.invalid(data);
            } else {
              options.success(data);
            }
          }
        });
        return false;
      });
    });
  };
})(jQuery);


