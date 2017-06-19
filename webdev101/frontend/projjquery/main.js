$(document).ready(function(){
	$(".dropdown-button").dropdown();
	gridsize=$('#board').css('width')/5;
	console.log(gridsize);
	
	var grid=4;
	for (i=0; i<grid; i++) {
		$('#board1').append('<td class="boardtile"></td>')
	}
});