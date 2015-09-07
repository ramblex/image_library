$(function() {
  var getUrlParam = function(paramName) {
    var reParam = new RegExp( '(?:[\?&]|&)' + paramName + '=([^&]+)', 'i' );
    var match = window.location.search.match(reParam);
    if (match && match.length > 1) {
      return match[1];
    } else {
      return null;
    }
  };

  $('#image_library-fileupload').fileupload({
    singleFileUploads: true,
    dataType: 'html',
    add: function(e, data) {
      $('#upload-progress .progress-bar').css({
        'width': '0%'
      });
      $('.fileinput-button').attr('disabled', 'disabled');
      data.submit();
    },
    progressall: function(e, data) {
      $('#upload-progress .progress-bar').css({
        'width': parseInt(data.loaded / data.total * 100, 10) + '%'
      });
    },
    done: function(e, data) {
      $('.fileinput-button').removeAttr('disabled');
      $result = $(data.result);
      $('#image_library-uploads').prepend($result);
    }
  });

  var thumbSize;
  var thumbHolder;
  var uploadInput;
  $('form').on('click', '[data-target="#choose-upload-modal"]', function() {
    var $field = $(this).closest('.image_library-upload-field');
    thumbSize = $field.attr('data-thumb-size');
    thumbHolder = $field.find('.upload-choice-thumb');
    uploadInput = $field.find('input');
  });

  $('#image_library-uploads').on('click', '.image', function(ev) {
    ev.preventDefault();

    var funcNum = getUrlParam('CKEditorFuncNum');
    var $image = $(this);

    if (funcNum == null) {
      $('#choose-upload-modal').modal('hide');
      var id = $image.attr('data-id');
      if (window.uploadChosen === undefined) {
        uploadInput.val(id);
        thumbHolder
          .html('<img src="'+$image.attr('data-'+thumbSize)+'" class="img-responsive" />');
      } else {
        window.uploadChosen($image);
      }
    } else {
      var fileUrl = $image.attr('data-page');
      window.opener.CKEDITOR.tools.callFunction(funcNum, fileUrl);
      window.close();
    }
  });

  $('#choose-upload-modal').on('shown.bs.modal', function() {
    $.get($(this).attr('data-url'));
  });
});
