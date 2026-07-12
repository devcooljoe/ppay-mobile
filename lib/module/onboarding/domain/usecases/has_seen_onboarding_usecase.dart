import 'package:injectable/injectable.dart';
import 'package:ppay_mobile/module/onboarding/domain/repositories/onboarding_repository.dart';

@lazySingleton
class HasSeenOnboardingUseCase {
  final OnboardingRepository _repository;

  HasSeenOnboardingUseCase(this._repository);

  Future<bool> call() => _repository.hasSeenOnboarding();
}
