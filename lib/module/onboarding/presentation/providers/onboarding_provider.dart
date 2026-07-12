import 'package:ppay_mobile/core/di/injection.dart';
import 'package:ppay_mobile/module/onboarding/domain/usecases/has_seen_onboarding_usecase.dart';
import 'package:ppay_mobile/module/onboarding/domain/usecases/set_onboarding_seen_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'onboarding_provider.g.dart';

@riverpod
class OnboardingStatus extends _$OnboardingStatus {
  @override
  Future<bool> build() async {
    return await getIt<HasSeenOnboardingUseCase>()();
  }

  Future<void> markOnboardingSeen() async {
    await getIt<SetOnboardingSeenUseCase>()();
    state = const AsyncValue.data(true);
  }
}
