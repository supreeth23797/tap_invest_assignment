double calculateRequiredAmount(double enteredAmount, double availableBalance) {
  if (enteredAmount > availableBalance) {
    return enteredAmount - availableBalance;
  }
  return 0;
}

double calculateTotalReturns(
    double enteredAmount, double netYield, int minInv) {
  if (enteredAmount >= minInv) {
    return enteredAmount + ((enteredAmount * netYield) / 100);
  }
  return 0;
}
