void main() {
  beerLyrics(99);
}

void beerLyrics(int number) {
  for (int i = 99; i > 0; i--) {
    print(
        "$i bottles of beer on the wall, $i bottles of beer. Take one down and pass it around, ${i - 1} bottles of beer on the wall.");

    if (i - 1 == 0) {
      print(
          "No more bottles of beer on the wall, no more bottles of beer. Go to the store and buy some more, 99 bottles of beer on the wall.");
      break;
    }
  }
}
