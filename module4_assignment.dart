
void main() {
  //● Create an instance of the SavingsAccount class by providing values for the account
  // number, initial balance, and interest rate.
  SavingsAccount savingsAccount = SavingsAccount(
      accountNumber: 123456, balance: 500.0, interestRate: 0.05);
  //● Use the instance to perform operations like depositing and withdrawing money.
  savingsAccount.deposit(200.0);
  savingsAccount.withdraw(300.0);
  //● Create an instance of the CurrentAccount class by providing values for the account
  // number, initial balance, and overdraft limit.
  CurrentAccount currentAccount = CurrentAccount(
      accountNumber: 1234567, balance: 1000.0, overdraftLimit: 500.0);
  //● Use the instance to perform operations like depositing and withdrawing.
  currentAccount.deposit(500.0);
  currentAccount.withdraw(1000.0);
}
//Define an abstract class Account with the following properties:
// ● accountNumber (integer)
// ● balance (double)
abstract class Account {
  late int accountNumber;
  late double balance;
  Account({required this.accountNumber, required this.balance});
  //It should also have the following methods:
  // ● deposit(double amount): Adds the specified amount to the account balance.
  // ● withdraw(double amount): Abstract method that deducts the specified amount from
  // the account balance.
  void deposit(double amount) {
    balance += amount;
  }
  void withdraw(double amount);
}
//Define a class SavingsAccount that extends the Account class. It should have an additional
// property called interestRate (double).
class SavingsAccount extends Account {
  late double interestRate;
  SavingsAccount(
      {required super.accountNumber,
        required super.balance,
        required this.interestRate});
  //Implement the withdraw() method in the SavingsAccount class as follows:
  // ● Subtract the specified amount from the account balance.
  // ● Apply the interest rate to the remaining balance.
  @override
  void withdraw(double amount) {
    balance -= amount;
    balance += (balance * interestRate);
    print('The balance is $balance with interestRate');
  }
}
//Define a class CurrentAccount that extends the Account class. It should have an
// additional property called overdraftLimit (double).
class CurrentAccount extends Account {
  late double overdraftLimit;
  CurrentAccount({
    required super.accountNumber,
    required super.balance,
    required this.overdraftLimit,
  });
  //Implement the withdraw() method in the CurrentAccount class as follows:
  // ● Allow withdrawals up to the overdraft limit.

  @override
  void withdraw(double amount) {
    if (amount <= balance + overdraftLimit) {
      balance -= amount;
      print('Withdrawn $amount. New balance: $balance');
    } else {
      //// ● If the withdrawal amount exceeds the overdraft limit, print a message indicating
      //   // insufficient funds.
      print('Insufficient funds. Cannot withdraw $amount');
    }
  }
}
/*
 Define an abstract class Account with the following properties:
● accountNumber (integer)
● balance (double)
It should also have the following methods:
● deposit(double amount): Adds the specified amount to the account balance.
● withdraw(double amount): Abstract method that deducts the specified amount from
the account balance.
Define a class SavingsAccount that extends the Account class. It should have an additional
property called interestRate (double).
Implement the withdraw() method in the SavingsAccount class as follows:
● Subtract the specified amount from the account balance.
● Apply the interest rate to the remaining balance.
Define a class CurrentAccount that extends the Account class. It should have an
additional property called overdraftLimit (double).
Implement the withdraw() method in the CurrentAccount class as follows:
● Allow withdrawals up to the overdraft limit.
● If the withdrawal amount exceeds the overdraft limit, print a message indicating
insufficient funds.
In main()
● Create an instance of the SavingsAccount class by providing values for the account
number, initial balance, and interest rate.
● Use the instance to perform operations like depositing and withdrawing money.
● Create an instance of the CurrentAccount class by providing values for the account
number, initial balance, and overdraft limit.
● Use the instance to perform operations like depositing and withdrawing.
  */
