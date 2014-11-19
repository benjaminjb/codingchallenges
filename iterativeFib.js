function iterativeFib(n) {
	answer = 1;
	firstFib = 0;
	for (var i = 1; i < n; i++ ) {
		holder = firstFib;
		firstFib = answer;
		answer = holder + answer;
	}
	console.log(answer);
}
