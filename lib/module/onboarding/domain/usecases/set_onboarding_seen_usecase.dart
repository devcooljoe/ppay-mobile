import 'package:injectable/injectable.dart';
import 'package:ppay_mobile/module/onboarding/domain/repositories/onboarding_repository.dart';

@lazySingleton
class SetOnboardingSeenUseCase {
  final OnboardingRepository _repository;

  SetOnboardingSeenUseCase(this._repository);

  Future<void> call() => _repository.setOnboardingSeen();
}
