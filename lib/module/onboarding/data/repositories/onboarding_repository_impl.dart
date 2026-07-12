import 'package:injectable/injectable.dart';
import 'package:ppay_mobile/module/onboarding/data/sources/onboarding_local_data_source.dart';
import 'package:ppay_mobile/module/onboarding/domain/repositories/onboarding_repository.dart';

@Singleton(as: OnboardingRepository)
class OnboardingRepositoryImpl implements OnboardingRepository {
  final OnboardingLocalDataSource _localDataSource;

  OnboardingRepositoryImpl(this._localDataSource);

  @override
  Future<bool> hasSeenOnboarding() => _localDataSource.hasSeenOnboarding();

  @override
  Future<void> setOnboardingSeen() => _localDataSource.setOnboardingSeen();
}
