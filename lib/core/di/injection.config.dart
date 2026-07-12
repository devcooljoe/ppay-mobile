// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:event_bus/event_bus.dart' as _i1017;
import 'package:firebase_messaging/firebase_messaging.dart' as _i892;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:ppay_mobile/core/di/firebase_module.dart' as _i462;
import 'package:ppay_mobile/core/network/dio_module.dart' as _i904;
import 'package:ppay_mobile/core/network/interceptors/auth_interceptor.dart'
    as _i637;
import 'package:ppay_mobile/core/network/interceptors/error_interceptor.dart'
    as _i1013;
import 'package:ppay_mobile/core/network/interceptors/network_interceptor.dart'
    as _i10;
import 'package:ppay_mobile/core/network/interceptors/user_agent_interceptor.dart'
    as _i403;
import 'package:ppay_mobile/core/network/network_info.dart' as _i67;
import 'package:ppay_mobile/core/services/biometric_service.dart' as _i1002;
import 'package:ppay_mobile/core/services/hive_service.dart' as _i389;
import 'package:ppay_mobile/core/services/inactivity_service.dart' as _i668;
import 'package:ppay_mobile/core/services/notification_service.dart' as _i406;
import 'package:ppay_mobile/core/services/pin_verification_service.dart'
    as _i615;
import 'package:ppay_mobile/core/services/token_service.dart' as _i971;
import 'package:ppay_mobile/module/auth/data/repositories/user_repository_impl.dart'
    as _i48;
import 'package:ppay_mobile/module/referral/data/repositories/referral_repository_impl.dart'
    as _i_ref_repo_impl;
import 'package:ppay_mobile/module/transaction/data/repositories/transaction_repository_impl.dart'
    as _i_tx_repo_impl;
import 'package:ppay_mobile/module/transaction/domain/repositories/transaction_repository.dart'
    as _i_tx_repo;
import 'package:ppay_mobile/module/transaction/domain/usecases/get_my_transactions_usecase.dart'
    as _i_tx_uc;
import 'package:ppay_mobile/module/referral/data/sources/referral_remote_datasource.dart'
    as _i_ref_ds;
import 'package:ppay_mobile/module/referral/data/sources/referral_remote_datasource_impl.dart'
    as _i_ref_ds_impl;
import 'package:ppay_mobile/module/referral/domain/repositories/referral_repository.dart'
    as _i_ref_repo;
import 'package:ppay_mobile/module/referral/domain/usecases/get_my_referrals_usecase.dart'
    as _i_ref_uc;
import 'package:ppay_mobile/module/notification/data/sources/notification_remote_datasource.dart'
    as _i_notif_ds;
import 'package:ppay_mobile/module/notification/data/sources/notification_remote_datasource_impl.dart'
    as _i_notif_ds_impl;
import 'package:ppay_mobile/module/notification/data/repositories/notification_repository_impl.dart'
    as _i_notif_repo_impl;
import 'package:ppay_mobile/module/notification/domain/repositories/notification_repository.dart'
    as _i_notif_repo;
import 'package:ppay_mobile/module/notification/domain/usecases/get_my_notifications_usecase.dart'
    as _i_notif_uc;
import 'package:ppay_mobile/module/auth/data/sources/user_remote_datasource.dart'
    as _i73;
import 'package:ppay_mobile/module/auth/data/sources/user_remote_datasource_impl.dart'
    as _i556;
import 'package:ppay_mobile/module/auth/domain/repositories/user_repository.dart'
    as _i117;
import 'package:ppay_mobile/module/auth/domain/usecases/change_password_usecase.dart'
    as _i470;
import 'package:ppay_mobile/module/auth/domain/usecases/forgot_password_usecase.dart'
    as _i1043;
import 'package:ppay_mobile/module/auth/domain/usecases/forgot_pin_usecase.dart'
    as _i700;
import 'package:ppay_mobile/module/auth/domain/usecases/get_user_usecase.dart'
    as _i849;
import 'package:ppay_mobile/module/auth/domain/usecases/login_usecase.dart'
    as _i615;
