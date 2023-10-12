extension MyNum on int {
  bool isprime(int num) {
    for (var i = 2; i < num; i++) {
      if (num % i == 0 && i != num) {
        return false;
      }
    }
    return true;
  }

  max(List<int> li) {
    int max = li[0];
    for (var i = 0; i < li.length; i++) {
      if (max < li[i]) {
        max = li[i];
      }
    }
    return max;
  }
}
