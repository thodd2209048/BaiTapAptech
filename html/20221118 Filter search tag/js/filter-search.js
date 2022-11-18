(function() {                                       //LIFE in an IILE
    var $imgs = $('#gallery img');                  //get the image
    var $search = $('#filter-search');             //get input element
    var cache = [];                                 //create an array called cache

    $imgs.each(function() {                         //for each item
        cache.push( {                               //add an object to cache array
            element: this,                          //this image
            text: this.alt.trim().toLowerCase() //its alt text (lowercase trim)
        });
    });

    function filter() {                             //declare function
        var query = this.value.trim().toLowerCase(); //get the query
        cache.forEach(function(img) {               //for each entry in case pass image
            var index = 0;                          //set index to 0

            if(query) {                         //if there is some query text
                index = img.text.indexOf(query); //find if query text is in there
            }
            
            img.element.style.display = index === -1 ? 'none' : ''; //Show / hide 
        });
    }
    
    if('oninput' in $search[0]) {               //if browser supports in put event
        $search.on('input', filter);            //Use in put event to call filter()
    } else {
        $search.on('keyup', filter);            // use keyup event to call filter()
    }
}());