import 'package:ppay_mobile/module/auth/domain/usecases/register_usecase.dart'
    as _i1047;
import 'package:ppay_mobile/module/auth/domain/usecases/resend_email_otp_usecase.dart'
    as _i232;
import 'package:ppay_mobile/module/auth/domain/usecases/resend_phone_otp_usecase.dart'
    as _i125;
import 'package:ppay_mobile/module/auth/domain/usecases/reset_password_usecase.dart'
    as _i734;
import 'package:ppay_mobile/module/auth/domain/usecases/reset_pin_usecase.dart'
    as _i938;
import 'package:ppay_mobile/module/auth/domain/usecases/set_pin_usecase.dart'
    as _i789;
import 'package:ppay_mobile/module/auth/domain/usecases/verify_email_otp_usecase.dart'
    as _i882;
import 'package:ppay_mobile/module/auth/domain/usecases/verify_forgot_password_otp_usecase.dart'
    as _i739;
import 'package:ppay_mobile/module/auth/domain/usecases/verify_forgot_pin_otp_usecase.dart'
    as _i509;
import 'package:ppay_mobile/module/auth/domain/usecases/verify_phone_otp_usecase.dart'
    as _i783;
import 'package:ppay_mobile/module/auth/domain/usecases/verify_pin_usecase.dart'
    as _i370;
import 'package:ppay_mobile/module/bills/data/repositories/bill_payment_repository_impl.dart'
    as _i781;
import 'package:ppay_mobile/module/bills/data/sources/bill_payment_remote_datasource.dart'
    as _i86;
import 'package:ppay_mobile/module/bills/data/sources/bill_payment_remote_datasource_impl.dart'
    as _i358;
import 'package:ppay_mobile/module/bills/domain/repositories/bill_payment_repository.dart'
    as _i417;
import 'package:ppay_mobile/module/bills/domain/usecases/bill_payment_usecases.dart'
    as _i831;
import 'package:ppay_mobile/module/crypto/domain/repositories/crypto_repository.dart'
    as _i430;
import 'package:ppay_mobile/module/crypto/domain/usecases/crypto_usecases.dart'
    as _i907;
import 'package:ppay_mobile/module/flight/data/sources/flight_remote_datasource.dart'
    as _i25;
import 'package:ppay_mobile/module/flight/data/sources/flight_remote_datasource_impl.dart'
    as _i270;
import 'package:ppay_mobile/module/flight/domain/repositories/flight_repository.dart'
    as _i100;
import 'package:ppay_mobile/module/flight/domain/usecases/flight_usecases.dart'
    as _i640;
import 'package:ppay_mobile/module/giftcard/domain/repositories/giftcard_repository.dart'
    as _i127;
import 'package:ppay_mobile/module/giftcard/domain/usecases/giftcard_usecases.dart'
    as _i798;
import 'package:ppay_mobile/module/kyc/data/repositories/kyc_repository_impl.dart'
    as _i909;
import 'package:ppay_mobile/module/kyc/data/sources/kyc_remote_datasource.dart'
    as _i682;
import 'package:ppay_mobile/module/kyc/data/sources/kyc_remote_datasource_impl.dart'
    as _i362;
import 'package:ppay_mobile/module/kyc/domain/repositories/kyc_repository.dart'
    as _i505;
import 'package:ppay_mobile/module/kyc/domain/usecases/get_kyc_document_types_usecase.dart'
    as _i142;
import 'package:ppay_mobile/module/kyc/domain/usecases/get_user_usecase.dart'
    as _i1016;
import 'package:ppay_mobile/module/kyc/domain/usecases/update_profile_usecase.dart'
    as _i716;
import 'package:ppay_mobile/module/kyc/domain/usecases/upload_profile_picture_usecase.dart'
    as _i869;
import 'package:ppay_mobile/module/kyc/domain/usecases/verify_bvn_usecase.dart'
    as _i702;
import 'package:ppay_mobile/module/kyc/domain/usecases/verify_kyc_usecase.dart'
    as _i1046;
