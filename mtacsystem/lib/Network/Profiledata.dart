import 'package:mtacsystem/models/account.dart';

class GetProfData {
  static AccountProfile getdata(var responseBody){
    AccountProfile currentAccount = AccountProfile.fromJson(responseBody);
    return currentAccount;
  }
}