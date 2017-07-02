$(document).ready(function(){
	$('.dropdown-button').dropdown({
		belowOrigin: true
	});

	function genGrid(inp){
		if (inp>=16 && inp<=100) {
			var ht=584/inp;
			var wth=584/inp;
			$('#outer').append('<div id="board"></div>')
			for (i=0; i<inp; i++) {
				$('#board').append('<div class="boardtile" id="brow'+i+'"'+' style="height:'+ht+'px;width:'+wth+'px"></div>');
				for (j=0; j<inp; j++) {
					$('#brow'+i).append('<div class="boardtile" style="height:'+ht+'px;width:'+wth+'px"></div>');
				};
			};
		};
	};

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
		genGrid(grid);
	});

	
});
