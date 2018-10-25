function mirror(text) {
  // split the string and sort for the longest word
  var strSplit = str.split(' ')
  var longestWord = strSplit.sort(function(a, b) {
    return b.length - a.length;
  });

  var horizontal_border = '*'.repeat(longestWord[0].length + 2);
  var vertical border = '*\n'.repeat(longestWord.length);
}

