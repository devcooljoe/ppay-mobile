String? validateWithdrawalAmount(double amount, double balance) {
  if (amount <= 0) {
    return 'Please enter an amount greater than 0';
  }

  if (amount > balance) {
    return 'You cannot withdraw more than your available card balance';
  }

  return null;
}
