function onlyUnique (str) {
  var result = "";
  while (str.length > 0) {
    var testingElement = new RegExp(str[0], "g")
    if (str.indexOf(str[0], 1) == -1) {
      result += str[0];
    }
    str = str.replace(testingElement, "");
  }
  console.log(result);
}