function longestWord(str) {
  var strSplit = str.split(' ')
  var longestWord = strSplit.sort(function(a, b) {
    return b.length - a.length;
  });
  return longestWord[0].length;
}
