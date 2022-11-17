var request;                                                
var $current;
var cache = {};
var $frame = $('#photo-viewer');
var $thumbs = $('.thumbs');

function crossfade($img) {

  if ($current) {
    $current.stop().fadeOut('slow');
  }

  $img.css({
    marginLeft: -$img.width()/2,
    marginTop: -$img.height()/2
  });

  $img.stop().fadeTo('slow', 1);

  $current = $img;

}

$(document).on('click', '.thumb', function(e){
  var $img,
    src = this.href;
    request = src;

  e.preventDefault();

  $thumbs.removeClass('active');
  $(this).addClass('active');

  if (cache.hasOwnProperty(src)) {
    if(cache[src].isLoading === false) {
      crossfade(cache[src].$img);
    }
  } else {
    $img = $('<img>');
    cache[src] = {
      $img: $img,
      isLoading: true
    };

    //Next few lines will run when image has loaded but are prepared first
    $img.on('load', function(){       //when image has loaded
      $img.hide();                    //hide it
      // Remove is-loading class from frame & append new image to it
      $frame.removeClass('is-loading').append($img);
      cache[src].isLoading = false;   //Update isLoading in cache
      // If still most recently requested image then
      if (request === src) {
        crossfade($img);
      }
    });
    $frame.addClass('is-loading');    //Add is-loading class to frame

    $img.attr({                       //Set attributes on <img> element
      'src': src,                     //Add src attribute to load image
      'alt': this.title ||''          //Add title if one was given in link
    });
  }

});

//Final line runs once when rest of script has loaded to show the first image
$('.thumb').eq(0).click();          // Simulate click on first thumb