import 'package:ppay_mobile/module/onboarding/data/repositories/onboarding_repository_impl.dart'
    as _i966;
import 'package:ppay_mobile/module/onboarding/data/sources/onboarding_local_data_source.dart'
    as _i713;
import 'package:ppay_mobile/module/onboarding/domain/repositories/onboarding_repository.dart'
    as _i464;
import 'package:ppay_mobile/module/onboarding/domain/usecases/has_seen_onboarding_usecase.dart'
    as _i684;
import 'package:ppay_mobile/module/onboarding/domain/usecases/set_onboarding_seen_usecase.dart'
    as _i497;
import 'package:ppay_mobile/module/settings/data/repositories/bank_account_repository_impl.dart'
    as _i1035;
import 'package:ppay_mobile/module/settings/data/sources/bank_account_remote_datasource.dart'
    as _i276;
import 'package:ppay_mobile/module/settings/data/sources/bank_account_remote_datasource_impl.dart'
    as _i687;
import 'package:ppay_mobile/module/settings/domain/repositories/bank_account_repository.dart'
    as _i629;
import 'package:ppay_mobile/module/settings/domain/usecases/bank_account_usecases.dart'
    as _i912;
import 'package:ppay_mobile/module/shopping/data/repositories/shopping_repository_impl.dart'
    as _i846;
import 'package:ppay_mobile/module/shopping/data/sources/shopping_remote_datasource.dart'
    as _i390;
import 'package:ppay_mobile/module/shopping/data/sources/shopping_remote_datasource_impl.dart'
    as _i273;
import 'package:ppay_mobile/module/shopping/domain/repositories/shopping_repository.dart'
    as _i766;
import 'package:ppay_mobile/module/shopping/domain/usecases/shopping_usecases.dart'
    as _i540;
import 'package:ppay_mobile/module/transaction/data/repositories/wallet_repository_impl.dart'
    as _i867;
import 'package:ppay_mobile/module/transaction/data/sources/wallet_remote_datasource.dart'
    as _i813;
import 'package:ppay_mobile/module/transaction/data/sources/wallet_remote_datasource_impl.dart'
    as _i1044;
import 'package:ppay_mobile/module/transaction/domain/repositories/wallet_repository.dart'
    as _i836;
import 'package:ppay_mobile/module/transaction/domain/usecases/get_wallet_usecase.dart'
    as _i672;
import 'package:ppay_mobile/module/transaction/domain/usecases/name_enquiry_usecase.dart'
    as _i600;
import 'package:ppay_mobile/module/transaction/domain/usecases/withdraw_usecase.dart'
    as _i649;
import 'package:ppay_mobile/module/virtual_card/data/repositories/dollar_card_repository_impl.dart'
    as _i109;
import 'package:ppay_mobile/module/virtual_card/data/sources/dollar_card_remote_datasource.dart'
    as _i922;
import 'package:ppay_mobile/module/virtual_card/data/sources/dollar_card_remote_datasource_impl.dart'
    as _i933;
import 'package:ppay_mobile/module/virtual_card/domain/repositories/dollar_card_repository.dart'
    as _i674;
