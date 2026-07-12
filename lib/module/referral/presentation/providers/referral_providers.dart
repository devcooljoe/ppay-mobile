import 'package:ppay_mobile/core/di/injection.dart';
import 'package:ppay_mobile/module/referral/domain/entities/referral_entity.dart';
import 'package:ppay_mobile/module/referral/domain/usecases/get_my_referrals_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'referral_providers.g.dart';

@riverpod
class GetMyReferrals extends _$GetMyReferrals {
  @override
  AsyncValue<ReferralInfoEntity?> build() => const AsyncValue.data(null);

  Future<void> call() async {
    state = const AsyncValue.loading();
    final result = await getIt<GetMyReferralsUseCase>()();
    state = result.fold(
      (l) => AsyncValue.error(l.message, StackTrace.current),
      (info) => AsyncValue.data(info),
    );
  }
}
