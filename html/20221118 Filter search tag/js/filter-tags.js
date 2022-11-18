(function() {

    var $imgs = $('#gallery img');   //Store all images
    var $buttons = $('#buttons');//Store buttons element
    var tagged = {};//create tagged object

    $imgs.each(function() {
        var img = this;//store img in variable
        var tags = $(this).data('tags');//get this element's tags

        if(tags) {
            tags.split(',').forEach(function(tagName) {
                if(tagged[tagName] == null) {
                    tagged[tagName] = [];
                }
                tagged[tagName].push(img);
            });
        }
    });

    $('<button/>', {
        text: 'Show All',
        class: 'active',
        click: function() {
            $(this)
            .addClass('active')
            .siblings()
            .removeClass('active');
            $imgs.show();
        }
    }).appendTo($buttons);

    $.each(tagged, function(tagName) {
        $('<button/>', {
            text: tagName + '(' + tagged[tagName].length + ')',
            click: function() {
                $(this)
                .addClass('active')
                .siblings()
                .removeClass('active');
            $imgs
                .hide()
                .filter(tagged[tagName])
                .show();
            }
        }).appendTo($buttons);
    });
}());