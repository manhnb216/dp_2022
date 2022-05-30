import 'dart:developer';

enum BankName { vcb, tpb }

class BankFactory {
  static Bank getBank(BankName bankName, Account account) {
    switch (bankName) {
      case BankName.vcb:
        return VCB(account);
      case BankName.tpb:
        return TPB(account);
    }
  }
}

class TPB extends Bank {
  TPB(Account account) : super(account);

  @override
  void openAccount() {
    log('Open: ${account.openAccount()}');
    account.openAccount();
  }
}

class VCB extends Bank {
  VCB(Account account) : super(account);

  @override
  void openAccount() {
    log('Open: ${account.openAccount()}');
  }
}

abstract class Bank {
  late final Account account;
  Bank(this.account);
  void openAccount();
}

enum AccountType { checking, saving }

class AccountFactory {
  static Account open(AccountType accountType) {
    switch (accountType) {
      case AccountType.checking:
        return CheckingAccount();
      case AccountType.saving:
        return SavingAccount();
    }
  }
}

class CheckingAccount implements Account {
  @override
  String openAccount() {
    return 'Checking account';
  }
}

class SavingAccount implements Account {
  @override
  String openAccount() {
    return 'Saving account';
  }
}

abstract class Account {
  String openAccount();
}
