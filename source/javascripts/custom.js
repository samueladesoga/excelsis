$(window).load(function() {
    $('.testi-slider').flexslider({
        controlNav: true,
directionNav: false
    });
  });

//jquery counter plugin
$(document).ready(function() {

$('.counter').counterUp({
delay: 100,
time: 5000
});

});
 /* ---------------------------------------------------------------------- */
 /*	Contact Map
 /* ---------------------------------------------------------------------- */
	var contact = {"lat": "40.714623", "lon": "-74.006605"}; //Change a map coordinate here!

	try {
	    $('#map').gmap3({
	        action: 'addMarker',
	        latLng: [contact.lat, contact.lon],
	        map: {
	            center: [contact.lat, contact.lon],
	            zoom: 14
	        }
	    },
	    {action: 'setOptions', args: [{scrollwheel: false}]}
	    );
	} catch (err) {

	}

	//isotope filter

var winDow = $(window);
// Needed variables
var $container = $('.iso-call');
var $filter = $('.filter');

try {
    $container.imagesLoaded(function() {
        $container.trigger('resize');
        $container.isotope({
            filter: '*',
            layoutMode: 'masonry',
            animationOptions: {
                duration: 750,
                easing: 'linear'
            }
        });

        $('.triggerAnimation').waypoint(function() {
            var animation = $(this).attr('data-animate');
            $(this).css('opacity', '');
            $(this).addClass("animated " + animation);

        },
                {
                    offset: '75%',
                    triggerOnce: true
                }
        );
        setTimeout( 1500);
    });
} catch (err) {
}

winDow.bind('resize', function() {
    var selector = $filter.find('a.active').attr('data-filter');

    try {
        $container.isotope({
            filter: selector,
            animationOptions: {
                duration: 750,
                easing: 'linear',
                queue: false
            }
        });
    } catch (err) {
    }
    return false;
});

// Isotope Filter 
$filter.find('a').click(function() {
    var selector = $(this).attr('data-filter');

    try {
        $container.isotope({
            filter: selector,
            animationOptions: {
                duration: 750,
                easing: 'linear',
                queue: false
            }
        });
    } catch (err) {

    }
    return false;
});


var filterItemA = $('.filter li a');

filterItemA.on('click', function() {
    var $this = $(this);
    if (!$this.hasClass('active')) {
        filterItemA.removeClass('active');
        $this.addClass('active');
    }
});

