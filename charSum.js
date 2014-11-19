function charSum(str) {
	var sum = str.replace( /\D+/g, '').split('').reduce(function(a, b) {
  	return parseInt(a) + parseInt(b);
	});
	return sum.toString();
}