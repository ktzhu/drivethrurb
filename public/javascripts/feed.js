$(function () {
	$(document).ready(function() {
		$('.categorylist').hide();
	});
	
	$(".categories").click(function() {
		$('.categorylist').fadeIn();
		$("div.categories").replaceWith("<div class='hidecateg'><a href='#'>▲</a></div>");
	});
	
	$(".hidecateg").click(function() {
		alert("hello!");
		$(".categorylist").fadeOut();
		$(".hidecateg").replaceWith("<div class='categories'><a href='#'><img src='images/topics_small.png' /></a></div>");
	});
	
	$("#goleft").click(function() {
		$("div.title").replaceWith("<div class='title'>I write my curses in cursive</div>");
		$("div.asset").replaceWith('<div class="asset"><img src="http://rapfix.mtv.com/wp-content/uploads/2011/07/watch-the-throne-cover-full.jpg" /></div>')
		$("div.copy").replaceWith("<div class='copy'>Donizzle , est at pharetra da bomb, magna erizzle black crunk, nizzle for sure urna dolor shut the shizzle up own yo'. Fizzle fo shizzle neque, ultricizzle ut, izzle, check out this nizzle, leo. Boom shackalack purus sizzle, shiznit sit amet, interdum for sure, dignissizzle malesuada, ma nizzle. Aenean egizzle ipsizzle izzle hizzle ullamcorpizzle tincidunt. Black quam. ligula fo shizzle, tempizzle izzle, scelerisque venenatis, fo shizzle nizzle, felizzle. Etiam bow wow wow.</div>");
	});
	
	$("#goright").click(function() {
		$("div.title").replaceWith("<div class='title'>It's provocative, gets the people going</div>");
		$("div.asset").replaceWith('<div class="asset"><img src="http://cdn.stereogum.com/files/2010/11/Jay-Z-And-Kanye-West-By-Theo-Wargo-Wire-Image.jpg" /></div>')
		$("div.copy").replaceWith("<div class='copy'>Fo shizzle condimentizzle, turpis nizzle congue consectetizzle, metus sure dizzle purus, crackalackin ullamcorper daahng dawg mi non quizzle. Crizzle faucibus elit. Dizzle get down get down lectus, consequat for sure, ornare volutpizzle, my shizz izzle, tellus. Proin black urna. Yo condimentizzle mofo in check it out. Pellentesque bizzle euismizzle felis. Donec phat nisl a erat. Etiam that's the shizzle lacinia mi. Mammasay mammasa mamma oo sa maurizzle.</div>");
	});
});