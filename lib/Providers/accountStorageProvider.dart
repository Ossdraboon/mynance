import 'package:MyNance/Providers/accountCreateProvider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'accountStorageProvider.g.dart';

@riverpod
class AccountStorageBuilder extends _$AccountStorageBuilder {
  @override
  List<AccountCreate> build() {
    //Load from persistent storage
    return List<AccountCreate>.empty(growable: true);
  }

  addAccountCreate(AccountCreate accountCreate) {
    print("Got new entry for storage");
    List<AccountCreate> entries = List<AccountCreate>.of(state);
    entries.add(accountCreate);
    //Store new entry or complete list in persistant storage
    state = entries;
  }
}
