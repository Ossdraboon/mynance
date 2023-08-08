import 'dart:html';

import 'package:MyNance/Providers/accountCreateProvider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'accountStorageProvider.dart';

part 'accountCreateProvider.g.dart';

class AccountCreate {
  String name = "";
  String password = "";
  String email = "";

  int? phonenumber;
  DateTime? birthday;
  String? gender;
}


@riverpod
class AccountCreateBuilder extends _$AccountCreateBuilder {
  @override
  AccountCreate build (){
    return AccountCreate();
  }

  AccountCreate _copy() {
    AccountCreate obj = AccountCreate();
    obj.name = state.name;
    obj.password = state.password;
    obj.email = state.email;
    obj.phonenumber = state.phonenumber;
    obj.birthday = state.birthday;
    obj.gender = state.gender;
    return obj;
  }

  checkState() {
    if(state.phonenumber != null) {
      //add Entry in balanceStorageProvidera
      ref.read(accountStorageBuilderProvider.notifier).addAccountCreate(state);
      state = AccountCreate();
    }
    if(state.birthday != null) {
      //add Entry in balanceStorageProvidera
      ref.read(accountStorageBuilderProvider.notifier).addAccountCreate(state);
      state = AccountCreate();
    }
    if(state.gender != null) {
      //add Entry in balanceStorageProvidera
      ref.read(accountStorageBuilderProvider.notifier).addAccountCreate(state);
      state = AccountCreate();
    }

  }

  setName(String name) {
    AccountCreate copy = _copy();
    copy.name = name;
    state = copy;
    checkState();
  }

  setPassword(String password){
    AccountCreate copy = _copy();
    copy.password = password;
    state = copy;
    checkState();
  }

  setEmail(String email){
    AccountCreate copy = _copy();
    copy.email = email;
    state = copy;
    checkState();
  }

  setPhonenumber(int? phonenumber) {
    AccountCreate copy = _copy();
    copy.phonenumber = phonenumber;
    state = copy;
    checkState();
  }

  setBirthday(DateTime? birthday){
    AccountCreate copy = _copy();
    copy.birthday = birthday;
    state = copy;
    checkState();
  }

  setGender(String? gender){
    AccountCreate copy = _copy();
    copy.gender = gender;
    state = copy;
    checkState();
  }


}


@riverpod
class TestList extends _$TestList {
  @override
  List<AccountCreate> build() {
    return List<AccountCreate>.empty(growable: true);
  }

  List<AccountCreate> _copy() {
    return List.of(state);
  }

  add(AccountCreate object) {
    List<AccountCreate> copy = _copy();
    copy.add(object);
    state = copy;
  }
}
