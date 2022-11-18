var request;                                           //Lastest image to be requested     
var $current;                                           //Image currently being shown
var cache = {};                                         //cache object
var $frame = $('#photo-viewer');                        //container for image    
var $thumbs = $('.thumbs');                             //thubnails

function crossfade($img) {                              //Function to fade between images
                                                        //pass in new image as parameter
  if ($current) {                                       //if there is currently an image showing
    $current.stop().fadeOut('slow');                    //Stop any animation & fade it out
  }

  $img.css({                                            //Set the CSS margin for the image
    marginLeft: -$img.width()/2,                        // Negative margin of half image width
    marginTop: -$img.height()/2                          // Negative margin of half image height
  });

  $img.stop().fadeTo('slow', 1);                          //stop animation on new image and fade in

  $current = $img;                                      //New image becomes current image

}                                                       

$(document).on('click', '.thumb', function(e){          //When a thumb is clicked on
  var $img,                                             //Create local variable called $img
    src = this.href;                                    //Store path to image
    request = src;                                      //Store lastest image request

  e.preventDefault();                                   //stop default link behavior

  $thumbs.removeClass('active');                        //remove active from all thumbs
  $(this).addClass('active');                           //add active to clicked thumb

  if (cache.hasOwnProperty(src)) {                      //if cache contains this image
    if(cache[src].isLoading === false) {                //and if isLoading is false
      crossfade(cache[src].$img);                       //Call crossfade() function
    }
  } else {                                              //otherwise it is not in cache
    $img = $('<img/>');                                  //Store empty <img/> element in $img
    cache[src] = {                                      //store this image in cache
      $img: $img,                                       //add the path to the image
      isLoading: true                                   //set isLoading preperty to fase
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
