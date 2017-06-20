$(document).ready(function(){
	$(".dropdown-button").dropdown({
		belowOrigin: true
	});
	//Default grid size
	grid=16;
	//Initialize grid size
	$('li').on('click', '#pickgrid', function(){
		$(this).alert('woeijfweoifjW')
	});
	
	//Initialize Etch-a-Sketch
	var ht=584/grid;
	var wth=584/grid;
	for (i=0; i<grid; i++) {
		$('#board').append('<div class="boardtile" id="brow'+i+'"'+' style="height:'+ht+'px;width:'+wth+'px"></div>');
		for (j=0; j<grid; j++) {
			$('#brow'+i).append('<div class="boardtile" style="height:'+ht+'px;width:'+wth+'px"></div>')
		};
	};


	//Change colours
	$('#board').on('mouseover', '.boardtile', function(){
		$(this).addClass("green");
	});
});
