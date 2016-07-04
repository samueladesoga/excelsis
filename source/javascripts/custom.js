$(window).load(function() {
    $('.testi-slider').flexslider({
        controlNav: true,
directionNav: false
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

	$('.counter').counterUp({
    delay: 100,
    time: 5000
});