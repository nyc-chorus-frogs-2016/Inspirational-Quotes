$(document).ready(function(){
	var wallpaperUrl = $('#wallpaper-id').text();
	var targetDiv = $('#background-image')
	targetDiv.css({'background-image': 'url('+wallpaperUrl+')'});

});
