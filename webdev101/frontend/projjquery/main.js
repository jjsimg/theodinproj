$(document).ready(function(){
	$('.dropdown-button').dropdown({
		belowOrigin: true
	});

	$('.dropdown-content').on('click', function(){
		$('ul').on('click', 'li', function(){
			var idcolor=$(this).attr('id');
			$('#board').on('mouseover', '.boardtile', function(){
				$(this).attr('id', idcolor);
			});
		});
	});

	$('#pickgrid').on('click', function(){
		//Check if board is empty
		var grid=prompt('Choose a grid size between 16 and 100')
		if ($('#outer').find('#board').length!==0) {
			var blength=$('#outer').find('#board').length;
			$('#board').remove()
		}
		//Maintain a gridsize between 16x16 and 100x100
		if (grid>=16 && grid<=100) {
			var ht=584/grid;
			var wth=584/grid;
			$('#outer').append('<div id="board"></div>')
			for (i=0; i<grid; i++) {
				$('#board').append('<div class="boardtile" id="brow'+i+'"'+' style="height:'+ht+'px;width:'+wth+'px"></div>');
				for (j=0; j<grid; j++) {
					$('#brow'+i).append('<div class="boardtile" style="height:'+ht+'px;width:'+wth+'px"></div>');
				};
			};
		};
	});
});
