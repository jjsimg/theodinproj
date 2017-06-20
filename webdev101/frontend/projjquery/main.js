$(document).ready(function(){
	$(".dropdown-button").dropdown();
	gridsize=$('#board').css('width')/5;
	console.log(gridsize);
	
	var grid=20;
	var ht=584/grid;
	var wth=584/grid;
	for (i=0; i<grid; i++) {
		$('#board').append('<div class="boardtile" id="brow'+i+'"'+' style="height:'+ht+'px;width:'+wth+'px"></div>');
		for (j=0; j<grid; j++) {
			$('#brow'+i).append('<div class="boardtile" style="height:'+ht+'px;width:'+wth+'px"></div>')
		}
	}
});