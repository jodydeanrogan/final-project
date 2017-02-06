$(document).on("turbolinks:load", function() {
  $("[type=file]#activity_image").fileupload({
    add: function(e, data) {
      console.log("add", data);
      data.progressBar = $('<div class="progress" style="width: 300px"><div class="progress-bar"></div></div>').insertAfter(".activity-image");
      var options = {
        extension: data.files[0].name.match(/(\.\w+)?$/)[0], // set the file extension
        _: Date.now() // prevent caching
      }
      $.getJSON("/images/upload/cache/presign", options, function(result) {
        console.log("presign", result);
        data.formData = result['fields'];
        data.url = result['url'];
        data.paramName = "file";
        data.submit();
      });
    },
    progress: function(e, data) {
      console.log("progress", data);
      var progress = parseInt(data.loaded / data.total * 100, 10);
      var percentage = progress.toString() + '%'
      data.progressBar.find(".progress-bar").css("width", percentage).html(percentage);
    },
    done: function(e, data) {
      console.log("done", data);
      data.progressBar.remove();
      var imageUrl = data.url + "/" + data.formData.key;
      $('.activity-image').empty();
      $('.activity-image').append('<img src=' + imageUrl + '>');

      var image = {
        id:       data.formData.key.match(/cache\/(.+)/)[1], // we have to remove the prefix part
        storage:  'cache',
        metadata: {
          size:      data.files[0].size,
          filename:  data.files[0].name.match(/[^\/\\]+$/)[0], // IE return full path
          mime_type: data.files[0].type
        }
      };

      $("input[name='activity[image]'][type=hidden]").val(JSON.stringify(image));
    }
  });

});
