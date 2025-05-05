List<int> winningNumbs = [12, 6, 34, 22, 41, 9];

void main() {
  List<int> ticket1 = [45, 2, 9, 18, 12, 33];
  List<int> ticket2 = [41, 17, 26, 32, 7, 35];

  checkNumbers(ticket1);
}

void checkNumbers(List<int> myNumbs) {
  int matches = 0;
  List<int> matchedNums = [];
  for (int numb in myNumbs) {
    for (int winums in winningNumbs) {
      if (numb == winums) {
        // print("Your matched numbers : ${numb}");
        matches++;
        matchedNums.add(numb);
      }
    }
  }
  print("You have $matches matches : ${matchedNums}");
}
