// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getBanksHash() => r'b90b89133cb939ef196c207cc4bde82874e32822';

/// See also [GetBanks].
@ProviderFor(GetBanks)
final getBanksProvider = AutoDisposeNotifierProvider<GetBanks,
    AsyncValue<List<BankEntity>?>>.internal(
  GetBanks.new,
  name: r'getBanksProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$getBanksHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$GetBanks = AutoDisposeNotifier<AsyncValue<List<BankEntity>?>>;
String _$getBankAccountsHash() => r'd510ff46cf9627ea060bd27b1efc6d16fd6f4a89';

/// See also [GetBankAccounts].
@ProviderFor(GetBankAccounts)
final getBankAccountsProvider = AutoDisposeNotifierProvider<GetBankAccounts,
    AsyncValue<List<BankAccountEntity>?>>.internal(
  GetBankAccounts.new,
  name: r'getBankAccountsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getBankAccountsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$GetBankAccounts
    = AutoDisposeNotifier<AsyncValue<List<BankAccountEntity>?>>;
String _$updateBankAccountHash() => r'ecbf498791008cf17dca50c6542afb648b7ad0e8';

/// See also [UpdateBankAccount].
@ProviderFor(UpdateBankAccount)
final updateBankAccountProvider =
    AutoDisposeNotifierProvider<UpdateBankAccount, AsyncValue<void>>.internal(
  UpdateBankAccount.new,
  name: r'updateBankAccountProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$updateBankAccountHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$UpdateBankAccount = AutoDisposeNotifier<AsyncValue<void>>;
String _$deleteBankAccountHash() => r'2b95e08eeacd9e407cc36400d03d88050d3c3508';

/// See also [DeleteBankAccount].
@ProviderFor(DeleteBankAccount)
final deleteBankAccountProvider =
    AutoDisposeNotifierProvider<DeleteBankAccount, AsyncValue<void>>.internal(
  DeleteBankAccount.new,
  name: r'deleteBankAccountProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$deleteBankAccountHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$DeleteBankAccount = AutoDisposeNotifier<AsyncValue<void>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
