function highestFreq(str) {
	var strObj = {};
	var max = 0;
	for (var i = 0; i < str.length; i++ ) {
		if (strObj[str[i]]) {
			strObj[str[i]]++;
			if (strObj[str[i]] > max) {
				max = strObj[str[i]];
			}
		} else {
			strObj[str[i]] = 1;
		}
	}
	var answer = []
	for (elem in strObj) {
		if (strObj[elem] == max) {
			answer.push(elem);
		}
	}
	console.log(answer.sort().join(''));
}


function highestFreq2(str) {
	var strObj = {};
	var max = 0;
	for ( var i = 0; i < str.length; i++ ) {
		strObj[str[i]] = str.split(str[i]).length - 1;
		if (strObj[str[i]] > max) {
			max = strObj[str[i]];
		}
	}
	var answer = []
	for (elem in strObj) {
		if (strObj[elem] == max) {
			answer.push(elem);
		}
	}
	console.log(answer.sort().join(''));
}
