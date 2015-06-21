$(document).ready(function() {
	if ($('#fullpage').length > 0) {
    $('#fullpage').fullpage({
      anchors: ['firstPage', 'secondPage', '3rdPage', '4thpage', 'lastPage'],
      scrollingSpeed: 1000
    });
  }
});