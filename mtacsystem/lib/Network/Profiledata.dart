import 'package:mtacsystem/Components/account.dart';

class GetProfData {
  static AccountProfile getdata(var responseBody){
    AccountProfile currentAccount = AccountProfile.fromJson(responseBody);
    return currentAccount;
  }
}