import 'package:ppay_mobile/module/virtual_card/domain/usecases/dollar_card_usecases.dart'
    as _i1066;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final firebaseModule = _$FirebaseModule();
    final dioModule = _$DioModule();
    gh.singleton<_i389.HiveService>(() => _i389.HiveService());
    gh.singleton<_i713.OnboardingLocalDataSource>(
        () => _i713.OnboardingLocalDataSource());
    gh.lazySingleton<_i892.FirebaseMessaging>(
        () => firebaseModule.firebaseMessaging);
    gh.lazySingleton<_i403.UserAgentInterceptor>(
        () => _i403.UserAgentInterceptor());
    gh.lazySingleton<_i1017.EventBus>(() => dioModule.eventBus());
    gh.lazySingleton<_i615.PinVerificationService>(
        () => _i615.PinVerificationService());
    gh.lazySingleton<_i1002.BiometricService>(() => _i1002.BiometricService());
    gh.lazySingleton<_i971.TokenService>(() => _i971.TokenService());
    gh.lazySingleton<_i668.InactivityService>(() => _i668.InactivityService());
    gh.lazySingleton<_i406.NotificationService>(
        () => _i406.NotificationService());
    gh.lazySingleton<_i637.AuthInterceptor>(
        () => _i637.AuthInterceptor(gh<_i971.TokenService>()));
    gh.singleton<_i464.OnboardingRepository>(() =>
        _i966.OnboardingRepositoryImpl(gh<_i713.OnboardingLocalDataSource>()));
    gh.lazySingleton<_i67.NetworkInfo>(() => _i67.NetworkInfoImpl());
    gh.lazySingleton<_i497.SetOnboardingSeenUseCase>(
        () => _i497.SetOnboardingSeenUseCase(gh<_i464.OnboardingRepository>()));
    gh.lazySingleton<_i684.HasSeenOnboardingUseCase>(
        () => _i684.HasSeenOnboardingUseCase(gh<_i464.OnboardingRepository>()));
    gh.lazySingleton<_i1013.ErrorInterceptor>(
        () => _i1013.ErrorInterceptor(gh<_i1017.EventBus>()));
    gh.lazySingleton<_i10.NetworkInterceptor>(
        () => _i10.NetworkInterceptor(gh<_i67.NetworkInfo>()));
    gh.lazySingleton<_i361.Dio>(() => dioModule.dio(
          gh<_i10.NetworkInterceptor>(),
          gh<_i637.AuthInterceptor>(),
          gh<_i1013.ErrorInterceptor>(),
          gh<_i403.UserAgentInterceptor>(),
        ));
    gh.lazySingleton<_i25.FlightRemoteDataSource>(
        () => _i270.FlightRemoteDataSourceImpl(gh<_i361.Dio>()));
    gh.lazySingleton<_i127.GiftcardRemoteDataSource>(
        () => _i127.GiftcardRemoteDataSourceImpl(gh<_i361.Dio>()));
    gh.lazySingleton<_i276.BankAccountRemoteDataSource>(
        () => _i687.BankAccountRemoteDataSourceImpl(gh<_i361.Dio>()));
    gh.lazySingleton<_i100.FlightRepository>(
        () => _i100.FlightRepositoryImpl(gh<_i25.FlightRemoteDataSource>()));
    gh.lazySingleton<_i73.UserRemoteDataSource>(
        () => _i556.UserRemoteDataSourceImpl(gh<_i361.Dio>()));
    gh.lazySingleton<_i682.KycRemoteDataSource>(
        () => _i362.KycRemoteDataSourceImpl(gh<_i361.Dio>()));
    gh.lazySingleton<_i640.SearchFlightsUseCase>(
        () => _i640.SearchFlightsUseCase(gh<_i100.FlightRepository>()));
    gh.lazySingleton<_i640.ConfirmFlightUseCase>(
        () => _i640.ConfirmFlightUseCase(gh<_i100.FlightRepository>()));
    gh.lazySingleton<_i640.BookFlightUseCase>(
        () => _i640.BookFlightUseCase(gh<_i100.FlightRepository>()));
    gh.lazySingleton<_i640.GetFlightBookingsUseCase>(
        () => _i640.GetFlightBookingsUseCase(gh<_i100.FlightRepository>()));
    gh.lazySingleton<_i640.GetBoardingPassUseCase>(
        () => _i640.GetBoardingPassUseCase(gh<_i100.FlightRepository>()));
    gh.lazySingleton<_i640.CancelFlightUseCase>(
        () => _i640.CancelFlightUseCase(gh<_i100.FlightRepository>()));
    gh.lazySingleton<_i922.DollarCardRemoteDataSource>(
        () => _i933.DollarCardRemoteDataSourceImpl(gh<_i361.Dio>()));
    gh.lazySingleton<_i813.WalletRemoteDataSource>(
        () => _i1044.WalletRemoteDataSourceImpl(gh<_i361.Dio>()));
    gh.lazySingleton<_i390.ShoppingRemoteDataSource>(
        () => _i273.ShoppingRemoteDataSourceImpl(gh<_i361.Dio>()));
    gh.lazySingleton<_i127.GiftcardRepository>(() =>
        _i127.GiftcardRepositoryImpl(gh<_i127.GiftcardRemoteDataSource>()));
    gh.lazySingleton<_i629.BankAccountRepository>(() =>
        _i1035.BankAccountRepositoryImpl(
            gh<_i276.BankAccountRemoteDataSource>()));
    gh.lazySingleton<_i674.DollarCardRepository>(() =>
        _i109.DollarCardRepositoryImpl(gh<_i922.DollarCardRemoteDataSource>()));
    gh.lazySingleton<_i766.ShoppingRepository>(() =>
        _i846.ShoppingRepositoryImpl(gh<_i390.ShoppingRemoteDataSource>()));
    gh.lazySingleton<_i505.KycRepository>(
        () => _i909.KycRepositoryImpl(gh<_i682.KycRemoteDataSource>()));
    gh.lazySingleton<_i540.GetHomepageUseCase>(
        () => _i540.GetHomepageUseCase(gh<_i766.ShoppingRepository>()));
    gh.lazySingleton<_i540.GetProductsUseCase>(
        () => _i540.GetProductsUseCase(gh<_i766.ShoppingRepository>()));
    gh.lazySingleton<_i540.GetProductDetailsUseCase>(
        () => _i540.GetProductDetailsUseCase(gh<_i766.ShoppingRepository>()));
    gh.lazySingleton<_i540.GetCategoriesUseCase>(
        () => _i540.GetCategoriesUseCase(gh<_i766.ShoppingRepository>()));
    gh.lazySingleton<_i540.GetCartUseCase>(
        () => _i540.GetCartUseCase(gh<_i766.ShoppingRepository>()));
    gh.lazySingleton<_i540.AddToCartUseCase>(
        () => _i540.AddToCartUseCase(gh<_i766.ShoppingRepository>()));
    gh.lazySingleton<_i540.UpdateCartItemUseCase>(
        () => _i540.UpdateCartItemUseCase(gh<_i766.ShoppingRepository>()));
    gh.lazySingleton<_i540.RemoveFromCartUseCase>(
        () => _i540.RemoveFromCartUseCase(gh<_i766.ShoppingRepository>()));
    gh.lazySingleton<_i540.CreateOrderUseCase>(
        () => _i540.CreateOrderUseCase(gh<_i766.ShoppingRepository>()));
    gh.lazySingleton<_i540.GetOrdersUseCase>(
        () => _i540.GetOrdersUseCase(gh<_i766.ShoppingRepository>()));
    gh.lazySingleton<_i540.GetOrderDetailsUseCase>(
        () => _i540.GetOrderDetailsUseCase(gh<_i766.ShoppingRepository>()));
    gh.lazySingleton<_i540.CreateReviewUseCase>(
        () => _i540.CreateReviewUseCase(gh<_i766.ShoppingRepository>()));
    gh.lazySingleton<_i540.GetProductReviewsUseCase>(
        () => _i540.GetProductReviewsUseCase(gh<_i766.ShoppingRepository>()));
    gh.lazySingleton<_i540.GetWatchlistUseCase>(
        () => _i540.GetWatchlistUseCase(gh<_i766.ShoppingRepository>()));
    gh.lazySingleton<_i540.AddToWatchlistUseCase>(
        () => _i540.AddToWatchlistUseCase(gh<_i766.ShoppingRepository>()));
    gh.lazySingleton<_i540.RemoveFromWatchlistUseCase>(
        () => _i540.RemoveFromWatchlistUseCase(gh<_i766.ShoppingRepository>()));
    gh.lazySingleton<_i836.WalletRepository>(
        () => _i867.WalletRepositoryImpl(gh<_i813.WalletRemoteDataSource>()));
    gh.lazySingleton<_i798.GetBuyGiftcardRatesUseCase>(
        () => _i798.GetBuyGiftcardRatesUseCase(gh<_i127.GiftcardRepository>()));
    gh.lazySingleton<_i798.GetSellGiftcardRatesUseCase>(() =>
        _i798.GetSellGiftcardRatesUseCase(gh<_i127.GiftcardRepository>()));
    gh.lazySingleton<_i798.BuyGiftcardUseCase>(
        () => _i798.BuyGiftcardUseCase(gh<_i127.GiftcardRepository>()));
    gh.lazySingleton<_i798.SellGiftcardUseCase>(
        () => _i798.SellGiftcardUseCase(gh<_i127.GiftcardRepository>()));
    gh.lazySingleton<_i86.BillPaymentRemoteDataSource>(
        () => _i358.BillPaymentRemoteDataSourceImpl(gh<_i361.Dio>()));
    gh.lazySingleton<_i716.UpdateProfileUseCase>(
        () => _i716.UpdateProfileUseCase(gh<_i505.KycRepository>()));
    gh.lazySingleton<_i142.GetKycDocumentTypesUseCase>(
        () => _i142.GetKycDocumentTypesUseCase(gh<_i505.KycRepository>()));
    gh.lazySingleton<_i702.VerifyBvnUseCase>(
        () => _i702.VerifyBvnUseCase(gh<_i505.KycRepository>()));
    gh.lazySingleton<_i869.UploadProfilePictureUseCase>(
        () => _i869.UploadProfilePictureUseCase(gh<_i505.KycRepository>()));
    gh.lazySingleton<_i1046.VerifyKycUseCase>(
        () => _i1046.VerifyKycUseCase(gh<_i505.KycRepository>()));
    gh.lazySingleton<_i1016.GetUserUseCase>(
        () => _i1016.GetUserUseCase(gh<_i505.KycRepository>()));
    gh.lazySingleton<_i430.CryptoRemoteDataSource>(
        () => _i430.CryptoRemoteDataSourceImpl(gh<_i361.Dio>()));
    gh.lazySingleton<_i417.BillPaymentRepository>(() =>
        _i781.BillPaymentRepositoryImpl(
            gh<_i86.BillPaymentRemoteDataSource>()));
    gh.lazySingleton<_i1066.CreateDollarCardUseCase>(
        () => _i1066.CreateDollarCardUseCase(gh<_i674.DollarCardRepository>()));
    gh.lazySingleton<_i1066.GetDollarCardUseCase>(
        () => _i1066.GetDollarCardUseCase(gh<_i674.DollarCardRepository>()));
    gh.lazySingleton<_i1066.FundDollarCardUseCase>(
        () => _i1066.FundDollarCardUseCase(gh<_i674.DollarCardRepository>()));
    gh.lazySingleton<_i1066.WithdrawDollarCardUseCase>(() =>
        _i1066.WithdrawDollarCardUseCase(gh<_i674.DollarCardRepository>()));
    gh.lazySingleton<_i1066.GetDollarCardTransactionsUseCase>(() =>
        _i1066.GetDollarCardTransactionsUseCase(
            gh<_i674.DollarCardRepository>()));
    gh.lazySingleton<_i1066.FreezeDollarCardUseCase>(
        () => _i1066.FreezeDollarCardUseCase(gh<_i674.DollarCardRepository>()));
    gh.lazySingleton<_i1066.UnfreezeDollarCardUseCase>(() =>
        _i1066.UnfreezeDollarCardUseCase(gh<_i674.DollarCardRepository>()));
    gh.lazySingleton<_i1066.TerminateDollarCardUseCase>(() =>
        _i1066.TerminateDollarCardUseCase(gh<_i674.DollarCardRepository>()));
    gh.lazySingleton<_i117.UserRepository>(
        () => _i48.UserRepositoryImpl(gh<_i73.UserRemoteDataSource>()));
    gh.lazySingleton<_i912.GetBanksUseCase>(
        () => _i912.GetBanksUseCase(gh<_i629.BankAccountRepository>()));
    gh.lazySingleton<_i912.GetBankAccountsUseCase>(
        () => _i912.GetBankAccountsUseCase(gh<_i629.BankAccountRepository>()));
    gh.lazySingleton<_i912.AddBankAccountUseCase>(
        () => _i912.AddBankAccountUseCase(gh<_i629.BankAccountRepository>()));
    gh.lazySingleton<_i912.UpdateBankAccountUseCase>(() =>
        _i912.UpdateBankAccountUseCase(gh<_i629.BankAccountRepository>()));
    gh.lazySingleton<_i912.DeleteBankAccountUseCase>(() =>
        _i912.DeleteBankAccountUseCase(gh<_i629.BankAccountRepository>()));
    gh.lazySingleton<_i509.VerifyForgotPinOtpUseCase>(
        () => _i509.VerifyForgotPinOtpUseCase(gh<_i117.UserRepository>()));
    gh.lazySingleton<_i1043.ForgotPasswordUseCase>(
        () => _i1043.ForgotPasswordUseCase(gh<_i117.UserRepository>()));
    gh.lazySingleton<_i700.ForgotPinUseCase>(
        () => _i700.ForgotPinUseCase(gh<_i117.UserRepository>()));
    gh.lazySingleton<_i1047.RegisterUseCase>(
        () => _i1047.RegisterUseCase(gh<_i117.UserRepository>()));
    gh.lazySingleton<_i125.ResendPhoneOtpUseCase>(
        () => _i125.ResendPhoneOtpUseCase(gh<_i117.UserRepository>()));
    gh.lazySingleton<_i789.SetPinUseCase>(
        () => _i789.SetPinUseCase(gh<_i117.UserRepository>()));
    gh.lazySingleton<_i615.LoginUseCase>(
        () => _i615.LoginUseCase(gh<_i117.UserRepository>()));
    gh.lazySingleton<_i783.VerifyPhoneOtpUseCase>(
        () => _i783.VerifyPhoneOtpUseCase(gh<_i117.UserRepository>()));
    gh.lazySingleton<_i938.ResetPinUseCase>(
        () => _i938.ResetPinUseCase(gh<_i117.UserRepository>()));
    gh.lazySingleton<_i734.ResetPasswordUseCase>(
        () => _i734.ResetPasswordUseCase(gh<_i117.UserRepository>()));
    gh.lazySingleton<_i232.ResendEmailOtpUseCase>(
        () => _i232.ResendEmailOtpUseCase(gh<_i117.UserRepository>()));
    gh.lazySingleton<_i739.VerifyForgotPasswordOtpUseCase>(
        () => _i739.VerifyForgotPasswordOtpUseCase(gh<_i117.UserRepository>()));
    gh.lazySingleton<_i849.GetUserUseCase>(
        () => _i849.GetUserUseCase(gh<_i117.UserRepository>()));
    gh.lazySingleton<_i470.ChangePasswordUseCase>(
        () => _i470.ChangePasswordUseCase(gh<_i117.UserRepository>()));
    gh.lazySingleton<_i882.VerifyEmailOtpUseCase>(
        () => _i882.VerifyEmailOtpUseCase(gh<_i117.UserRepository>()));
    gh.lazySingleton<_i370.VerifyPinUseCase>(
        () => _i370.VerifyPinUseCase(gh<_i117.UserRepository>()));
    gh.lazySingleton<_i672.GetWalletUseCase>(
        () => _i672.GetWalletUseCase(gh<_i836.WalletRepository>()));
    gh.lazySingleton<_i649.WithdrawUseCase>(
        () => _i649.WithdrawUseCase(gh<_i836.WalletRepository>()));
    gh.lazySingleton<_i600.NameEnquiryUseCase>(
        () => _i600.NameEnquiryUseCase(gh<_i836.WalletRepository>()));
    gh.lazySingleton<_i831.GetAirtimeBillersUseCase>(() =>
        _i831.GetAirtimeBillersUseCase(gh<_i417.BillPaymentRepository>()));
    gh.lazySingleton<_i831.GetDataBillersUseCase>(
        () => _i831.GetDataBillersUseCase(gh<_i417.BillPaymentRepository>()));
    gh.lazySingleton<_i831.GetElectricityBillersUseCase>(() =>
        _i831.GetElectricityBillersUseCase(gh<_i417.BillPaymentRepository>()));
    gh.lazySingleton<_i831.GetBettingBillersUseCase>(() =>
        _i831.GetBettingBillersUseCase(gh<_i417.BillPaymentRepository>()));
    gh.lazySingleton<_i831.GetTvBillersUseCase>(
        () => _i831.GetTvBillersUseCase(gh<_i417.BillPaymentRepository>()));
    gh.lazySingleton<_i831.VerifyBillCustomerUseCase>(() =>
        _i831.VerifyBillCustomerUseCase(gh<_i417.BillPaymentRepository>()));
    gh.lazySingleton<_i831.PurchaseBillUseCase>(
        () => _i831.PurchaseBillUseCase(gh<_i417.BillPaymentRepository>()));
    gh.lazySingleton<_i430.CryptoRepository>(
        () => _i430.CryptoRepositoryImpl(gh<_i430.CryptoRemoteDataSource>()));
    gh.lazySingleton<_i907.GetCryptoRatesUseCase>(
        () => _i907.GetCryptoRatesUseCase(gh<_i430.CryptoRepository>()));
    gh.lazySingleton<_i907.GetEstimatedAssetValueUseCase>(() =>
        _i907.GetEstimatedAssetValueUseCase(gh<_i430.CryptoRepository>()));
    gh.lazySingleton<_i907.GetCryptoWalletUseCase>(
        () => _i907.GetCryptoWalletUseCase(gh<_i430.CryptoRepository>()));
    gh.lazySingleton<_i907.BuyCryptoUseCase>(
        () => _i907.BuyCryptoUseCase(gh<_i430.CryptoRepository>()));
    gh.lazySingleton<_i907.SellCryptoUseCase>(
        () => _i907.SellCryptoUseCase(gh<_i430.CryptoRepository>()));
    gh.lazySingleton<_i_ref_ds.ReferralRemoteDataSource>(
        () => _i_ref_ds_impl.ReferralRemoteDataSourceImpl(gh<_i361.Dio>()));
    gh.lazySingleton<_i_ref_repo.ReferralRepository>(
        () => _i_ref_repo_impl.ReferralRepositoryImpl(gh<_i_ref_ds.ReferralRemoteDataSource>()));
    gh.lazySingleton<_i_ref_uc.GetMyReferralsUseCase>(
        () => _i_ref_uc.GetMyReferralsUseCase(gh<_i_ref_repo.ReferralRepository>()));
    gh.lazySingleton<_i_tx_repo.TransactionRepository>(
        () => _i_tx_repo_impl.TransactionRepositoryImpl(gh<_i813.WalletRemoteDataSource>()));
    gh.lazySingleton<_i_tx_uc.GetMyTransactionsUseCase>(
        () => _i_tx_uc.GetMyTransactionsUseCase(gh<_i_tx_repo.TransactionRepository>()));
    gh.lazySingleton<_i_notif_ds.NotificationRemoteDataSource>(
        () => _i_notif_ds_impl.NotificationRemoteDataSourceImpl(gh<_i361.Dio>()));
    gh.lazySingleton<_i_notif_repo.NotificationRepository>(
        () => _i_notif_repo_impl.NotificationRepositoryImpl(gh<_i_notif_ds.NotificationRemoteDataSource>()));
    gh.lazySingleton<_i_notif_uc.GetMyNotificationsUseCase>(
        () => _i_notif_uc.GetMyNotificationsUseCase(gh<_i_notif_repo.NotificationRepository>()));
    return this;
  }
}

class _$FirebaseModule extends _i462.FirebaseModule {}

class _$DioModule extends _i904.DioModule {}
