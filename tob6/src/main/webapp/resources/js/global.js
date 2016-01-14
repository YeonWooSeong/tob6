var Global = {
		init : function() {
			//함수내부는 절차지향임.
			
			var outbox = document.createElement('div');
			outbox.id = 'outbox';
			document.body.appendChild(outbox);
			
			var footer = document.createElement('div');
			footer.id = 'footer';
			document.body.appendChild(footer); 
			
			$('<div id="box"></div>').appendTo($('#outbox').empty()); 
			} 
};