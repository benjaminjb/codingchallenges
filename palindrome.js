function isPalindrome (str) {
  str = str.toLowerCase().replace(/[^a-z]+/g,'');
  var compareStr = str.split('').reverse().join('');
  if (str == compareStr) {
    console.log('yes');
  } else {
    console.log('no');
  }
}
