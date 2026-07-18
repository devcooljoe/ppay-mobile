// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i168;
import 'package:flutter/material.dart' as _i169;
import 'package:image_picker/image_picker.dart' as _i177;
import 'package:ppay_mobile/module/auth/presentation/pages/create_password_page.dart'
    as _i42;
import 'package:ppay_mobile/module/auth/presentation/pages/create_pin_page.dart'
    as _i43;
import 'package:ppay_mobile/module/auth/presentation/pages/created_pin_page.dart'
    as _i45;
import 'package:ppay_mobile/module/auth/presentation/pages/forgot_password_page.dart'
    as _i79;
import 'package:ppay_mobile/module/auth/presentation/pages/login_page.dart'
    as _i93;
import 'package:ppay_mobile/module/auth/presentation/pages/login_password_changed_page.dart'
    as _i94;
import 'package:ppay_mobile/module/auth/presentation/pages/login_password_reset_page.dart'
    as _i95;
import 'package:ppay_mobile/module/auth/presentation/pages/password_changed_page.dart'
    as _i115;
import 'package:ppay_mobile/module/auth/presentation/pages/password_reset_page.dart'
    as _i116;
import 'package:ppay_mobile/module/auth/presentation/pages/signup_page.dart'
    as _i144;
import 'package:ppay_mobile/module/auth/presentation/pages/verify_code_page.dart'
    as _i158;
import 'package:ppay_mobile/module/auth/presentation/pages/verify_email_otp_page.dart'
    as _i159;
import 'package:ppay_mobile/module/auth/presentation/pages/verify_forgot_page.dart'
    as _i160;
import 'package:ppay_mobile/module/auth/presentation/pages/verify_phone_page.dart'
    as _i162;
import 'package:ppay_mobile/module/bills/domain/entities/bill_entity.dart'
    as _i172;
import 'package:ppay_mobile/module/bills/domain/entities/bill_type.dart'
    as _i171;
import 'package:ppay_mobile/module/bills/presentation/pages/airtime_confirm_page.dart'
    as _i3;
import 'package:ppay_mobile/module/bills/presentation/pages/airtime_page.dart'
    as _i4;
import 'package:ppay_mobile/module/bills/presentation/pages/airtime_receipt_page.dart'
    as _i5;
import 'package:ppay_mobile/module/bills/presentation/pages/bet_confirm_page.dart'
    as _i11;
import 'package:ppay_mobile/module/bills/presentation/pages/bet_page.dart'
    as _i12;
import 'package:ppay_mobile/module/bills/presentation/pages/betting_receipt_page.dart'
    as _i13;
import 'package:ppay_mobile/module/bills/presentation/pages/bill_confirm_page.dart'
    as _i14;
import 'package:ppay_mobile/module/bills/presentation/pages/bill_receipt_page.dart'
    as _i15;
import 'package:ppay_mobile/module/bills/presentation/pages/bill_success_page.dart'
    as _i16;
import 'package:ppay_mobile/module/bills/presentation/pages/bills_page.dart'
    as _i17;
import 'package:ppay_mobile/module/bills/presentation/pages/data_confirm_page.dart'
    as _i54;
import 'package:ppay_mobile/module/bills/presentation/pages/data_page.dart'
    as _i55;
import 'package:ppay_mobile/module/bills/presentation/pages/data_receipt_page.dart'
    as _i56;
import 'package:ppay_mobile/module/bills/presentation/pages/electricity_confirm_page.dart'
    as _i59;
import 'package:ppay_mobile/module/bills/presentation/pages/electricity_page.dart'
    as _i60;
import 'package:ppay_mobile/module/bills/presentation/pages/electricity_receipt_page.dart'
    as _i61;
import 'package:ppay_mobile/module/bills/presentation/pages/payment_page.dart'
    as _i117;
import 'package:ppay_mobile/module/bills/presentation/pages/tv_cable_confirm_page.dart'
    as _i155;
import 'package:ppay_mobile/module/bills/presentation/pages/tv_cable_page.dart'
    as _i156;
import 'package:ppay_mobile/module/bills/presentation/pages/tv_cable_receipt_page.dart'
    as _i157;
import 'package:ppay_mobile/module/crypto/domain/entities/crypto_entity.dart'
    as _i175;
import 'package:ppay_mobile/module/crypto/presentation/pages/all_tokens_page.dart'
    as _i6;
import 'package:ppay_mobile/module/crypto/presentation/pages/assets_page.dart'
    as _i8;
import 'package:ppay_mobile/module/crypto/presentation/pages/buy_crypto_page.dart'
    as _i22;
import 'package:ppay_mobile/module/crypto/presentation/pages/confirm_buy_page.dart'
    as _i37;
import 'package:ppay_mobile/module/crypto/presentation/pages/confirm_sell_page.dart'
    as _i39;
import 'package:ppay_mobile/module/crypto/presentation/pages/crypto_page.dart'
    as _i46;
import 'package:ppay_mobile/module/crypto/presentation/pages/crypto_receipt_page.dart'
    as _i47;
import 'package:ppay_mobile/module/crypto/presentation/pages/crypto_sell_receipt_page.dart'
    as _i48;
import 'package:ppay_mobile/module/crypto/presentation/pages/crypto_sell_sucessful_page.dart'
    as _i49;
import 'package:ppay_mobile/module/crypto/presentation/pages/crypto_transaction_page.dart'
    as _i50;
import 'package:ppay_mobile/module/crypto/presentation/pages/crypto_transaction_succesful_page.dart'
    as _i51;
import 'package:ppay_mobile/module/crypto/presentation/pages/crypto_transactions_detail_page.dart'
    as _i52;
import 'package:ppay_mobile/module/crypto/presentation/pages/crypto_transactions_history_page.dart'
    as _i53;
import 'package:ppay_mobile/module/crypto/presentation/pages/fetch_wallet_progress_page.dart'
    as _i65;
import 'package:ppay_mobile/module/crypto/presentation/pages/manage_assets_page.dart'
    as _i96;
import 'package:ppay_mobile/module/crypto/presentation/pages/receive_crypto_page.dart'
    as _i123;
import 'package:ppay_mobile/module/crypto/presentation/pages/select_asset_page.dart'
    as _i132;
import 'package:ppay_mobile/module/crypto/presentation/pages/sell_crypto_page.dart'
    as _i136;
import 'package:ppay_mobile/module/crypto/presentation/pages/token_detail_page.dart'
    as _i147;
import 'package:ppay_mobile/module/crypto/presentation/pages/watchlist_page.dart'
    as _i165;
import 'package:ppay_mobile/module/crypto/presentation/pages/your_assets_page.dart'
    as _i166;
import 'package:ppay_mobile/module/dashboard/explore_page.dart' as _i62;
import 'package:ppay_mobile/module/dashboard/features_page.dart' as _i64;
import 'package:ppay_mobile/module/dashboard/home_page.dart' as _i89;
import 'package:ppay_mobile/module/dashboard/notification_page.dart' as _i108;
import 'package:ppay_mobile/module/flight/presentation/pages/active_flight_page.dart'
    as _i1;
import 'package:ppay_mobile/module/flight/presentation/pages/baggage_page.dart'
    as _i9;
import 'package:ppay_mobile/module/flight/presentation/pages/boarding_pass_page.dart'
    as _i19;
import 'package:ppay_mobile/module/flight/presentation/pages/boardinng_pass_details_page.dart'
    as _i18;
import 'package:ppay_mobile/module/flight/presentation/pages/booked_flights_page.dart'
    as _i20;
import 'package:ppay_mobile/module/flight/presentation/pages/booking_policies_page.dart'
    as _i21;
import 'package:ppay_mobile/module/flight/presentation/pages/cancel_flight_page.dart'
    as _i28;
import 'package:ppay_mobile/module/flight/presentation/pages/cancel_flight_successful_page.dart'
    as _i29;
import 'package:ppay_mobile/module/flight/presentation/pages/flight_book_page.dart'
    as _i68;
import 'package:ppay_mobile/module/flight/presentation/pages/flight_booking_page.dart'
    as _i69;
import 'package:ppay_mobile/module/flight/presentation/pages/flight_card_page.dart'
    as _i70;
import 'package:ppay_mobile/module/flight/presentation/pages/flight_details_page.dart'
    as _i71;
import 'package:ppay_mobile/module/flight/presentation/pages/flight_details_two_page.dart'
    as _i72;
import 'package:ppay_mobile/module/flight/presentation/pages/flight_payment_page.dart'
    as _i73;
import 'package:ppay_mobile/module/flight/presentation/pages/flight_payment_receipt_page.dart'
    as _i74;
import 'package:ppay_mobile/module/flight/presentation/pages/flight_paymwnt_success_page.dart'
    as _i75;
import 'package:ppay_mobile/module/flight/presentation/pages/flight_two_payment_page.dart'
    as _i76;
import 'package:ppay_mobile/module/flight/presentation/pages/flight_two_payment_receipt_page.dart'
    as _i77;
import 'package:ppay_mobile/module/flight/presentation/pages/flight_two_payment_success_page.dart'
    as _i78;
import 'package:ppay_mobile/module/flight/presentation/pages/multi_flight_details_page.dart'
    as _i97;
import 'package:ppay_mobile/module/flight/presentation/pages/multi_passengers_details_page.dart'
    as _i98;
import 'package:ppay_mobile/module/flight/presentation/pages/multi_payment_page.dart'
    as _i99;
import 'package:ppay_mobile/module/flight/presentation/pages/multi_payment_receipt_page.dart'
    as _i100;
import 'package:ppay_mobile/module/flight/presentation/pages/multi_payment_success_page.dart'
    as _i101;
import 'package:ppay_mobile/module/flight/presentation/pages/multi_search_result_page.dart'
    as _i102;
import 'package:ppay_mobile/module/flight/presentation/pages/multi_select_seat_one_page.dart'
    as _i103;
import 'package:ppay_mobile/module/flight/presentation/pages/multi_select_seat_three_page.dart'
    as _i104;
import 'package:ppay_mobile/module/flight/presentation/pages/multi_select_seat_two_page.dart'
    as _i105;
import 'package:ppay_mobile/module/flight/presentation/pages/multi_trip_page.dart'
    as _i106;
import 'package:ppay_mobile/module/flight/presentation/pages/one_way_trip_page.dart'
    as _i110;
import 'package:ppay_mobile/module/flight/presentation/pages/passenger_details_page.dart'
    as _i113;
import 'package:ppay_mobile/module/flight/presentation/pages/passenger_details_two_page.dart'
    as _i114;
import 'package:ppay_mobile/module/flight/presentation/pages/refund_details_page.dart'
    as _i125;
import 'package:ppay_mobile/module/flight/presentation/pages/refund_policy_page.dart'
    as _i126;
import 'package:ppay_mobile/module/flight/presentation/pages/round_way_trip_page.dart'
    as _i128;
import 'package:ppay_mobile/module/flight/presentation/pages/search_result_page.dart'
    as _i130;
import 'package:ppay_mobile/module/flight/presentation/pages/search_result_two_page.dart'
    as _i131;
import 'package:ppay_mobile/module/flight/presentation/pages/select_inbound_seat_page.dart'
    as _i133;
import 'package:ppay_mobile/module/flight/presentation/pages/select_outbound_seat_page.dart'
    as _i134;
import 'package:ppay_mobile/module/flight/presentation/pages/select_seat_page.dart'
    as _i135;
import 'package:ppay_mobile/module/giftcard/domain/entities/giftcard_entity.dart'
    as _i176;
import 'package:ppay_mobile/module/giftcard/presentation/pages/buy_gift_card_features_page.dart'
    as _i23;
import 'package:ppay_mobile/module/giftcard/presentation/pages/buy_giftcard_page.dart'
    as _i24;
import 'package:ppay_mobile/module/giftcard/presentation/pages/confirm_gift_card_sell_page.dart'
    as _i38;
import 'package:ppay_mobile/module/giftcard/presentation/pages/gift_card_buy_receipt_page.dart'
    as _i84;
import 'package:ppay_mobile/module/giftcard/presentation/pages/gift_card_sucess_page.dart'
    as _i85;
import 'package:ppay_mobile/module/giftcard/presentation/pages/giftcard_page.dart'
    as _i86;
import 'package:ppay_mobile/module/giftcard/presentation/pages/giftcard_sell_receipt_page.dart'
    as _i87;
import 'package:ppay_mobile/module/giftcard/presentation/pages/sell_gift_card_features_page.dart'
    as _i137;
import 'package:ppay_mobile/module/giftcard/presentation/pages/sell_gift_card_success_page.dart'
    as _i138;
import 'package:ppay_mobile/module/giftcard/presentation/pages/sell_giftcard_page.dart'
    as _i139;
import 'package:ppay_mobile/module/kyc/presentation/pages/bvn_face_recog_page.dart'
    as _i25;
import 'package:ppay_mobile/module/kyc/presentation/pages/bvn_verification_page.dart'
    as _i26;
import 'package:ppay_mobile/module/kyc/presentation/pages/bvnconfirm_page.dart'
    as _i27;
import 'package:ppay_mobile/module/kyc/presentation/pages/kyc_face_verification_page.dart'
    as _i90;
import 'package:ppay_mobile/module/kyc/presentation/pages/kyc_verification_complete_page.dart'
    as _i91;
import 'package:ppay_mobile/module/kyc/presentation/pages/kyc_verification_page.dart'
    as _i92;
import 'package:ppay_mobile/module/kyc/presentation/pages/review_document_page.dart'
    as _i127;
import 'package:ppay_mobile/module/onboarding/fingerprint_complete_page.dart'
    as _i66;
import 'package:ppay_mobile/module/onboarding/fingerprint_page.dart' as _i67;
import 'package:ppay_mobile/module/onboarding/onboard_page.dart' as _i109;
import 'package:ppay_mobile/module/onboarding/set_up_fingerprint_page.dart'
    as _i140;
import 'package:ppay_mobile/module/onboarding/setting_up_fingerprint_page.dart'
    as _i141;
import 'package:ppay_mobile/module/onboarding/splash_page.dart' as _i145;
import 'package:ppay_mobile/module/settings/domain/entities/bank_account_entity.dart'
    as _i170;
import 'package:ppay_mobile/module/settings/presentation/pages/bank_account_page.dart'
    as _i10;
import 'package:ppay_mobile/module/settings/presentation/pages/change_password_page.dart'
    as _i33;
import 'package:ppay_mobile/module/settings/presentation/pages/contact_tab_page.dart'
    as _i41;
import 'package:ppay_mobile/module/settings/presentation/pages/edit_account_page.dart'
    as _i57;
import 'package:ppay_mobile/module/settings/presentation/pages/edit_profile_page.dart'
    as _i58;
import 'package:ppay_mobile/module/settings/presentation/pages/faq_tab_page.dart'
    as _i63;
import 'package:ppay_mobile/module/settings/presentation/pages/help_and_support_page.dart'
    as _i88;
import 'package:ppay_mobile/module/settings/presentation/pages/pin_reset_complete_page.dart'
    as _i118;
import 'package:ppay_mobile/module/settings/presentation/pages/pin_reset_page.dart'
    as _i119;
import 'package:ppay_mobile/module/settings/presentation/pages/privacy_page.dart'
    as _i120;
import 'package:ppay_mobile/module/settings/presentation/pages/profile_page.dart'
    as _i121;
import 'package:ppay_mobile/module/settings/presentation/pages/refer_page.dart'
    as _i124;
import 'package:ppay_mobile/module/settings/presentation/pages/settings_page.dart'
    as _i142;
import 'package:ppay_mobile/module/settings/presentation/pages/terms_and_condition_page.dart'
    as _i146;
import 'package:ppay_mobile/module/settings/presentation/pages/transaction_limit_page.dart'
    as _i152;
import 'package:ppay_mobile/module/settings/presentation/pages/veriify_password_detail_page.dart'
    as _i161;
import 'package:ppay_mobile/module/shopping/domain/entities/shopping_entity.dart'
    as _i178;
import 'package:ppay_mobile/module/shopping/presentation/pages/check_out_page.dart'
    as _i34;
import 'package:ppay_mobile/module/shopping/presentation/pages/cloths_details_page.dart'
    as _i35;
import 'package:ppay_mobile/module/shopping/presentation/pages/cloths_page.dart'
    as _i36;
import 'package:ppay_mobile/module/shopping/presentation/pages/order_receipt_page.dart'
    as _i111;
import 'package:ppay_mobile/module/shopping/presentation/pages/order_successful_page.dart'
    as _i112;
import 'package:ppay_mobile/module/shopping/presentation/pages/shopping_page.dart'
    as _i143;
import 'package:ppay_mobile/module/shopping/presentation/pages/track_order_page.dart'
    as _i148;
import 'package:ppay_mobile/module/shopping/presentation/pages/your_order_page.dart'
    as _i167;
import 'package:ppay_mobile/module/transaction/domain/entities/transaction_entity.dart'
    as _i173;
import 'package:ppay_mobile/module/transaction/presentation/pages/amount_and_info_page.dart'
    as _i7;
import 'package:ppay_mobile/module/transaction/presentation/pages/confirm_transaction_page.dart'
    as _i40;
import 'package:ppay_mobile/module/transaction/presentation/pages/fund_wallet_page.dart'
    as _i83;
import 'package:ppay_mobile/module/transaction/presentation/pages/receipt_page.dart'
    as _i122;
import 'package:ppay_mobile/module/transaction/presentation/pages/transaction_history_detail_page.dart'
    as _i150;
import 'package:ppay_mobile/module/transaction/presentation/pages/transaction_history_page.dart'
    as _i151;
import 'package:ppay_mobile/module/transaction/presentation/pages/transaction_successful_page.dart'
    as _i153;
import 'package:ppay_mobile/module/transaction/presentation/pages/transfer_funds_page.dart'
    as _i154;
import 'package:ppay_mobile/module/virtual_card/domain/entities/dollar_card_entity.dart'
    as _i174;
import 'package:ppay_mobile/module/virtual_card/domain/entities/dollar_card_transaction_entity.dart'
    as _i180;
import 'package:ppay_mobile/module/virtual_card/presentation/pages/add_dollar_card_page.dart'
    as _i2;
import 'package:ppay_mobile/module/virtual_card/presentation/pages/card_limit_page.dart'
    as _i30;
import 'package:ppay_mobile/module/virtual_card/presentation/pages/card_page.dart'
    as _i31;
import 'package:ppay_mobile/module/virtual_card/presentation/pages/card_transaction_page.dart'
    as _i32;
import 'package:ppay_mobile/module/virtual_card/presentation/pages/create_virtual_card_page.dart'
    as _i44;
import 'package:ppay_mobile/module/virtual_card/presentation/pages/fund_card_page.dart'
    as _i80;
import 'package:ppay_mobile/module/virtual_card/presentation/pages/fund_card_receipt_page.dart'
    as _i81;
import 'package:ppay_mobile/module/virtual_card/presentation/pages/fund_card_successful_page.dart'
    as _i82;
import 'package:ppay_mobile/module/virtual_card/presentation/pages/my_cards_page.dart'
    as _i107;
import 'package:ppay_mobile/module/virtual_card/presentation/pages/search_card_page.dart'
    as _i129;
import 'package:ppay_mobile/module/virtual_card/presentation/pages/transaction_details_page.dart'
    as _i149;
import 'package:ppay_mobile/module/virtual_card/presentation/pages/virtual_card_page.dart'
    as _i163;
import 'package:ppay_mobile/module/virtual_card/presentation/pages/virtual_card_success_page.dart'
    as _i164;
import 'package:ppay_mobile/shared/models/all_token_screen_model.dart' as _i179;

abstract class $AppRouter extends _i168.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i168.PageFactory> pagesMap = {
    ActiveFlightRoute.name: (routeData) {
      return _i168.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.ActiveFlightPage(),
      );
    },
    AddDollarCardRoute.name: (routeData) {
      return _i168.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.AddDollarCardPage(),
      );
    },
    AirtimeConfirmRoute.name: (routeData) {
      return _i168.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.AirtimeConfirmPage(),
      );
    },
    AirtimeRoute.name: (routeData) {
      return _i168.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.AirtimePage(),
      );
    },
    AirtimeReceiptRoute.name: (routeData) {
      return _i168.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.AirtimeReceiptPage(),
      );
    },
    AllTokensRoute.name: (routeData) {
      return _i168.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.AllTokensPage(),
      );
    },
    AmountAndInfoRoute.name: (routeData) {
      final args = routeData.argsAs<AmountAndInfoRouteArgs>();
      return _i168.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i7.AmountAndInfoPage(
          key: args.key,
          account: args.account,
        ),
      );
    },
    AssetsRoute.name: (routeData) {
      return _i168.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.AssetsPage(),
      );
    },
    BaggageRoute.name: (routeData) {
      return _i168.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.BaggagePage(),
      );
    },
    BankAccountRoute.name: (routeData) {
      return _i168.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.BankAccountPage(),
      );
    },
    BetConfirmRoute.name: (routeData) {
      return _i168.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.BetConfirmPage(),
      );
    },
    BetRoute.name: (routeData) {
      return _i168.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i12.BetPage(),
      );
    },
    BettingReceiptRoute.name: (routeData) {
      return _i168.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i13.BettingReceiptPage(),
      );
    },
    BillConfirmRoute.name: (routeData) {
      final args = routeData.argsAs<BillConfirmRouteArgs>();
      return _i168.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i14.BillConfirmPage(
          key: args.key,
          args: args.args,
        ),
      );
    },
    BillReceiptRoute.name: (routeData) {
      final args = routeData.argsAs<BillReceiptRouteArgs>();
      return _i168.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i15.BillReceiptPage(
          key: args.key,
          args: args.args,
          reference: args.reference,
          fee: args.fee,
          purchasedAt: args.purchasedAt,
        ),
      );
    },
    BillSuccessRoute.name: (routeData) {
      final args = routeData.argsAs<BillSuccessRouteArgs>();
      return _i168.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i16.BillSuccessPage(
          key: args.key,
          billType: args.billType,
          amount: args.amount,
          biller: args.biller,
          args: args.args,
          reference: args.reference,
          fee: args.fee,
          purchasedAt: args.purchasedAt,
        ),
      );
    },
    BillsRoute.name: (routeData) {
      return _i168.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i17.BillsPage(),
      );
    },
    BoardingPassDetailsRoute.name: (routeData) {
      return _i168.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i18.BoardingPassDetailsPage(),
      );
    },
    BoardingPassRoute.name: (routeData) {
      final args = routeData.argsAs<BoardingPassRouteArgs>(
          orElse: () => const BoardingPassRouteArgs());
      return _i168.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i19.BoardingPassPage(
          key: args.key,
          bookingReference: args.bookingReference,
        ),
      );
    },
    BookedFlightsRoute.name: (routeData) {
      return _i168.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i20.BookedFlightsPage(),
      );
    },
    BookingPoliciesRoute.name: (routeData) {
      return _i168.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i21.BookingPoliciesPage(),
      );
    },
    BuyCryptoRoute.name: (routeData) {
      return _i168.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i22.BuyCryptoPage(),
      );
    },
    BuyGiftCardFeaturesRoute.name: (routeData) {
      return _i168.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i23.BuyGiftCardFeaturesPage(),
      );
    },
    BuyGiftcardRoute.name: (routeData) {
      final args = routeData.argsAs<BuyGiftcardRouteArgs>();
      return _i168.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i24.BuyGiftcardPage(
          key: args.key,
          transaction: args.transaction,
        ),
      );
    },
    BvnFaceRecogRoute.name: (routeData) {
      return _i168.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i25.BvnFaceRecogPage(),
      );
    },
    BvnVerificationRoute.name: (routeData) {
      return _i168.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i26.BvnVerificationPage(),
      );
    },
    BvnconfirmRoute.name: (routeData) {
      return _i168.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i27.BvnconfirmPage(),
      );
    },
    CancelFlightRoute.name: (routeData) {
      return _i168.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i28.CancelFlightPage(),
      );
    },
    CancelFlightSuccessfulRoute.name: (routeData) {
      return _i168.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i29.CancelFlightSuccessfulPage(),
      );
    },
    CardLimitRoute.name: (routeData) {
      return _i168.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i30.CardLimitPage(),
      );
    },
    CardRoute.name: (routeData) {
      final args = routeData.argsAs<CardRouteArgs>();
      return _i168.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i31.CardPage(
          key: args.key,
          card: args.card,
        ),
      );
    },
    CardTransactionRoute.name: (routeData) {
      final args = routeData.argsAs<CardTransactionRouteArgs>();
      return _i168.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i32.CardTransactionPage(
          key: args.key,
          card: args.card,
        ),
      );
    },
    ChangePasswordRoute.name: (routeData) {
      return _i168.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i33.ChangePasswordPage(),
      );
    },
    CheckOutRoute.name: (routeData) {
      return _i168.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i34.CheckOutPage(),
      );
    },
    ClothsDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<ClothsDetailsRouteArgs>();
      return _i168.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i35.ClothsDetailsPage(
          key: args.key,
          productId: args.productId,
        ),
      );
    },
    ClothsRoute.name: (routeData) {
      return _i168.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i36.ClothsPage(),
      );
    },
    ConfirmBuyRoute.name: (routeData) {
      final args = routeData.argsAs<ConfirmBuyRouteArgs>();
      return _i168.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i37.ConfirmBuyPage(
          key: args.key,
          rate: args.rate,
          wallet: args.wallet,
          nairaAmount: args.nairaAmount,
          cryptoAmount: args.cryptoAmount,
        ),
      );
    },
    ConfirmGiftCardSellRoute.name: (routeData) {
      final args = routeData.argsAs<ConfirmGiftCardSellRouteArgs>();
      return _i168.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i38.ConfirmGiftCardSellPage(
          key: args.key,
          cardType: args.cardType,
          logoUrl: args.logoUrl,
          subcategory: args.subcategory,
          country: args.country,
          amount: args.amount,
          nairaEquivalent: args.nairaEquivalent,
          sellRate: args.sellRate,
          ecode: args.ecode,
          cardImages: args.cardImages,
        ),
      );
    },
    ConfirmSellRoute.name: (routeData) {
      final args = routeData.argsAs<ConfirmSellRouteArgs>();
      return _i168.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i39.ConfirmSellPage(
          key: args.key,
          rate: args.rate,
          wallet: args.wallet,
          cryptoAmount: args.cryptoAmount,
          nairaValue: args.nairaValue,
        ),
      );
    },
    ConfirmTransactionRoute.name: (routeData) {
      final args = routeData.argsAs<ConfirmTransactionRouteArgs>();
      return _i168.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i40.ConfirmTransactionPage(
          key: args.key,
          account: args.account,
          amount: args.amount,
        ),
      );
    },
    ContactTabRoute.name: (routeData) {
      return _i168.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i41.ContactTabPage(),
      );
    },
    CreatePasswordRoute.name: (routeData) {
      final args = routeData.argsAs<CreatePasswordRouteArgs>();
      return _i168.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i42.CreatePasswordPage(
          key: args.key,
          fullName: args.fullName,
          emailAddress: args.emailAddress,
          phoneNumber: args.phoneNumber,
          referralCode: args.referralCode,
        ),
      );
    },
    CreatePinRoute.name: (routeData) {
      return _i168.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i43.CreatePinPage(),
      );
    },
    CreateVirtualCardRoute.name: (routeData) {
      return _i168.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i44.CreateVirtualCardPage(),
      );
    },
    CreatedPinRoute.name: (routeData) {
      return _i168.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i45.CreatedPinPage(),
      );
    },
    CryptoRoute.name: (routeData) {
      return _i168.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i46.CryptoPage(),
      );
    },
    CryptoReceiptRoute.name: (routeData) {
      return _i168.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i47.CryptoReceiptPage(),
      );
    },
    CryptoSellReceiptRoute.name: (routeData) {
      return _i168.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i48.CryptoSellReceiptPage(),
      );
    },
    CryptoSellSuccessfulRoute.name: (routeData) {
      return _i168.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i49.CryptoSellSuccessfulPage(),
      );
    },
    CryptoTransactionRoute.name: (routeData) {
      final args = routeData.argsAs<CryptoTransactionRouteArgs>();
      return _i168.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i50.CryptoTransactionPage(
          key: args.key,
          rate: args.rate,
          wallet: args.wallet,
          isForSelling: args.isForSelling,
        ),
      );
    },
    CryptoTransactionSuccessfulRoute.name: (routeData) {
      final args = routeData.argsAs<CryptoTransactionSuccessfulRouteArgs>();
      return _i168.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i51.CryptoTransactionSuccessfulPage(
          key: args.key,
          cryptoAmount: args.cryptoAmount,
          currency: args.currency,
          nairaAmount: args.nairaAmount,
          logoUrl: args.logoUrl,
          isBuy: args.isBuy,
        ),
      );
    },
    CryptoTransactionsDetailRoute.name: (routeData) {
      final args = routeData.argsAs<CryptoTransactionsDetailRouteArgs>();
      return _i168.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i52.CryptoTransactionsDetailPage(
          key: args.key,
          transaction: args.transaction,
        ),
      );
    },
    CryptoTransactionsHistoryRoute.name: (routeData) {
      return _i168.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i53.CryptoTransactionsHistoryPage(),
      );
    },
    DataConfirmRoute.name: (routeData) {
      return _i168.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i54.DataConfirmPage(),
      );
    },
    DataRoute.name: (routeData) {
      return _i168.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i55.DataPage(),
      );
    },
    DataReceiptRoute.name: (routeData) {
      return _i168.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i56.DataReceiptPage(),
      );
    },
    EditAccountRoute.name: (routeData) {
      final args = routeData.argsAs<EditAccountRouteArgs>(
          orElse: () => const EditAccountRouteArgs());
      return _i168.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i57.EditAccountPage(
          key: args.key,
          account: args.account,
        ),
      );
    },
    EditProfileRoute.name: (routeData) {
      return _i168.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i58.EditProfilePage(),
      );
    },
    ElectricityConfirmRoute.name: (routeData) {
      return _i168.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i59.ElectricityConfirmPage(),
      );
    },
    ElectricityRoute.name: (routeData) {
      return _i168.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i60.ElectricityPage(),
      );
    },
    ElectricityReceiptRoute.name: (routeData) {
      return _i168.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i61.ElectricityReceiptPage(),
      );
    },
    ExploreRoute.name: (routeData) {
      return _i168.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i62.ExplorePage(),
      );
    },
    FaqTabRoute.name: (routeData) {
      return _i168.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i63.FaqTabPage(),
      );
    },
    FeaturesRoute.name: (routeData) {
      return _i168.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i64.FeaturesPage(),
      );
    },
    FetchWalletProgressRoute.name: (routeData) {
      final args = routeData.argsAs<FetchWalletProgressRouteArgs>();
      return _i168.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i65.FetchWalletProgressPage(
          key: args.key,
          currency: args.currency,
          cryptoName: args.cryptoName,
          logoUrl: args.logoUrl,
          isForSelling: args.isForSelling,
          rate: args.rate,
        ),
      );
    },
    FingerprintCompleteRoute.name: (routeData) {
      return _i168.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i66.FingerprintCompletePage(),
      );
    },
    FingerprintRoute.name: (routeData) {
      return _i168.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i67.FingerprintPage(),
      );
    },
    FlightBookRoute.name: (routeData) {
      return _i168.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i68.FlightBookPage(),
      );
    },
    FlightBookingRoute.name: (routeData) {
      return _i168.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i69.FlightBookingPage(),
      );
    },
    FlightCardRoute.name: (routeData) {
      return _i168.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i70.FlightCardPage(),
      );
    },
    FlightDetailsRoute.name: (routeData) {
      return _i168.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i71.FlightDetailsPage(),
      );
    },
    FlightDetailsTwoRoute.name: (routeData) {
      return _i168.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i72.FlightDetailsTwoPage(),
      );
    },
    FlightPaymentRoute.name: (routeData) {
      return _i168.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i73.FlightPaymentPage(),
      );
    },
    FlightPaymentReceiptRoute.name: (routeData) {
      return _i168.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i74.FlightPaymentReceiptPage(),
      );
    },
    FlightPaymentSuccessRoute.name: (routeData) {
      return _i168.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i75.FlightPaymentSuccessPage(),
      );
    },
    FlightTwoPaymentRoute.name: (routeData) {
      return _i168.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i76.FlightTwoPaymentPage(),
      );
    },
    FlightTwoPaymentReceiptRoute.name: (routeData) {
      return _i168.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i77.FlightTwoPaymentReceiptPage(),
      );
    },
    FlightTwoPaymentSuccessRoute.name: (routeData) {
      return _i168.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i78.FlightTwoPaymentSuccessPage(),
      );
    },
    ForgotPasswordRoute.name: (routeData) {
      return _i168.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i79.ForgotPasswordPage(),
      );
    },
    FundCardRoute.name: (routeData) {
      final args = routeData.argsAs<FundCardRouteArgs>();
      return _i168.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i80.FundCardPage(
          key: args.key,
          card: args.card,
        ),
      );
    },
    FundCardReceiptRoute.name: (routeData) {
      final args = routeData.argsAs<FundCardReceiptRouteArgs>();
      return _i168.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i81.FundCardReceiptPage(
          key: args.key,
          amountUsd: args.amountUsd,
          nairaAmount: args.nairaAmount,
          rate: args.rate,
          fundedAt: args.fundedAt,
        ),
      );
    },
    FundCardSuccessfulRoute.name: (routeData) {
      final args = routeData.argsAs<FundCardSuccessfulRouteArgs>(
          orElse: () => const FundCardSuccessfulRouteArgs());
      return _i168.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i82.FundCardSuccessfulPage(
          key: args.key,
          amountUsd: args.amountUsd,
          nairaAmount: args.nairaAmount,
          rate: args.rate,
        ),
      );
    },
    FundWalletRoute.name: (routeData) {
      return _i168.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i83.FundWalletPage(),
      );
    },
    GiftCardBuyReceiptRoute.name: (routeData) {
      final args = routeData.argsAs<GiftCardBuyReceiptRouteArgs>();
      return _i168.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i84.GiftCardBuyReceiptPage(
          key: args.key,
          cardType: args.cardType,
          amountInNaira: args.amountInNaira,
          amountInUSD: args.amountInUSD,
          region: args.region,
          rate: args.rate,
          purchasedAt: args.purchasedAt,
        ),
      );
    },
    GiftCardSuccessRoute.name: (routeData) {
      final args = routeData.argsAs<GiftCardSuccessRouteArgs>();
      return _i168.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i85.GiftCardSuccessPage(
          key: args.key,
          cardType: args.cardType,
          amountInNaira: args.amountInNaira,
          amountInUSD: args.amountInUSD,
          region: args.region,
          rate: args.rate,
        ),
      );
    },
    GiftcardRoute.name: (routeData) {
      return _i168.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i86.GiftcardPage(),
      );
    },
    GiftcardSellReceiptRoute.name: (routeData) {
      final args = routeData.argsAs<GiftcardSellReceiptRouteArgs>();
      return _i168.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i87.GiftcardSellReceiptPage(
          key: args.key,
          cardType: args.cardType,
          amountInUSD: args.amountInUSD,
          nairaEquivalent: args.nairaEquivalent,
          sellRate: args.sellRate,
          submittedAt: args.submittedAt,
        ),
      );
    },
    HelpAndSupportRoute.name: (routeData) {
      return _i168.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i88.HelpAndSupportPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i168.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i89.HomePage(),
      );
    },
    KycFaceVerificationRoute.name: (routeData) {
      return _i168.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i90.KycFaceVerificationPage(),
      );
    },
    KycVerificationCompleteRoute.name: (routeData) {
      return _i168.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i91.KycVerificationCompletePage(),
      );
    },
    KycVerificationRoute.name: (routeData) {
      return _i168.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i92.KycVerificationPage(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i168.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i93.LoginPage(),
      );
    },
    LoginPasswordChangedRoute.name: (routeData) {
      return _i168.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i94.LoginPasswordChangedPage(),
      );
    },
    LoginPasswordResetRoute.name: (routeData) {
      final args = routeData.argsAs<LoginPasswordResetRouteArgs>();
      return _i168.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i95.LoginPasswordResetPage(
          key: args.key,
          resetToken: args.resetToken,
        ),
      );
    },
    ManageAssetsRoute.name: (routeData) {
      return _i168.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i96.ManageAssetsPage(),
      );
    },
    MultiFlightDetailsRoute.name: (routeData) {
      return _i168.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i97.MultiFlightDetailsPage(),
      );
    },
    MultiPassengersDetailsRoute.name: (routeData) {
      return _i168.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i98.MultiPassengersDetailsPage(),
      );
    },
    MultiPaymentRoute.name: (routeData) {
      return _i168.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i99.MultiPaymentPage(),
      );
    },
    MultiPaymentReceiptRoute.name: (routeData) {
      return _i168.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i100.MultiPaymentReceiptPage(),
      );
    },
    MultiPaymentSuccessRoute.name: (routeData) {
      return _i168.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i101.MultiPaymentSuccessPage(),
      );
    },
    MultiSearchResultRoute.name: (routeData) {
      return _i168.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i102.MultiSearchResultPage(),
      );
    },
    MultiSelectSeatOneRoute.name: (routeData) {
      return _i168.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i103.MultiSelectSeatOnePage(),
      );
    },
    MultiSelectSeatThreeRoute.name: (routeData) {
      return _i168.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i104.MultiSelectSeatThreePage(),
      );
    },
    MultiSelectSeatTwoRoute.name: (routeData) {
      return _i168.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i105.MultiSelectSeatTwoPage(),
      );
    },
    MultiTripRoute.name: (routeData) {
      return _i168.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i106.MultiTripPage(),
      );
    },
    MyCardsRoute.name: (routeData) {
      return _i168.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i107.MyCardsPage(),
      );
    },
    NotificationRoute.name: (routeData) {
      return _i168.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i108.NotificationPage(),
      );
    },
    OnboardRoute.name: (routeData) {
      return _i168.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i109.OnboardPage(),
      );
    },
    OneWayTripRoute.name: (routeData) {
      return _i168.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i110.OneWayTripPage(),
      );
    },
    OrderReceiptRoute.name: (routeData) {
      final args = routeData.argsAs<OrderReceiptRouteArgs>();
      return _i168.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i111.OrderReceiptPage(
          key: args.key,
          order: args.order,
        ),
      );
    },
    OrderSuccessfulRoute.name: (routeData) {
      final args = routeData.argsAs<OrderSuccessfulRouteArgs>();
      return _i168.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i112.OrderSuccessfulPage(
          key: args.key,
          order: args.order,
        ),
      );
    },
    PassengerDetailsRoute.name: (routeData) {
      return _i168.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i113.PassengerDetailsPage(),
      );
    },
    PassengerDetailsTwoRoute.name: (routeData) {
      return _i168.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i114.PassengerDetailsTwoPage(),
      );
    },
    PasswordChangedRoute.name: (routeData) {
      return _i168.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i115.PasswordChangedPage(),
      );
    },
    PasswordResetRoute.name: (routeData) {
      return _i168.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i116.PasswordResetPage(),
      );
    },
    PaymentRoute.name: (routeData) {
      return _i168.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i117.PaymentPage(),
      );
    },
    PinResetCompleteRoute.name: (routeData) {
      return _i168.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i118.PinResetCompletePage(),
      );
    },
    PinResetRoute.name: (routeData) {
      return _i168.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i119.PinResetPage(),
      );
    },
    PrivacyRoute.name: (routeData) {
      return _i168.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i120.PrivacyPage(),
      );
    },
    ProfileRoute.name: (routeData) {
      return _i168.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i121.ProfilePage(),
      );
    },
    ReceiptRoute.name: (routeData) {
      return _i168.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i122.ReceiptPage(),
      );
    },
    ReceiveCryptoRoute.name: (routeData) {
      return _i168.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i123.ReceiveCryptoPage(),
      );
    },
    ReferRoute.name: (routeData) {
      return _i168.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i124.ReferPage(),
      );
    },
    RefundDetailsRoute.name: (routeData) {
      return _i168.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i125.RefundDetailsPage(),
      );
    },
    RefundPolicyRoute.name: (routeData) {
      return _i168.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i126.RefundPolicyPage(),
      );
    },
    ReviewDocumentRoute.name: (routeData) {
      return _i168.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i127.ReviewDocumentPage(),
      );
    },
    RoundWayTripRoute.name: (routeData) {
      return _i168.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i128.RoundWayTripPage(),
      );
    },
    SearchCardRoute.name: (routeData) {
      return _i168.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i129.SearchCardPage(),
      );
    },
    SearchResultRoute.name: (routeData) {
      return _i168.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i130.SearchResultPage(),
      );
    },
    SearchResultTwoRoute.name: (routeData) {
      return _i168.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i131.SearchResultTwoPage(),
      );
    },
    SelectAssetRoute.name: (routeData) {
      final args = routeData.argsAs<SelectAssetRouteArgs>(
          orElse: () => const SelectAssetRouteArgs());
      return _i168.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i132.SelectAssetPage(
          key: args.key,
          isForSelling: args.isForSelling,
          isForReceiving: args.isForReceiving,
        ),
      );
    },
    SelectInboundSeatRoute.name: (routeData) {
      return _i168.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i133.SelectInboundSeatPage(),
      );
    },
    SelectOutboundSeatRoute.name: (routeData) {
      return _i168.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i134.SelectOutboundSeatPage(),
      );
    },
    SelectSeatRoute.name: (routeData) {
      return _i168.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i135.SelectSeatPage(),
      );
    },
    SellCryptoRoute.name: (routeData) {
      return _i168.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i136.SellCryptoPage(),
      );
    },
    SellGiftCardFeaturesRoute.name: (routeData) {
      return _i168.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i137.SellGiftCardFeaturesPage(),
      );
    },
    SellGiftCardSuccessRoute.name: (routeData) {
      final args = routeData.argsAs<SellGiftCardSuccessRouteArgs>();
      return _i168.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i138.SellGiftCardSuccessPage(
          key: args.key,
          cardType: args.cardType,
          amountInUSD: args.amountInUSD,
          nairaEquivalent: args.nairaEquivalent,
          sellRate: args.sellRate,
        ),
      );
    },
    SellGiftcardRoute.name: (routeData) {
      final args = routeData.argsAs<SellGiftcardRouteArgs>();
      return _i168.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i139.SellGiftcardPage(
          key: args.key,
          transaction: args.transaction,
        ),
      );
    },
    SetUpFingerprintRoute.name: (routeData) {
      return _i168.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i140.SetUpFingerprintPage(),
      );
    },
    SettingUpFingerprintRoute.name: (routeData) {
      return _i168.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i141.SettingUpFingerprintPage(),
      );
    },
    SettingsRoute.name: (routeData) {
      return _i168.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i142.SettingsPage(),
      );
    },
    ShoppingRoute.name: (routeData) {
      return _i168.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i143.ShoppingPage(),
      );
    },
    SignupRoute.name: (routeData) {
      return _i168.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i144.SignupPage(),
      );
    },
    SplashRoute.name: (routeData) {
      return _i168.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i145.SplashPage(),
      );
    },
    TermsAndConditionRoute.name: (routeData) {
      return _i168.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i146.TermsAndConditionPage(),
      );
    },
    TokenDetailRoute.name: (routeData) {
      final args = routeData.argsAs<TokenDetailRouteArgs>();
      return _i168.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i147.TokenDetailPage(
          key: args.key,
          token: args.token,
        ),
      );
    },
    TrackOrderRoute.name: (routeData) {
      final args = routeData.argsAs<TrackOrderRouteArgs>();
      return _i168.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i148.TrackOrderPage(
          key: args.key,
          orderId: args.orderId,
        ),
      );
    },
    TransactionDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<TransactionDetailsRouteArgs>();
      return _i168.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i149.TransactionDetailsPage(
          key: args.key,
          transaction: args.transaction,
        ),
      );
    },
    TransactionHistoryDetailRoute.name: (routeData) {
      final args = routeData.argsAs<TransactionHistoryDetailRouteArgs>();
      return _i168.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i150.TransactionHistoryDetailPage(
          key: args.key,
          transaction: args.transaction,
        ),
      );
    },
    TransactionHistoryRoute.name: (routeData) {
      return _i168.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i151.TransactionHistoryPage(),
      );
    },
    TransactionLimitRoute.name: (routeData) {
      return _i168.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i152.TransactionLimitPage(),
      );
    },
    TransactionSuccessfulRoute.name: (routeData) {
      final args = routeData.argsAs<TransactionSuccessfulRouteArgs>();
      return _i168.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i153.TransactionSuccessfulPage(
          key: args.key,
          account: args.account,
          amount: args.amount,
        ),
      );
    },
    TransferFundsRoute.name: (routeData) {
      return _i168.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i154.TransferFundsPage(),
      );
    },
    TvCableConfirmRoute.name: (routeData) {
      return _i168.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i155.TvCableConfirmPage(),
      );
    },
    TvCableRoute.name: (routeData) {
      return _i168.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i156.TvCablePage(),
      );
    },
    TvCableReceiptRoute.name: (routeData) {
      return _i168.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i157.TvCableReceiptPage(),
      );
    },
    VerifyCodeRoute.name: (routeData) {
      return _i168.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i158.VerifyCodePage(),
      );
    },
    VerifyEmailOtpRoute.name: (routeData) {
      return _i168.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i159.VerifyEmailOtpPage(),
      );
    },
    VerifyForgotRoute.name: (routeData) {
      final args = routeData.argsAs<VerifyForgotRouteArgs>();
      return _i168.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i160.VerifyForgotPage(
          key: args.key,
          email: args.email,
        ),
      );
    },
    VerifyPasswordDetailRoute.name: (routeData) {
      final args = routeData.argsAs<VerifyPasswordDetailRouteArgs>();
      return _i168.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i161.VerifyPasswordDetailPage(
          key: args.key,
          emailAddress: args.emailAddress,
        ),
      );
    },
    VerifyPhoneRoute.name: (routeData) {
      return _i168.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i162.VerifyPhonePage(),
      );
    },
    VirtualCardRoute.name: (routeData) {
      return _i168.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i163.VirtualCardPage(),
      );
    },
    VirtualCardSuccessRoute.name: (routeData) {
      return _i168.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i164.VirtualCardSuccessPage(),
      );
    },
    WatchlistRoute.name: (routeData) {
      return _i168.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i165.WatchlistPage(),
      );
    },
    YourAssetsRoute.name: (routeData) {
      return _i168.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i166.YourAssetsPage(),
      );
    },
    YourOrderRoute.name: (routeData) {
      return _i168.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i167.YourOrderPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.ActiveFlightPage]
class ActiveFlightRoute extends _i168.PageRouteInfo<void> {
  const ActiveFlightRoute({List<_i168.PageRouteInfo>? children})
      : super(
          ActiveFlightRoute.name,
          initialChildren: children,
        );

  static const String name = 'ActiveFlightRoute';

  static const _i168.PageInfo<void> page = _i168.PageInfo<void>(name);
}

/// generated route for
/// [_i2.AddDollarCardPage]
class AddDollarCardRoute extends _i168.PageRouteInfo<void> {
  const AddDollarCardRoute({List<_i168.PageRouteInfo>? children})
      : super(
          AddDollarCardRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddDollarCardRoute';

  static const _i168.PageInfo<void> page = _i168.PageInfo<void>(name);
}

/// generated route for
/// [_i3.AirtimeConfirmPage]
class AirtimeConfirmRoute extends _i168.PageRouteInfo<void> {
  const AirtimeConfirmRoute({List<_i168.PageRouteInfo>? children})
      : super(
          AirtimeConfirmRoute.name,
          initialChildren: children,
        );

  static const String name = 'AirtimeConfirmRoute';

  static const _i168.PageInfo<void> page = _i168.PageInfo<void>(name);
}

/// generated route for
/// [_i4.AirtimePage]
class AirtimeRoute extends _i168.PageRouteInfo<void> {
  const AirtimeRoute({List<_i168.PageRouteInfo>? children})
      : super(
          AirtimeRoute.name,
          initialChildren: children,
        );

  static const String name = 'AirtimeRoute';

  static const _i168.PageInfo<void> page = _i168.PageInfo<void>(name);
}

/// generated route for
/// [_i5.AirtimeReceiptPage]
class AirtimeReceiptRoute extends _i168.PageRouteInfo<void> {
  const AirtimeReceiptRoute({List<_i168.PageRouteInfo>? children})
      : super(
          AirtimeReceiptRoute.name,
          initialChildren: children,
        );

  static const String name = 'AirtimeReceiptRoute';

  static const _i168.PageInfo<void> page = _i168.PageInfo<void>(name);
}

/// generated route for
/// [_i6.AllTokensPage]
class AllTokensRoute extends _i168.PageRouteInfo<void> {
  const AllTokensRoute({List<_i168.PageRouteInfo>? children})
      : super(
          AllTokensRoute.name,
          initialChildren: children,
        );

  static const String name = 'AllTokensRoute';

  static const _i168.PageInfo<void> page = _i168.PageInfo<void>(name);
}

/// generated route for
/// [_i7.AmountAndInfoPage]
class AmountAndInfoRoute extends _i168.PageRouteInfo<AmountAndInfoRouteArgs> {
  AmountAndInfoRoute({
    _i169.Key? key,
    required _i170.BankAccountEntity account,
    List<_i168.PageRouteInfo>? children,
  }) : super(
          AmountAndInfoRoute.name,
          args: AmountAndInfoRouteArgs(
            key: key,
            account: account,
          ),
          initialChildren: children,
        );

  static const String name = 'AmountAndInfoRoute';

  static const _i168.PageInfo<AmountAndInfoRouteArgs> page =
      _i168.PageInfo<AmountAndInfoRouteArgs>(name);
}

class AmountAndInfoRouteArgs {
  const AmountAndInfoRouteArgs({
    this.key,
    required this.account,
  });

  final _i169.Key? key;

  final _i170.BankAccountEntity account;

  @override
  String toString() {
    return 'AmountAndInfoRouteArgs{key: $key, account: $account}';
  }
}

/// generated route for
/// [_i8.AssetsPage]
class AssetsRoute extends _i168.PageRouteInfo<void> {
  const AssetsRoute({List<_i168.PageRouteInfo>? children})
      : super(
          AssetsRoute.name,
          initialChildren: children,
        );

  static const String name = 'AssetsRoute';

  static const _i168.PageInfo<void> page = _i168.PageInfo<void>(name);
}

/// generated route for
/// [_i9.BaggagePage]
class BaggageRoute extends _i168.PageRouteInfo<void> {
  const BaggageRoute({List<_i168.PageRouteInfo>? children})
      : super(
          BaggageRoute.name,
          initialChildren: children,
        );

  static const String name = 'BaggageRoute';

  static const _i168.PageInfo<void> page = _i168.PageInfo<void>(name);
}

/// generated route for
/// [_i10.BankAccountPage]
class BankAccountRoute extends _i168.PageRouteInfo<void> {
  const BankAccountRoute({List<_i168.PageRouteInfo>? children})
      : super(
          BankAccountRoute.name,
          initialChildren: children,
        );

  static const String name = 'BankAccountRoute';

  static const _i168.PageInfo<void> page = _i168.PageInfo<void>(name);
}

/// generated route for
/// [_i11.BetConfirmPage]
class BetConfirmRoute extends _i168.PageRouteInfo<void> {
  const BetConfirmRoute({List<_i168.PageRouteInfo>? children})
      : super(
          BetConfirmRoute.name,
          initialChildren: children,
        );

  static const String name = 'BetConfirmRoute';

  static const _i168.PageInfo<void> page = _i168.PageInfo<void>(name);
}

/// generated route for
/// [_i12.BetPage]
class BetRoute extends _i168.PageRouteInfo<void> {
  const BetRoute({List<_i168.PageRouteInfo>? children})
      : super(
          BetRoute.name,
          initialChildren: children,
        );

  static const String name = 'BetRoute';

  static const _i168.PageInfo<void> page = _i168.PageInfo<void>(name);
}

/// generated route for
/// [_i13.BettingReceiptPage]
class BettingReceiptRoute extends _i168.PageRouteInfo<void> {
  const BettingReceiptRoute({List<_i168.PageRouteInfo>? children})
      : super(
          BettingReceiptRoute.name,
          initialChildren: children,
        );

  static const String name = 'BettingReceiptRoute';

  static const _i168.PageInfo<void> page = _i168.PageInfo<void>(name);
}

/// generated route for
/// [_i14.BillConfirmPage]
class BillConfirmRoute extends _i168.PageRouteInfo<BillConfirmRouteArgs> {
  BillConfirmRoute({
    _i169.Key? key,
    required _i171.BillConfirmArgs args,
    List<_i168.PageRouteInfo>? children,
  }) : super(
          BillConfirmRoute.name,
          args: BillConfirmRouteArgs(
            key: key,
            args: args,
          ),
          initialChildren: children,
        );

  static const String name = 'BillConfirmRoute';

  static const _i168.PageInfo<BillConfirmRouteArgs> page =
      _i168.PageInfo<BillConfirmRouteArgs>(name);
}

class BillConfirmRouteArgs {
  const BillConfirmRouteArgs({
    this.key,
    required this.args,
  });

  final _i169.Key? key;

  final _i171.BillConfirmArgs args;

  @override
  String toString() {
    return 'BillConfirmRouteArgs{key: $key, args: $args}';
  }
}

/// generated route for
/// [_i15.BillReceiptPage]
class BillReceiptRoute extends _i168.PageRouteInfo<BillReceiptRouteArgs> {
  BillReceiptRoute({
    _i169.Key? key,
    required _i171.BillConfirmArgs args,
    required String reference,
    required double fee,
    required DateTime purchasedAt,
    List<_i168.PageRouteInfo>? children,
  }) : super(
          BillReceiptRoute.name,
          args: BillReceiptRouteArgs(
            key: key,
            args: args,
            reference: reference,
            fee: fee,
            purchasedAt: purchasedAt,
          ),
          initialChildren: children,
        );

  static const String name = 'BillReceiptRoute';

  static const _i168.PageInfo<BillReceiptRouteArgs> page =
      _i168.PageInfo<BillReceiptRouteArgs>(name);
}

class BillReceiptRouteArgs {
  const BillReceiptRouteArgs({
    this.key,
    required this.args,
    required this.reference,
    required this.fee,
    required this.purchasedAt,
  });

  final _i169.Key? key;

  final _i171.BillConfirmArgs args;

  final String reference;

  final double fee;

  final DateTime purchasedAt;

  @override
  String toString() {
    return 'BillReceiptRouteArgs{key: $key, args: $args, reference: $reference, fee: $fee, purchasedAt: $purchasedAt}';
  }
}

/// generated route for
/// [_i16.BillSuccessPage]
class BillSuccessRoute extends _i168.PageRouteInfo<BillSuccessRouteArgs> {
  BillSuccessRoute({
    _i169.Key? key,
    required _i171.BillType billType,
    required String amount,
    required _i172.BillerEntity biller,
    required _i171.BillConfirmArgs args,
    required String reference,
    required double fee,
    required DateTime purchasedAt,
    List<_i168.PageRouteInfo>? children,
  }) : super(
          BillSuccessRoute.name,
          args: BillSuccessRouteArgs(
            key: key,
            billType: billType,
            amount: amount,
            biller: biller,
            args: args,
            reference: reference,
            fee: fee,
            purchasedAt: purchasedAt,
          ),
          initialChildren: children,
        );

  static const String name = 'BillSuccessRoute';

  static const _i168.PageInfo<BillSuccessRouteArgs> page =
      _i168.PageInfo<BillSuccessRouteArgs>(name);
}

class BillSuccessRouteArgs {
  const BillSuccessRouteArgs({
    this.key,
    required this.billType,
    required this.amount,
    required this.biller,
    required this.args,
    required this.reference,
    required this.fee,
    required this.purchasedAt,
  });

  final _i169.Key? key;

  final _i171.BillType billType;

  final String amount;

  final _i172.BillerEntity biller;

  final _i171.BillConfirmArgs args;

  final String reference;

  final double fee;

  final DateTime purchasedAt;

  @override
  String toString() {
    return 'BillSuccessRouteArgs{key: $key, billType: $billType, amount: $amount, biller: $biller, args: $args, reference: $reference, fee: $fee, purchasedAt: $purchasedAt}';
  }
}

/// generated route for
/// [_i17.BillsPage]
class BillsRoute extends _i168.PageRouteInfo<void> {
  const BillsRoute({List<_i168.PageRouteInfo>? children})
      : super(
          BillsRoute.name,
          initialChildren: children,
        );

  static const String name = 'BillsRoute';

  static const _i168.PageInfo<void> page = _i168.PageInfo<void>(name);
}

/// generated route for
/// [_i18.BoardingPassDetailsPage]
class BoardingPassDetailsRoute extends _i168.PageRouteInfo<void> {
  const BoardingPassDetailsRoute({List<_i168.PageRouteInfo>? children})
      : super(
          BoardingPassDetailsRoute.name,
          initialChildren: children,
        );

  static const String name = 'BoardingPassDetailsRoute';

  static const _i168.PageInfo<void> page = _i168.PageInfo<void>(name);
}

/// generated route for
/// [_i19.BoardingPassPage]
class BoardingPassRoute extends _i168.PageRouteInfo<BoardingPassRouteArgs> {
  BoardingPassRoute({
    _i169.Key? key,
    String? bookingReference,
    List<_i168.PageRouteInfo>? children,
  }) : super(
          BoardingPassRoute.name,
          args: BoardingPassRouteArgs(
            key: key,
            bookingReference: bookingReference,
          ),
          initialChildren: children,
        );

  static const String name = 'BoardingPassRoute';

  static const _i168.PageInfo<BoardingPassRouteArgs> page =
      _i168.PageInfo<BoardingPassRouteArgs>(name);
}

class BoardingPassRouteArgs {
  const BoardingPassRouteArgs({
    this.key,
    this.bookingReference,
  });

  final _i169.Key? key;

  final String? bookingReference;

  @override
  String toString() {
    return 'BoardingPassRouteArgs{key: $key, bookingReference: $bookingReference}';
  }
}

/// generated route for
/// [_i20.BookedFlightsPage]
class BookedFlightsRoute extends _i168.PageRouteInfo<void> {
  const BookedFlightsRoute({List<_i168.PageRouteInfo>? children})
      : super(
          BookedFlightsRoute.name,
          initialChildren: children,
        );

  static const String name = 'BookedFlightsRoute';

  static const _i168.PageInfo<void> page = _i168.PageInfo<void>(name);
}

/// generated route for
/// [_i21.BookingPoliciesPage]
class BookingPoliciesRoute extends _i168.PageRouteInfo<void> {
  const BookingPoliciesRoute({List<_i168.PageRouteInfo>? children})
      : super(
          BookingPoliciesRoute.name,
          initialChildren: children,
        );

  static const String name = 'BookingPoliciesRoute';

  static const _i168.PageInfo<void> page = _i168.PageInfo<void>(name);
}

/// generated route for
/// [_i22.BuyCryptoPage]
class BuyCryptoRoute extends _i168.PageRouteInfo<void> {
  const BuyCryptoRoute({List<_i168.PageRouteInfo>? children})
      : super(
          BuyCryptoRoute.name,
          initialChildren: children,
        );

  static const String name = 'BuyCryptoRoute';

  static const _i168.PageInfo<void> page = _i168.PageInfo<void>(name);
}

/// generated route for
/// [_i23.BuyGiftCardFeaturesPage]
class BuyGiftCardFeaturesRoute extends _i168.PageRouteInfo<void> {
  const BuyGiftCardFeaturesRoute({List<_i168.PageRouteInfo>? children})
      : super(
          BuyGiftCardFeaturesRoute.name,
          initialChildren: children,
        );

  static const String name = 'BuyGiftCardFeaturesRoute';

  static const _i168.PageInfo<void> page = _i168.PageInfo<void>(name);
}

/// generated route for
/// [_i24.BuyGiftcardPage]
class BuyGiftcardRoute extends _i168.PageRouteInfo<BuyGiftcardRouteArgs> {
  BuyGiftcardRoute({
    _i169.Key? key,
    required _i173.TransactionEntity transaction,
    List<_i168.PageRouteInfo>? children,
  }) : super(
          BuyGiftcardRoute.name,
          args: BuyGiftcardRouteArgs(
            key: key,
            transaction: transaction,
          ),
          initialChildren: children,
        );

  static const String name = 'BuyGiftcardRoute';

  static const _i168.PageInfo<BuyGiftcardRouteArgs> page =
      _i168.PageInfo<BuyGiftcardRouteArgs>(name);
}

class BuyGiftcardRouteArgs {
  const BuyGiftcardRouteArgs({
    this.key,
    required this.transaction,
  });

  final _i169.Key? key;

  final _i173.TransactionEntity transaction;

  @override
  String toString() {
    return 'BuyGiftcardRouteArgs{key: $key, transaction: $transaction}';
  }
}

/// generated route for
/// [_i25.BvnFaceRecogPage]
class BvnFaceRecogRoute extends _i168.PageRouteInfo<void> {
  const BvnFaceRecogRoute({List<_i168.PageRouteInfo>? children})
      : super(
          BvnFaceRecogRoute.name,
          initialChildren: children,
        );

  static const String name = 'BvnFaceRecogRoute';

  static const _i168.PageInfo<void> page = _i168.PageInfo<void>(name);
}

/// generated route for
/// [_i26.BvnVerificationPage]
class BvnVerificationRoute extends _i168.PageRouteInfo<void> {
  const BvnVerificationRoute({List<_i168.PageRouteInfo>? children})
      : super(
          BvnVerificationRoute.name,
          initialChildren: children,
        );

  static const String name = 'BvnVerificationRoute';

  static const _i168.PageInfo<void> page = _i168.PageInfo<void>(name);
}

/// generated route for
/// [_i27.BvnconfirmPage]
class BvnconfirmRoute extends _i168.PageRouteInfo<void> {
  const BvnconfirmRoute({List<_i168.PageRouteInfo>? children})
      : super(
          BvnconfirmRoute.name,
          initialChildren: children,
        );

  static const String name = 'BvnconfirmRoute';

  static const _i168.PageInfo<void> page = _i168.PageInfo<void>(name);
}

/// generated route for
/// [_i28.CancelFlightPage]
class CancelFlightRoute extends _i168.PageRouteInfo<void> {
  const CancelFlightRoute({List<_i168.PageRouteInfo>? children})
      : super(
          CancelFlightRoute.name,
          initialChildren: children,
        );

  static const String name = 'CancelFlightRoute';

  static const _i168.PageInfo<void> page = _i168.PageInfo<void>(name);
}

/// generated route for
/// [_i29.CancelFlightSuccessfulPage]
class CancelFlightSuccessfulRoute extends _i168.PageRouteInfo<void> {
  const CancelFlightSuccessfulRoute({List<_i168.PageRouteInfo>? children})
      : super(
          CancelFlightSuccessfulRoute.name,
          initialChildren: children,
        );

  static const String name = 'CancelFlightSuccessfulRoute';

  static const _i168.PageInfo<void> page = _i168.PageInfo<void>(name);
}

/// generated route for
/// [_i30.CardLimitPage]
class CardLimitRoute extends _i168.PageRouteInfo<void> {
  const CardLimitRoute({List<_i168.PageRouteInfo>? children})
      : super(
          CardLimitRoute.name,
          initialChildren: children,
        );

  static const String name = 'CardLimitRoute';

  static const _i168.PageInfo<void> page = _i168.PageInfo<void>(name);
}

/// generated route for
/// [_i31.CardPage]
class CardRoute extends _i168.PageRouteInfo<CardRouteArgs> {
  CardRoute({
    _i169.Key? key,
    required _i174.DollarCardEntity card,
    List<_i168.PageRouteInfo>? children,
  }) : super(
          CardRoute.name,
          args: CardRouteArgs(
            key: key,
            card: card,
          ),
          initialChildren: children,
        );

  static const String name = 'CardRoute';

  static const _i168.PageInfo<CardRouteArgs> page =
      _i168.PageInfo<CardRouteArgs>(name);
}

class CardRouteArgs {
  const CardRouteArgs({
    this.key,
    required this.card,
  });

  final _i169.Key? key;

  final _i174.DollarCardEntity card;

  @override
  String toString() {
    return 'CardRouteArgs{key: $key, card: $card}';
  }
}

/// generated route for
/// [_i32.CardTransactionPage]
class CardTransactionRoute
    extends _i168.PageRouteInfo<CardTransactionRouteArgs> {
  CardTransactionRoute({
    _i169.Key? key,
    required _i174.DollarCardEntity card,
    List<_i168.PageRouteInfo>? children,
  }) : super(
          CardTransactionRoute.name,
          args: CardTransactionRouteArgs(
            key: key,
            card: card,
          ),
          initialChildren: children,
        );

  static const String name = 'CardTransactionRoute';

  static const _i168.PageInfo<CardTransactionRouteArgs> page =
      _i168.PageInfo<CardTransactionRouteArgs>(name);
}

class CardTransactionRouteArgs {
  const CardTransactionRouteArgs({
    this.key,
    required this.card,
  });

  final _i169.Key? key;

  final _i174.DollarCardEntity card;

  @override
  String toString() {
    return 'CardTransactionRouteArgs{key: $key, card: $card}';
  }
}

/// generated route for
/// [_i33.ChangePasswordPage]
class ChangePasswordRoute extends _i168.PageRouteInfo<void> {
  const ChangePasswordRoute({List<_i168.PageRouteInfo>? children})
      : super(
          ChangePasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'ChangePasswordRoute';

  static const _i168.PageInfo<void> page = _i168.PageInfo<void>(name);
}

/// generated route for
/// [_i34.CheckOutPage]
class CheckOutRoute extends _i168.PageRouteInfo<void> {
  const CheckOutRoute({List<_i168.PageRouteInfo>? children})
      : super(
          CheckOutRoute.name,
          initialChildren: children,
        );

  static const String name = 'CheckOutRoute';

  static const _i168.PageInfo<void> page = _i168.PageInfo<void>(name);
}

/// generated route for
/// [_i35.ClothsDetailsPage]
class ClothsDetailsRoute extends _i168.PageRouteInfo<ClothsDetailsRouteArgs> {
  ClothsDetailsRoute({
    _i169.Key? key,
    required String productId,
    List<_i168.PageRouteInfo>? children,
  }) : super(
          ClothsDetailsRoute.name,
          args: ClothsDetailsRouteArgs(
            key: key,
            productId: productId,
          ),
          initialChildren: children,
        );

  static const String name = 'ClothsDetailsRoute';

  static const _i168.PageInfo<ClothsDetailsRouteArgs> page =
      _i168.PageInfo<ClothsDetailsRouteArgs>(name);
}

class ClothsDetailsRouteArgs {
  const ClothsDetailsRouteArgs({
    this.key,
    required this.productId,
  });

  final _i169.Key? key;

  final String productId;

  @override
  String toString() {
    return 'ClothsDetailsRouteArgs{key: $key, productId: $productId}';
  }
}

/// generated route for
/// [_i36.ClothsPage]
class ClothsRoute extends _i168.PageRouteInfo<void> {
  const ClothsRoute({List<_i168.PageRouteInfo>? children})
      : super(
          ClothsRoute.name,
          initialChildren: children,
        );

  static const String name = 'ClothsRoute';

  static const _i168.PageInfo<void> page = _i168.PageInfo<void>(name);
}

/// generated route for
/// [_i37.ConfirmBuyPage]
class ConfirmBuyRoute extends _i168.PageRouteInfo<ConfirmBuyRouteArgs> {
  ConfirmBuyRoute({
    _i169.Key? key,
    required _i175.CryptoRateEntity rate,
    required _i175.CryptoWalletEntity wallet,
    required double nairaAmount,
    required double cryptoAmount,
    List<_i168.PageRouteInfo>? children,
  }) : super(
          ConfirmBuyRoute.name,
          args: ConfirmBuyRouteArgs(
            key: key,
            rate: rate,
            wallet: wallet,
            nairaAmount: nairaAmount,
            cryptoAmount: cryptoAmount,
          ),
          initialChildren: children,
        );

  static const String name = 'ConfirmBuyRoute';

  static const _i168.PageInfo<ConfirmBuyRouteArgs> page =
      _i168.PageInfo<ConfirmBuyRouteArgs>(name);
}

class ConfirmBuyRouteArgs {
  const ConfirmBuyRouteArgs({
    this.key,
    required this.rate,
    required this.wallet,
    required this.nairaAmount,
    required this.cryptoAmount,
  });

  final _i169.Key? key;

  final _i175.CryptoRateEntity rate;

  final _i175.CryptoWalletEntity wallet;

  final double nairaAmount;

  final double cryptoAmount;

  @override
  String toString() {
    return 'ConfirmBuyRouteArgs{key: $key, rate: $rate, wallet: $wallet, nairaAmount: $nairaAmount, cryptoAmount: $cryptoAmount}';
  }
}

/// generated route for
/// [_i38.ConfirmGiftCardSellPage]
class ConfirmGiftCardSellRoute
    extends _i168.PageRouteInfo<ConfirmGiftCardSellRouteArgs> {
  ConfirmGiftCardSellRoute({
    _i169.Key? key,
    required String cardType,
    required String logoUrl,
    _i176.GiftcardSubcategoryEntity? subcategory,
    required String country,
    required double amount,
    required double nairaEquivalent,
    required double sellRate,
    String? ecode,
    required List<_i177.XFile> cardImages,
    List<_i168.PageRouteInfo>? children,
  }) : super(
          ConfirmGiftCardSellRoute.name,
          args: ConfirmGiftCardSellRouteArgs(
            key: key,
            cardType: cardType,
            logoUrl: logoUrl,
            subcategory: subcategory,
            country: country,
            amount: amount,
            nairaEquivalent: nairaEquivalent,
            sellRate: sellRate,
            ecode: ecode,
            cardImages: cardImages,
          ),
          initialChildren: children,
        );

  static const String name = 'ConfirmGiftCardSellRoute';

  static const _i168.PageInfo<ConfirmGiftCardSellRouteArgs> page =
      _i168.PageInfo<ConfirmGiftCardSellRouteArgs>(name);
}

class ConfirmGiftCardSellRouteArgs {
  const ConfirmGiftCardSellRouteArgs({
    this.key,
    required this.cardType,
    required this.logoUrl,
    this.subcategory,
    required this.country,
    required this.amount,
    required this.nairaEquivalent,
    required this.sellRate,
    this.ecode,
    required this.cardImages,
  });

  final _i169.Key? key;

  final String cardType;

  final String logoUrl;

  final _i176.GiftcardSubcategoryEntity? subcategory;

  final String country;

  final double amount;

  final double nairaEquivalent;

  final double sellRate;

  final String? ecode;

  final List<_i177.XFile> cardImages;

  @override
  String toString() {
    return 'ConfirmGiftCardSellRouteArgs{key: $key, cardType: $cardType, logoUrl: $logoUrl, subcategory: $subcategory, country: $country, amount: $amount, nairaEquivalent: $nairaEquivalent, sellRate: $sellRate, ecode: $ecode, cardImages: $cardImages}';
  }
}

/// generated route for
/// [_i39.ConfirmSellPage]
class ConfirmSellRoute extends _i168.PageRouteInfo<ConfirmSellRouteArgs> {
  ConfirmSellRoute({
    _i169.Key? key,
    required _i175.CryptoRateEntity rate,
    required _i175.CryptoWalletEntity wallet,
    required double cryptoAmount,
    required double nairaValue,
    List<_i168.PageRouteInfo>? children,
  }) : super(
          ConfirmSellRoute.name,
          args: ConfirmSellRouteArgs(
            key: key,
            rate: rate,
            wallet: wallet,
            cryptoAmount: cryptoAmount,
            nairaValue: nairaValue,
          ),
          initialChildren: children,
        );

  static const String name = 'ConfirmSellRoute';

  static const _i168.PageInfo<ConfirmSellRouteArgs> page =
      _i168.PageInfo<ConfirmSellRouteArgs>(name);
}

class ConfirmSellRouteArgs {
  const ConfirmSellRouteArgs({
    this.key,
    required this.rate,
    required this.wallet,
    required this.cryptoAmount,
    required this.nairaValue,
  });

  final _i169.Key? key;

  final _i175.CryptoRateEntity rate;

  final _i175.CryptoWalletEntity wallet;

  final double cryptoAmount;

  final double nairaValue;

  @override
  String toString() {
    return 'ConfirmSellRouteArgs{key: $key, rate: $rate, wallet: $wallet, cryptoAmount: $cryptoAmount, nairaValue: $nairaValue}';
  }
}

/// generated route for
/// [_i40.ConfirmTransactionPage]
class ConfirmTransactionRoute
    extends _i168.PageRouteInfo<ConfirmTransactionRouteArgs> {
  ConfirmTransactionRoute({
    _i169.Key? key,
    required _i170.BankAccountEntity account,
    required double amount,
    List<_i168.PageRouteInfo>? children,
  }) : super(
          ConfirmTransactionRoute.name,
          args: ConfirmTransactionRouteArgs(
            key: key,
            account: account,
            amount: amount,
          ),
          initialChildren: children,
        );

  static const String name = 'ConfirmTransactionRoute';

  static const _i168.PageInfo<ConfirmTransactionRouteArgs> page =
      _i168.PageInfo<ConfirmTransactionRouteArgs>(name);
}

class ConfirmTransactionRouteArgs {
  const ConfirmTransactionRouteArgs({
    this.key,
    required this.account,
    required this.amount,
  });

  final _i169.Key? key;

  final _i170.BankAccountEntity account;

  final double amount;

  @override
  String toString() {
    return 'ConfirmTransactionRouteArgs{key: $key, account: $account, amount: $amount}';
  }
}

/// generated route for
/// [_i41.ContactTabPage]
class ContactTabRoute extends _i168.PageRouteInfo<void> {
  const ContactTabRoute({List<_i168.PageRouteInfo>? children})
      : super(
          ContactTabRoute.name,
          initialChildren: children,
        );

  static const String name = 'ContactTabRoute';

  static const _i168.PageInfo<void> page = _i168.PageInfo<void>(name);
}

/// generated route for
/// [_i42.CreatePasswordPage]
class CreatePasswordRoute extends _i168.PageRouteInfo<CreatePasswordRouteArgs> {
  CreatePasswordRoute({
    _i169.Key? key,
    required String fullName,
    required String emailAddress,
    required String phoneNumber,
    String? referralCode,
    List<_i168.PageRouteInfo>? children,
  }) : super(
          CreatePasswordRoute.name,
          args: CreatePasswordRouteArgs(
            key: key,
            fullName: fullName,
            emailAddress: emailAddress,
            phoneNumber: phoneNumber,
            referralCode: referralCode,
          ),
          initialChildren: children,
        );

  static const String name = 'CreatePasswordRoute';

  static const _i168.PageInfo<CreatePasswordRouteArgs> page =
      _i168.PageInfo<CreatePasswordRouteArgs>(name);
}

class CreatePasswordRouteArgs {
  const CreatePasswordRouteArgs({
    this.key,
    required this.fullName,
    required this.emailAddress,
    required this.phoneNumber,
    this.referralCode,
  });

  final _i169.Key? key;

  final String fullName;

  final String emailAddress;

  final String phoneNumber;

  final String? referralCode;

  @override
  String toString() {
    return 'CreatePasswordRouteArgs{key: $key, fullName: $fullName, emailAddress: $emailAddress, phoneNumber: $phoneNumber, referralCode: $referralCode}';
  }
}

/// generated route for
/// [_i43.CreatePinPage]
class CreatePinRoute extends _i168.PageRouteInfo<void> {
  const CreatePinRoute({List<_i168.PageRouteInfo>? children})
      : super(
          CreatePinRoute.name,
          initialChildren: children,
        );

  static const String name = 'CreatePinRoute';

  static const _i168.PageInfo<void> page = _i168.PageInfo<void>(name);
}

/// generated route for
/// [_i44.CreateVirtualCardPage]
class CreateVirtualCardRoute extends _i168.PageRouteInfo<void> {
  const CreateVirtualCardRoute({List<_i168.PageRouteInfo>? children})
      : super(
          CreateVirtualCardRoute.name,
          initialChildren: children,
        );

  static const String name = 'CreateVirtualCardRoute';

  static const _i168.PageInfo<void> page = _i168.PageInfo<void>(name);
}

/// generated route for
/// [_i45.CreatedPinPage]
class CreatedPinRoute extends _i168.PageRouteInfo<void> {
  const CreatedPinRoute({List<_i168.PageRouteInfo>? children})
      : super(
          CreatedPinRoute.name,
          initialChildren: children,
        );

  static const String name = 'CreatedPinRoute';

  static const _i168.PageInfo<void> page = _i168.PageInfo<void>(name);
}

/// generated route for
/// [_i46.CryptoPage]
class CryptoRoute extends _i168.PageRouteInfo<void> {
  const CryptoRoute({List<_i168.PageRouteInfo>? children})
      : super(
          CryptoRoute.name,
          initialChildren: children,
        );

  static const String name = 'CryptoRoute';

  static const _i168.PageInfo<void> page = _i168.PageInfo<void>(name);
}

/// generated route for
/// [_i47.CryptoReceiptPage]
class CryptoReceiptRoute extends _i168.PageRouteInfo<void> {
  const CryptoReceiptRoute({List<_i168.PageRouteInfo>? children})
      : super(
          CryptoReceiptRoute.name,
          initialChildren: children,
        );

  static const String name = 'CryptoReceiptRoute';

  static const _i168.PageInfo<void> page = _i168.PageInfo<void>(name);
}

/// generated route for
/// [_i48.CryptoSellReceiptPage]
class CryptoSellReceiptRoute extends _i168.PageRouteInfo<void> {
  const CryptoSellReceiptRoute({List<_i168.PageRouteInfo>? children})
      : super(
          CryptoSellReceiptRoute.name,
          initialChildren: children,
        );

  static const String name = 'CryptoSellReceiptRoute';

  static const _i168.PageInfo<void> page = _i168.PageInfo<void>(name);
}

/// generated route for
/// [_i49.CryptoSellSuccessfulPage]
class CryptoSellSuccessfulRoute extends _i168.PageRouteInfo<void> {
  const CryptoSellSuccessfulRoute({List<_i168.PageRouteInfo>? children})
      : super(
          CryptoSellSuccessfulRoute.name,
          initialChildren: children,
        );

  static const String name = 'CryptoSellSuccessfulRoute';

  static const _i168.PageInfo<void> page = _i168.PageInfo<void>(name);
}

/// generated route for
/// [_i50.CryptoTransactionPage]
class CryptoTransactionRoute
    extends _i168.PageRouteInfo<CryptoTransactionRouteArgs> {
  CryptoTransactionRoute({
    _i169.Key? key,
    required _i175.CryptoRateEntity rate,
    required _i175.CryptoWalletEntity wallet,
    bool isForSelling = false,
    List<_i168.PageRouteInfo>? children,
  }) : super(
          CryptoTransactionRoute.name,
          args: CryptoTransactionRouteArgs(
            key: key,
            rate: rate,
            wallet: wallet,
            isForSelling: isForSelling,
          ),
          initialChildren: children,
        );

  static const String name = 'CryptoTransactionRoute';

  static const _i168.PageInfo<CryptoTransactionRouteArgs> page =
      _i168.PageInfo<CryptoTransactionRouteArgs>(name);
}

class CryptoTransactionRouteArgs {
  const CryptoTransactionRouteArgs({
    this.key,
    required this.rate,
    required this.wallet,
    this.isForSelling = false,
  });

  final _i169.Key? key;

  final _i175.CryptoRateEntity rate;

  final _i175.CryptoWalletEntity wallet;

  final bool isForSelling;

  @override
  String toString() {
    return 'CryptoTransactionRouteArgs{key: $key, rate: $rate, wallet: $wallet, isForSelling: $isForSelling}';
  }
}

/// generated route for
/// [_i51.CryptoTransactionSuccessfulPage]
class CryptoTransactionSuccessfulRoute
    extends _i168.PageRouteInfo<CryptoTransactionSuccessfulRouteArgs> {
  CryptoTransactionSuccessfulRoute({
    _i169.Key? key,
    required double cryptoAmount,
    required String currency,
    required double nairaAmount,
    required String logoUrl,
    required bool isBuy,
    List<_i168.PageRouteInfo>? children,
  }) : super(
          CryptoTransactionSuccessfulRoute.name,
          args: CryptoTransactionSuccessfulRouteArgs(
            key: key,
            cryptoAmount: cryptoAmount,
            currency: currency,
            nairaAmount: nairaAmount,
            logoUrl: logoUrl,
            isBuy: isBuy,
          ),
          initialChildren: children,
        );

  static const String name = 'CryptoTransactionSuccessfulRoute';

  static const _i168.PageInfo<CryptoTransactionSuccessfulRouteArgs> page =
      _i168.PageInfo<CryptoTransactionSuccessfulRouteArgs>(name);
}

class CryptoTransactionSuccessfulRouteArgs {
  const CryptoTransactionSuccessfulRouteArgs({
    this.key,
    required this.cryptoAmount,
    required this.currency,
    required this.nairaAmount,
    required this.logoUrl,
    required this.isBuy,
  });

  final _i169.Key? key;

  final double cryptoAmount;

  final String currency;

  final double nairaAmount;

  final String logoUrl;

  final bool isBuy;

  @override
  String toString() {
    return 'CryptoTransactionSuccessfulRouteArgs{key: $key, cryptoAmount: $cryptoAmount, currency: $currency, nairaAmount: $nairaAmount, logoUrl: $logoUrl, isBuy: $isBuy}';
  }
}

/// generated route for
/// [_i52.CryptoTransactionsDetailPage]
class CryptoTransactionsDetailRoute
    extends _i168.PageRouteInfo<CryptoTransactionsDetailRouteArgs> {
  CryptoTransactionsDetailRoute({
    _i169.Key? key,
    required _i173.TransactionEntity transaction,
    List<_i168.PageRouteInfo>? children,
  }) : super(
          CryptoTransactionsDetailRoute.name,
          args: CryptoTransactionsDetailRouteArgs(
            key: key,
            transaction: transaction,
          ),
          initialChildren: children,
        );

  static const String name = 'CryptoTransactionsDetailRoute';

  static const _i168.PageInfo<CryptoTransactionsDetailRouteArgs> page =
      _i168.PageInfo<CryptoTransactionsDetailRouteArgs>(name);
}

class CryptoTransactionsDetailRouteArgs {
  const CryptoTransactionsDetailRouteArgs({
    this.key,
    required this.transaction,
  });

  final _i169.Key? key;

  final _i173.TransactionEntity transaction;

  @override
  String toString() {
    return 'CryptoTransactionsDetailRouteArgs{key: $key, transaction: $transaction}';
  }
}

/// generated route for
/// [_i53.CryptoTransactionsHistoryPage]
class CryptoTransactionsHistoryRoute extends _i168.PageRouteInfo<void> {
  const CryptoTransactionsHistoryRoute({List<_i168.PageRouteInfo>? children})
      : super(
          CryptoTransactionsHistoryRoute.name,
          initialChildren: children,
        );

  static const String name = 'CryptoTransactionsHistoryRoute';

  static const _i168.PageInfo<void> page = _i168.PageInfo<void>(name);
}

/// generated route for
/// [_i54.DataConfirmPage]
class DataConfirmRoute extends _i168.PageRouteInfo<void> {
  const DataConfirmRoute({List<_i168.PageRouteInfo>? children})
      : super(
          DataConfirmRoute.name,
          initialChildren: children,
        );

  static const String name = 'DataConfirmRoute';

  static const _i168.PageInfo<void> page = _i168.PageInfo<void>(name);
}

/// generated route for
/// [_i55.DataPage]
class DataRoute extends _i168.PageRouteInfo<void> {
  const DataRoute({List<_i168.PageRouteInfo>? children})
      : super(
          DataRoute.name,
          initialChildren: children,
        );

  static const String name = 'DataRoute';

  static const _i168.PageInfo<void> page = _i168.PageInfo<void>(name);
}

/// generated route for
/// [_i56.DataReceiptPage]
class DataReceiptRoute extends _i168.PageRouteInfo<void> {
  const DataReceiptRoute({List<_i168.PageRouteInfo>? children})
      : super(
          DataReceiptRoute.name,
          initialChildren: children,
        );

  static const String name = 'DataReceiptRoute';

  static const _i168.PageInfo<void> page = _i168.PageInfo<void>(name);
}

/// generated route for
/// [_i57.EditAccountPage]
class EditAccountRoute extends _i168.PageRouteInfo<EditAccountRouteArgs> {
  EditAccountRoute({
    _i169.Key? key,
    _i170.BankAccountEntity? account,
    List<_i168.PageRouteInfo>? children,
  }) : super(
          EditAccountRoute.name,
          args: EditAccountRouteArgs(
            key: key,
            account: account,
          ),
          initialChildren: children,
        );

  static const String name = 'EditAccountRoute';

  static const _i168.PageInfo<EditAccountRouteArgs> page =
      _i168.PageInfo<EditAccountRouteArgs>(name);
}

class EditAccountRouteArgs {
  const EditAccountRouteArgs({
    this.key,
    this.account,
  });

  final _i169.Key? key;

  final _i170.BankAccountEntity? account;

  @override
  String toString() {
    return 'EditAccountRouteArgs{key: $key, account: $account}';
  }
}

/// generated route for
/// [_i58.EditProfilePage]
class EditProfileRoute extends _i168.PageRouteInfo<void> {
  const EditProfileRoute({List<_i168.PageRouteInfo>? children})
      : super(
          EditProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'EditProfileRoute';

  static const _i168.PageInfo<void> page = _i168.PageInfo<void>(name);
}

/// generated route for
/// [_i59.ElectricityConfirmPage]
class ElectricityConfirmRoute extends _i168.PageRouteInfo<void> {
  const ElectricityConfirmRoute({List<_i168.PageRouteInfo>? children})
      : super(
          ElectricityConfirmRoute.name,
          initialChildren: children,
        );

  static const String name = 'ElectricityConfirmRoute';

  static const _i168.PageInfo<void> page = _i168.PageInfo<void>(name);
}

/// generated route for
/// [_i60.ElectricityPage]
class ElectricityRoute extends _i168.PageRouteInfo<void> {
  const ElectricityRoute({List<_i168.PageRouteInfo>? children})
      : super(
          ElectricityRoute.name,
          initialChildren: children,
        );

  static const String name = 'ElectricityRoute';

  static const _i168.PageInfo<void> page = _i168.PageInfo<void>(name);
}

/// generated route for
/// [_i61.ElectricityReceiptPage]
class ElectricityReceiptRoute extends _i168.PageRouteInfo<void> {
  const ElectricityReceiptRoute({List<_i168.PageRouteInfo>? children})
      : super(
          ElectricityReceiptRoute.name,
          initialChildren: children,
        );

  static const String name = 'ElectricityReceiptRoute';

  static const _i168.PageInfo<void> page = _i168.PageInfo<void>(name);
}

/// generated route for
/// [_i62.ExplorePage]
class ExploreRoute extends _i168.PageRouteInfo<void> {
  const ExploreRoute({List<_i168.PageRouteInfo>? children})
      : super(
          ExploreRoute.name,
          initialChildren: children,
        );

  static const String name = 'ExploreRoute';

  static const _i168.PageInfo<void> page = _i168.PageInfo<void>(name);
}

/// generated route for
/// [_i63.FaqTabPage]
class FaqTabRoute extends _i168.PageRouteInfo<void> {
  const FaqTabRoute({List<_i168.PageRouteInfo>? children})
      : super(
          FaqTabRoute.name,
          initialChildren: children,
        );

  static const String name = 'FaqTabRoute';

  static const _i168.PageInfo<void> page = _i168.PageInfo<void>(name);
}

/// generated route for
/// [_i64.FeaturesPage]
class FeaturesRoute extends _i168.PageRouteInfo<void> {
  const FeaturesRoute({List<_i168.PageRouteInfo>? children})
      : super(
          FeaturesRoute.name,
          initialChildren: children,
        );

  static const String name = 'FeaturesRoute';

  static const _i168.PageInfo<void> page = _i168.PageInfo<void>(name);
}

/// generated route for
/// [_i65.FetchWalletProgressPage]
class FetchWalletProgressRoute
    extends _i168.PageRouteInfo<FetchWalletProgressRouteArgs> {
  FetchWalletProgressRoute({
    _i169.Key? key,
    required String currency,
    required String cryptoName,
    required String logoUrl,
    required bool isForSelling,
    required _i175.CryptoRateEntity rate,
    List<_i168.PageRouteInfo>? children,
  }) : super(
          FetchWalletProgressRoute.name,
          args: FetchWalletProgressRouteArgs(
            key: key,
            currency: currency,
            cryptoName: cryptoName,
            logoUrl: logoUrl,
            isForSelling: isForSelling,
            rate: rate,
          ),
          initialChildren: children,
        );

  static const String name = 'FetchWalletProgressRoute';

  static const _i168.PageInfo<FetchWalletProgressRouteArgs> page =
      _i168.PageInfo<FetchWalletProgressRouteArgs>(name);
}

class FetchWalletProgressRouteArgs {
  const FetchWalletProgressRouteArgs({
    this.key,
    required this.currency,
    required this.cryptoName,
    required this.logoUrl,
    required this.isForSelling,
    required this.rate,
  });

  final _i169.Key? key;

  final String currency;

  final String cryptoName;

  final String logoUrl;

  final bool isForSelling;

  final _i175.CryptoRateEntity rate;

  @override
  String toString() {
    return 'FetchWalletProgressRouteArgs{key: $key, currency: $currency, cryptoName: $cryptoName, logoUrl: $logoUrl, isForSelling: $isForSelling, rate: $rate}';
  }
}

/// generated route for
/// [_i66.FingerprintCompletePage]
class FingerprintCompleteRoute extends _i168.PageRouteInfo<void> {
  const FingerprintCompleteRoute({List<_i168.PageRouteInfo>? children})
      : super(
          FingerprintCompleteRoute.name,
          initialChildren: children,
        );

  static const String name = 'FingerprintCompleteRoute';

  static const _i168.PageInfo<void> page = _i168.PageInfo<void>(name);
}

/// generated route for
/// [_i67.FingerprintPage]
class FingerprintRoute extends _i168.PageRouteInfo<void> {
  const FingerprintRoute({List<_i168.PageRouteInfo>? children})
      : super(
          FingerprintRoute.name,
          initialChildren: children,
        );

  static const String name = 'FingerprintRoute';

  static const _i168.PageInfo<void> page = _i168.PageInfo<void>(name);
}

/// generated route for
/// [_i68.FlightBookPage]
class FlightBookRoute extends _i168.PageRouteInfo<void> {
  const FlightBookRoute({List<_i168.PageRouteInfo>? children})
      : super(
          FlightBookRoute.name,
          initialChildren: children,
        );

  static const String name = 'FlightBookRoute';

  static const _i168.PageInfo<void> page = _i168.PageInfo<void>(name);
}

/// generated route for
/// [_i69.FlightBookingPage]
class FlightBookingRoute extends _i168.PageRouteInfo<void> {
  const FlightBookingRoute({List<_i168.PageRouteInfo>? children})
      : super(
          FlightBookingRoute.name,
          initialChildren: children,
        );

  static const String name = 'FlightBookingRoute';

  static const _i168.PageInfo<void> page = _i168.PageInfo<void>(name);
}

/// generated route for
/// [_i70.FlightCardPage]
class FlightCardRoute extends _i168.PageRouteInfo<void> {
  const FlightCardRoute({List<_i168.PageRouteInfo>? children})
      : super(
          FlightCardRoute.name,
          initialChildren: children,
        );

  static const String name = 'FlightCardRoute';

  static const _i168.PageInfo<void> page = _i168.PageInfo<void>(name);
}

/// generated route for
/// [_i71.FlightDetailsPage]
class FlightDetailsRoute extends _i168.PageRouteInfo<void> {
  const FlightDetailsRoute({List<_i168.PageRouteInfo>? children})
      : super(
          FlightDetailsRoute.name,
          initialChildren: children,
        );

  static const String name = 'FlightDetailsRoute';

  static const _i168.PageInfo<void> page = _i168.PageInfo<void>(name);
}

/// generated route for
/// [_i72.FlightDetailsTwoPage]
class FlightDetailsTwoRoute extends _i168.PageRouteInfo<void> {
  const FlightDetailsTwoRoute({List<_i168.PageRouteInfo>? children})
      : super(
          FlightDetailsTwoRoute.name,
          initialChildren: children,
        );

  static const String name = 'FlightDetailsTwoRoute';

  static const _i168.PageInfo<void> page = _i168.PageInfo<void>(name);
}

/// generated route for
/// [_i73.FlightPaymentPage]
class FlightPaymentRoute extends _i168.PageRouteInfo<void> {
  const FlightPaymentRoute({List<_i168.PageRouteInfo>? children})
      : super(
          FlightPaymentRoute.name,
          initialChildren: children,
        );

  static const String name = 'FlightPaymentRoute';

  static const _i168.PageInfo<void> page = _i168.PageInfo<void>(name);
}

/// generated route for
/// [_i74.FlightPaymentReceiptPage]
class FlightPaymentReceiptRoute extends _i168.PageRouteInfo<void> {
  const FlightPaymentReceiptRoute({List<_i168.PageRouteInfo>? children})
      : super(
          FlightPaymentReceiptRoute.name,
          initialChildren: children,
        );

  static const String name = 'FlightPaymentReceiptRoute';

  static const _i168.PageInfo<void> page = _i168.PageInfo<void>(name);
}

/// generated route for
/// [_i75.FlightPaymentSuccessPage]
class FlightPaymentSuccessRoute extends _i168.PageRouteInfo<void> {
  const FlightPaymentSuccessRoute({List<_i168.PageRouteInfo>? children})
      : super(
          FlightPaymentSuccessRoute.name,
          initialChildren: children,
        );

  static const String name = 'FlightPaymentSuccessRoute';

  static const _i168.PageInfo<void> page = _i168.PageInfo<void>(name);
}

/// generated route for
/// [_i76.FlightTwoPaymentPage]
class FlightTwoPaymentRoute extends _i168.PageRouteInfo<void> {
  const FlightTwoPaymentRoute({List<_i168.PageRouteInfo>? children})
      : super(
          FlightTwoPaymentRoute.name,
          initialChildren: children,
        );

  static const String name = 'FlightTwoPaymentRoute';

  static const _i168.PageInfo<void> page = _i168.PageInfo<void>(name);
}

/// generated route for
/// [_i77.FlightTwoPaymentReceiptPage]
class FlightTwoPaymentReceiptRoute extends _i168.PageRouteInfo<void> {
  const FlightTwoPaymentReceiptRoute({List<_i168.PageRouteInfo>? children})
      : super(
          FlightTwoPaymentReceiptRoute.name,
          initialChildren: children,
        );

  static const String name = 'FlightTwoPaymentReceiptRoute';

  static const _i168.PageInfo<void> page = _i168.PageInfo<void>(name);
}

/// generated route for
/// [_i78.FlightTwoPaymentSuccessPage]
class FlightTwoPaymentSuccessRoute extends _i168.PageRouteInfo<void> {
  const FlightTwoPaymentSuccessRoute({List<_i168.PageRouteInfo>? children})
      : super(
          FlightTwoPaymentSuccessRoute.name,
          initialChildren: children,
        );

  static const String name = 'FlightTwoPaymentSuccessRoute';

  static const _i168.PageInfo<void> page = _i168.PageInfo<void>(name);
}

/// generated route for
/// [_i79.ForgotPasswordPage]
class ForgotPasswordRoute extends _i168.PageRouteInfo<void> {
  const ForgotPasswordRoute({List<_i168.PageRouteInfo>? children})
      : super(
          ForgotPasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'ForgotPasswordRoute';

  static const _i168.PageInfo<void> page = _i168.PageInfo<void>(name);
}

/// generated route for
/// [_i80.FundCardPage]
class FundCardRoute extends _i168.PageRouteInfo<FundCardRouteArgs> {
  FundCardRoute({
    _i169.Key? key,
    required _i174.DollarCardEntity card,
    List<_i168.PageRouteInfo>? children,
  }) : super(
          FundCardRoute.name,
          args: FundCardRouteArgs(
            key: key,
            card: card,
          ),
          initialChildren: children,
        );

  static const String name = 'FundCardRoute';

  static const _i168.PageInfo<FundCardRouteArgs> page =
      _i168.PageInfo<FundCardRouteArgs>(name);
}

class FundCardRouteArgs {
  const FundCardRouteArgs({
    this.key,
    required this.card,
  });

  final _i169.Key? key;

  final _i174.DollarCardEntity card;

  @override
  String toString() {
    return 'FundCardRouteArgs{key: $key, card: $card}';
  }
}

/// generated route for
/// [_i81.FundCardReceiptPage]
class FundCardReceiptRoute
    extends _i168.PageRouteInfo<FundCardReceiptRouteArgs> {
  FundCardReceiptRoute({
    _i169.Key? key,
    required double amountUsd,
    required double nairaAmount,
    required double rate,
    required DateTime fundedAt,
    List<_i168.PageRouteInfo>? children,
  }) : super(
          FundCardReceiptRoute.name,
          args: FundCardReceiptRouteArgs(
            key: key,
            amountUsd: amountUsd,
            nairaAmount: nairaAmount,
            rate: rate,
            fundedAt: fundedAt,
          ),
          initialChildren: children,
        );

  static const String name = 'FundCardReceiptRoute';

  static const _i168.PageInfo<FundCardReceiptRouteArgs> page =
      _i168.PageInfo<FundCardReceiptRouteArgs>(name);
}

class FundCardReceiptRouteArgs {
  const FundCardReceiptRouteArgs({
    this.key,
    required this.amountUsd,
    required this.nairaAmount,
    required this.rate,
    required this.fundedAt,
  });

  final _i169.Key? key;

  final double amountUsd;

  final double nairaAmount;

  final double rate;

  final DateTime fundedAt;

  @override
  String toString() {
    return 'FundCardReceiptRouteArgs{key: $key, amountUsd: $amountUsd, nairaAmount: $nairaAmount, rate: $rate, fundedAt: $fundedAt}';
  }
}

/// generated route for
/// [_i82.FundCardSuccessfulPage]
class FundCardSuccessfulRoute
    extends _i168.PageRouteInfo<FundCardSuccessfulRouteArgs> {
  FundCardSuccessfulRoute({
    _i169.Key? key,
    double amountUsd = 0,
    double nairaAmount = 0,
    double rate = 0,
    List<_i168.PageRouteInfo>? children,
  }) : super(
          FundCardSuccessfulRoute.name,
          args: FundCardSuccessfulRouteArgs(
            key: key,
            amountUsd: amountUsd,
            nairaAmount: nairaAmount,
            rate: rate,
          ),
          initialChildren: children,
        );

  static const String name = 'FundCardSuccessfulRoute';

  static const _i168.PageInfo<FundCardSuccessfulRouteArgs> page =
      _i168.PageInfo<FundCardSuccessfulRouteArgs>(name);
}

class FundCardSuccessfulRouteArgs {
  const FundCardSuccessfulRouteArgs({
    this.key,
    this.amountUsd = 0,
    this.nairaAmount = 0,
    this.rate = 0,
  });

  final _i169.Key? key;

  final double amountUsd;

  final double nairaAmount;

  final double rate;

  @override
  String toString() {
    return 'FundCardSuccessfulRouteArgs{key: $key, amountUsd: $amountUsd, nairaAmount: $nairaAmount, rate: $rate}';
  }
}

/// generated route for
/// [_i83.FundWalletPage]
class FundWalletRoute extends _i168.PageRouteInfo<void> {
  const FundWalletRoute({List<_i168.PageRouteInfo>? children})
      : super(
          FundWalletRoute.name,
          initialChildren: children,
        );

  static const String name = 'FundWalletRoute';

  static const _i168.PageInfo<void> page = _i168.PageInfo<void>(name);
}

/// generated route for
/// [_i84.GiftCardBuyReceiptPage]
class GiftCardBuyReceiptRoute
    extends _i168.PageRouteInfo<GiftCardBuyReceiptRouteArgs> {
  GiftCardBuyReceiptRoute({
    _i169.Key? key,
    required String cardType,
    required double amountInNaira,
    required double amountInUSD,
    required String region,
    required double rate,
    required DateTime purchasedAt,
    List<_i168.PageRouteInfo>? children,
  }) : super(
          GiftCardBuyReceiptRoute.name,
          args: GiftCardBuyReceiptRouteArgs(
            key: key,
            cardType: cardType,
            amountInNaira: amountInNaira,
            amountInUSD: amountInUSD,
            region: region,
            rate: rate,
            purchasedAt: purchasedAt,
          ),
          initialChildren: children,
        );

  static const String name = 'GiftCardBuyReceiptRoute';

  static const _i168.PageInfo<GiftCardBuyReceiptRouteArgs> page =
      _i168.PageInfo<GiftCardBuyReceiptRouteArgs>(name);
}

class GiftCardBuyReceiptRouteArgs {
  const GiftCardBuyReceiptRouteArgs({
    this.key,
    required this.cardType,
    required this.amountInNaira,
    required this.amountInUSD,
    required this.region,
    required this.rate,
    required this.purchasedAt,
  });

  final _i169.Key? key;

  final String cardType;

  final double amountInNaira;

  final double amountInUSD;

  final String region;

  final double rate;

  final DateTime purchasedAt;

  @override
  String toString() {
    return 'GiftCardBuyReceiptRouteArgs{key: $key, cardType: $cardType, amountInNaira: $amountInNaira, amountInUSD: $amountInUSD, region: $region, rate: $rate, purchasedAt: $purchasedAt}';
  }
}

/// generated route for
/// [_i85.GiftCardSuccessPage]
class GiftCardSuccessRoute
    extends _i168.PageRouteInfo<GiftCardSuccessRouteArgs> {
  GiftCardSuccessRoute({
    _i169.Key? key,
    required String cardType,
    required double amountInNaira,
    required double amountInUSD,
    required String region,
    required double rate,
    List<_i168.PageRouteInfo>? children,
  }) : super(
          GiftCardSuccessRoute.name,
          args: GiftCardSuccessRouteArgs(
            key: key,
            cardType: cardType,
            amountInNaira: amountInNaira,
            amountInUSD: amountInUSD,
            region: region,
            rate: rate,
          ),
          initialChildren: children,
        );

  static const String name = 'GiftCardSuccessRoute';

  static const _i168.PageInfo<GiftCardSuccessRouteArgs> page =
      _i168.PageInfo<GiftCardSuccessRouteArgs>(name);
}

class GiftCardSuccessRouteArgs {
  const GiftCardSuccessRouteArgs({
    this.key,
    required this.cardType,
    required this.amountInNaira,
    required this.amountInUSD,
    required this.region,
    required this.rate,
  });

  final _i169.Key? key;

  final String cardType;

  final double amountInNaira;

  final double amountInUSD;

  final String region;

  final double rate;

  @override
  String toString() {
    return 'GiftCardSuccessRouteArgs{key: $key, cardType: $cardType, amountInNaira: $amountInNaira, amountInUSD: $amountInUSD, region: $region, rate: $rate}';
  }
}

/// generated route for
/// [_i86.GiftcardPage]
class GiftcardRoute extends _i168.PageRouteInfo<void> {
  const GiftcardRoute({List<_i168.PageRouteInfo>? children})
      : super(
          GiftcardRoute.name,
          initialChildren: children,
        );

  static const String name = 'GiftcardRoute';

  static const _i168.PageInfo<void> page = _i168.PageInfo<void>(name);
}

/// generated route for
/// [_i87.GiftcardSellReceiptPage]
class GiftcardSellReceiptRoute
    extends _i168.PageRouteInfo<GiftcardSellReceiptRouteArgs> {
  GiftcardSellReceiptRoute({
    _i169.Key? key,
    required String cardType,
    required double amountInUSD,
    required double nairaEquivalent,
    required double sellRate,
    required DateTime submittedAt,
    List<_i168.PageRouteInfo>? children,
  }) : super(
          GiftcardSellReceiptRoute.name,
          args: GiftcardSellReceiptRouteArgs(
            key: key,
            cardType: cardType,
            amountInUSD: amountInUSD,
            nairaEquivalent: nairaEquivalent,
            sellRate: sellRate,
            submittedAt: submittedAt,
          ),
          initialChildren: children,
        );

  static const String name = 'GiftcardSellReceiptRoute';

  static const _i168.PageInfo<GiftcardSellReceiptRouteArgs> page =
      _i168.PageInfo<GiftcardSellReceiptRouteArgs>(name);
}

class GiftcardSellReceiptRouteArgs {
  const GiftcardSellReceiptRouteArgs({
    this.key,
    required this.cardType,
    required this.amountInUSD,
    required this.nairaEquivalent,
    required this.sellRate,
    required this.submittedAt,
  });

  final _i169.Key? key;

  final String cardType;

  final double amountInUSD;

  final double nairaEquivalent;

  final double sellRate;

  final DateTime submittedAt;

  @override
  String toString() {
    return 'GiftcardSellReceiptRouteArgs{key: $key, cardType: $cardType, amountInUSD: $amountInUSD, nairaEquivalent: $nairaEquivalent, sellRate: $sellRate, submittedAt: $submittedAt}';
  }
}

/// generated route for
/// [_i88.HelpAndSupportPage]
class HelpAndSupportRoute extends _i168.PageRouteInfo<void> {
  const HelpAndSupportRoute({List<_i168.PageRouteInfo>? children})
      : super(
          HelpAndSupportRoute.name,
          initialChildren: children,
        );

  static const String name = 'HelpAndSupportRoute';

  static const _i168.PageInfo<void> page = _i168.PageInfo<void>(name);
}

/// generated route for
/// [_i89.HomePage]
class HomeRoute extends _i168.PageRouteInfo<void> {
  const HomeRoute({List<_i168.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i168.PageInfo<void> page = _i168.PageInfo<void>(name);
}

/// generated route for
/// [_i90.KycFaceVerificationPage]
class KycFaceVerificationRoute extends _i168.PageRouteInfo<void> {
  const KycFaceVerificationRoute({List<_i168.PageRouteInfo>? children})
      : super(
          KycFaceVerificationRoute.name,
          initialChildren: children,
        );

  static const String name = 'KycFaceVerificationRoute';

  static const _i168.PageInfo<void> page = _i168.PageInfo<void>(name);
}

/// generated route for
/// [_i91.KycVerificationCompletePage]
class KycVerificationCompleteRoute extends _i168.PageRouteInfo<void> {
  const KycVerificationCompleteRoute({List<_i168.PageRouteInfo>? children})
      : super(
          KycVerificationCompleteRoute.name,
          initialChildren: children,
        );

  static const String name = 'KycVerificationCompleteRoute';

  static const _i168.PageInfo<void> page = _i168.PageInfo<void>(name);
}

/// generated route for
/// [_i92.KycVerificationPage]
class KycVerificationRoute extends _i168.PageRouteInfo<void> {
  const KycVerificationRoute({List<_i168.PageRouteInfo>? children})
      : super(
          KycVerificationRoute.name,
          initialChildren: children,
        );

  static const String name = 'KycVerificationRoute';

  static const _i168.PageInfo<void> page = _i168.PageInfo<void>(name);
}

/// generated route for
/// [_i93.LoginPage]
class LoginRoute extends _i168.PageRouteInfo<void> {
  const LoginRoute({List<_i168.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i168.PageInfo<void> page = _i168.PageInfo<void>(name);
}

/// generated route for
/// [_i94.LoginPasswordChangedPage]
class LoginPasswordChangedRoute extends _i168.PageRouteInfo<void> {
  const LoginPasswordChangedRoute({List<_i168.PageRouteInfo>? children})
      : super(
          LoginPasswordChangedRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginPasswordChangedRoute';

  static const _i168.PageInfo<void> page = _i168.PageInfo<void>(name);
}

/// generated route for
/// [_i95.LoginPasswordResetPage]
class LoginPasswordResetRoute
    extends _i168.PageRouteInfo<LoginPasswordResetRouteArgs> {
  LoginPasswordResetRoute({
    _i169.Key? key,
    required String resetToken,
    List<_i168.PageRouteInfo>? children,
  }) : super(
          LoginPasswordResetRoute.name,
          args: LoginPasswordResetRouteArgs(
            key: key,
            resetToken: resetToken,
          ),
          initialChildren: children,
        );

  static const String name = 'LoginPasswordResetRoute';

  static const _i168.PageInfo<LoginPasswordResetRouteArgs> page =
      _i168.PageInfo<LoginPasswordResetRouteArgs>(name);
}

class LoginPasswordResetRouteArgs {
  const LoginPasswordResetRouteArgs({
    this.key,
    required this.resetToken,
  });

  final _i169.Key? key;

  final String resetToken;

  @override
  String toString() {
    return 'LoginPasswordResetRouteArgs{key: $key, resetToken: $resetToken}';
  }
}

/// generated route for
/// [_i96.ManageAssetsPage]
class ManageAssetsRoute extends _i168.PageRouteInfo<void> {
  const ManageAssetsRoute({List<_i168.PageRouteInfo>? children})
      : super(
          ManageAssetsRoute.name,
          initialChildren: children,
        );

  static const String name = 'ManageAssetsRoute';

  static const _i168.PageInfo<void> page = _i168.PageInfo<void>(name);
}

/// generated route for
/// [_i97.MultiFlightDetailsPage]
class MultiFlightDetailsRoute extends _i168.PageRouteInfo<void> {
  const MultiFlightDetailsRoute({List<_i168.PageRouteInfo>? children})
      : super(
          MultiFlightDetailsRoute.name,
          initialChildren: children,
        );

  static const String name = 'MultiFlightDetailsRoute';

  static const _i168.PageInfo<void> page = _i168.PageInfo<void>(name);
}

/// generated route for
/// [_i98.MultiPassengersDetailsPage]
class MultiPassengersDetailsRoute extends _i168.PageRouteInfo<void> {
  const MultiPassengersDetailsRoute({List<_i168.PageRouteInfo>? children})
      : super(
          MultiPassengersDetailsRoute.name,
          initialChildren: children,
        );

  static const String name = 'MultiPassengersDetailsRoute';

  static const _i168.PageInfo<void> page = _i168.PageInfo<void>(name);
}

/// generated route for
/// [_i99.MultiPaymentPage]
class MultiPaymentRoute extends _i168.PageRouteInfo<void> {
  const MultiPaymentRoute({List<_i168.PageRouteInfo>? children})
      : super(
          MultiPaymentRoute.name,
          initialChildren: children,
        );

  static const String name = 'MultiPaymentRoute';

  static const _i168.PageInfo<void> page = _i168.PageInfo<void>(name);
}

/// generated route for
/// [_i100.MultiPaymentReceiptPage]
class MultiPaymentReceiptRoute extends _i168.PageRouteInfo<void> {
  const MultiPaymentReceiptRoute({List<_i168.PageRouteInfo>? children})
      : super(
          MultiPaymentReceiptRoute.name,
          initialChildren: children,
        );

  static const String name = 'MultiPaymentReceiptRoute';

  static const _i168.PageInfo<void> page = _i168.PageInfo<void>(name);
}

/// generated route for
/// [_i101.MultiPaymentSuccessPage]
class MultiPaymentSuccessRoute extends _i168.PageRouteInfo<void> {
  const MultiPaymentSuccessRoute({List<_i168.PageRouteInfo>? children})
      : super(
          MultiPaymentSuccessRoute.name,
          initialChildren: children,
        );

  static const String name = 'MultiPaymentSuccessRoute';

  static const _i168.PageInfo<void> page = _i168.PageInfo<void>(name);
}

/// generated route for
/// [_i102.MultiSearchResultPage]
class MultiSearchResultRoute extends _i168.PageRouteInfo<void> {
  const MultiSearchResultRoute({List<_i168.PageRouteInfo>? children})
      : super(
          MultiSearchResultRoute.name,
          initialChildren: children,
        );

  static const String name = 'MultiSearchResultRoute';

  static const _i168.PageInfo<void> page = _i168.PageInfo<void>(name);
}

/// generated route for
/// [_i103.MultiSelectSeatOnePage]
class MultiSelectSeatOneRoute extends _i168.PageRouteInfo<void> {
  const MultiSelectSeatOneRoute({List<_i168.PageRouteInfo>? children})
      : super(
          MultiSelectSeatOneRoute.name,
          initialChildren: children,
        );

  static const String name = 'MultiSelectSeatOneRoute';

  static const _i168.PageInfo<void> page = _i168.PageInfo<void>(name);
}

/// generated route for
/// [_i104.MultiSelectSeatThreePage]
class MultiSelectSeatThreeRoute extends _i168.PageRouteInfo<void> {
  const MultiSelectSeatThreeRoute({List<_i168.PageRouteInfo>? children})
      : super(
          MultiSelectSeatThreeRoute.name,
          initialChildren: children,
        );

  static const String name = 'MultiSelectSeatThreeRoute';

  static const _i168.PageInfo<void> page = _i168.PageInfo<void>(name);
}

/// generated route for
/// [_i105.MultiSelectSeatTwoPage]
class MultiSelectSeatTwoRoute extends _i168.PageRouteInfo<void> {
  const MultiSelectSeatTwoRoute({List<_i168.PageRouteInfo>? children})
      : super(
          MultiSelectSeatTwoRoute.name,
          initialChildren: children,
        );

  static const String name = 'MultiSelectSeatTwoRoute';

  static const _i168.PageInfo<void> page = _i168.PageInfo<void>(name);
}

/// generated route for
/// [_i106.MultiTripPage]
class MultiTripRoute extends _i168.PageRouteInfo<void> {
  const MultiTripRoute({List<_i168.PageRouteInfo>? children})
      : super(
          MultiTripRoute.name,
          initialChildren: children,
        );

  static const String name = 'MultiTripRoute';

  static const _i168.PageInfo<void> page = _i168.PageInfo<void>(name);
}

/// generated route for
/// [_i107.MyCardsPage]
class MyCardsRoute extends _i168.PageRouteInfo<void> {
  const MyCardsRoute({List<_i168.PageRouteInfo>? children})
      : super(
          MyCardsRoute.name,
          initialChildren: children,
        );

  static const String name = 'MyCardsRoute';

  static const _i168.PageInfo<void> page = _i168.PageInfo<void>(name);
}

/// generated route for
/// [_i108.NotificationPage]
class NotificationRoute extends _i168.PageRouteInfo<void> {
  const NotificationRoute({List<_i168.PageRouteInfo>? children})
      : super(
          NotificationRoute.name,
          initialChildren: children,
        );

  static const String name = 'NotificationRoute';

  static const _i168.PageInfo<void> page = _i168.PageInfo<void>(name);
}

/// generated route for
/// [_i109.OnboardPage]
class OnboardRoute extends _i168.PageRouteInfo<void> {
  const OnboardRoute({List<_i168.PageRouteInfo>? children})
      : super(
          OnboardRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnboardRoute';

  static const _i168.PageInfo<void> page = _i168.PageInfo<void>(name);
}

/// generated route for
/// [_i110.OneWayTripPage]
class OneWayTripRoute extends _i168.PageRouteInfo<void> {
  const OneWayTripRoute({List<_i168.PageRouteInfo>? children})
      : super(
          OneWayTripRoute.name,
          initialChildren: children,
        );

  static const String name = 'OneWayTripRoute';

  static const _i168.PageInfo<void> page = _i168.PageInfo<void>(name);
}

/// generated route for
/// [_i111.OrderReceiptPage]
class OrderReceiptRoute extends _i168.PageRouteInfo<OrderReceiptRouteArgs> {
  OrderReceiptRoute({
    _i169.Key? key,
    required _i178.OrderEntity order,
    List<_i168.PageRouteInfo>? children,
  }) : super(
          OrderReceiptRoute.name,
          args: OrderReceiptRouteArgs(
            key: key,
            order: order,
          ),
          initialChildren: children,
        );

  static const String name = 'OrderReceiptRoute';

  static const _i168.PageInfo<OrderReceiptRouteArgs> page =
      _i168.PageInfo<OrderReceiptRouteArgs>(name);
}

class OrderReceiptRouteArgs {
  const OrderReceiptRouteArgs({
    this.key,
    required this.order,
  });

  final _i169.Key? key;

  final _i178.OrderEntity order;

  @override
  String toString() {
    return 'OrderReceiptRouteArgs{key: $key, order: $order}';
  }
}

/// generated route for
/// [_i112.OrderSuccessfulPage]
class OrderSuccessfulRoute
    extends _i168.PageRouteInfo<OrderSuccessfulRouteArgs> {
  OrderSuccessfulRoute({
    _i169.Key? key,
    required _i178.OrderEntity order,
    List<_i168.PageRouteInfo>? children,
  }) : super(
          OrderSuccessfulRoute.name,
          args: OrderSuccessfulRouteArgs(
            key: key,
            order: order,
          ),
          initialChildren: children,
        );

  static const String name = 'OrderSuccessfulRoute';

  static const _i168.PageInfo<OrderSuccessfulRouteArgs> page =
      _i168.PageInfo<OrderSuccessfulRouteArgs>(name);
}

class OrderSuccessfulRouteArgs {
  const OrderSuccessfulRouteArgs({
    this.key,
    required this.order,
  });

  final _i169.Key? key;

  final _i178.OrderEntity order;

  @override
  String toString() {
    return 'OrderSuccessfulRouteArgs{key: $key, order: $order}';
  }
}

/// generated route for
/// [_i113.PassengerDetailsPage]
class PassengerDetailsRoute extends _i168.PageRouteInfo<void> {
  const PassengerDetailsRoute({List<_i168.PageRouteInfo>? children})
      : super(
          PassengerDetailsRoute.name,
          initialChildren: children,
        );

  static const String name = 'PassengerDetailsRoute';

  static const _i168.PageInfo<void> page = _i168.PageInfo<void>(name);
}

/// generated route for
/// [_i114.PassengerDetailsTwoPage]
class PassengerDetailsTwoRoute extends _i168.PageRouteInfo<void> {
  const PassengerDetailsTwoRoute({List<_i168.PageRouteInfo>? children})
      : super(
          PassengerDetailsTwoRoute.name,
          initialChildren: children,
        );

  static const String name = 'PassengerDetailsTwoRoute';

  static const _i168.PageInfo<void> page = _i168.PageInfo<void>(name);
}

/// generated route for
/// [_i115.PasswordChangedPage]
class PasswordChangedRoute extends _i168.PageRouteInfo<void> {
  const PasswordChangedRoute({List<_i168.PageRouteInfo>? children})
      : super(
          PasswordChangedRoute.name,
          initialChildren: children,
        );

  static const String name = 'PasswordChangedRoute';

  static const _i168.PageInfo<void> page = _i168.PageInfo<void>(name);
}

/// generated route for
/// [_i116.PasswordResetPage]
class PasswordResetRoute extends _i168.PageRouteInfo<void> {
  const PasswordResetRoute({List<_i168.PageRouteInfo>? children})
      : super(
          PasswordResetRoute.name,
          initialChildren: children,
        );

  static const String name = 'PasswordResetRoute';

  static const _i168.PageInfo<void> page = _i168.PageInfo<void>(name);
}

/// generated route for
/// [_i117.PaymentPage]
class PaymentRoute extends _i168.PageRouteInfo<void> {
  const PaymentRoute({List<_i168.PageRouteInfo>? children})
      : super(
          PaymentRoute.name,
          initialChildren: children,
        );

  static const String name = 'PaymentRoute';

  static const _i168.PageInfo<void> page = _i168.PageInfo<void>(name);
}

/// generated route for
/// [_i118.PinResetCompletePage]
class PinResetCompleteRoute extends _i168.PageRouteInfo<void> {
  const PinResetCompleteRoute({List<_i168.PageRouteInfo>? children})
      : super(
          PinResetCompleteRoute.name,
          initialChildren: children,
        );

  static const String name = 'PinResetCompleteRoute';

  static const _i168.PageInfo<void> page = _i168.PageInfo<void>(name);
}

/// generated route for
/// [_i119.PinResetPage]
class PinResetRoute extends _i168.PageRouteInfo<void> {
  const PinResetRoute({List<_i168.PageRouteInfo>? children})
      : super(
          PinResetRoute.name,
          initialChildren: children,
        );

  static const String name = 'PinResetRoute';

  static const _i168.PageInfo<void> page = _i168.PageInfo<void>(name);
}

/// generated route for
/// [_i120.PrivacyPage]
class PrivacyRoute extends _i168.PageRouteInfo<void> {
  const PrivacyRoute({List<_i168.PageRouteInfo>? children})
      : super(
          PrivacyRoute.name,
          initialChildren: children,
        );

  static const String name = 'PrivacyRoute';

  static const _i168.PageInfo<void> page = _i168.PageInfo<void>(name);
}

/// generated route for
/// [_i121.ProfilePage]
class ProfileRoute extends _i168.PageRouteInfo<void> {
  const ProfileRoute({List<_i168.PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const _i168.PageInfo<void> page = _i168.PageInfo<void>(name);
}

/// generated route for
/// [_i122.ReceiptPage]
class ReceiptRoute extends _i168.PageRouteInfo<void> {
  const ReceiptRoute({List<_i168.PageRouteInfo>? children})
      : super(
          ReceiptRoute.name,
          initialChildren: children,
        );

  static const String name = 'ReceiptRoute';

  static const _i168.PageInfo<void> page = _i168.PageInfo<void>(name);
}

/// generated route for
/// [_i123.ReceiveCryptoPage]
class ReceiveCryptoRoute extends _i168.PageRouteInfo<void> {
  const ReceiveCryptoRoute({List<_i168.PageRouteInfo>? children})
      : super(
          ReceiveCryptoRoute.name,
          initialChildren: children,
        );

  static const String name = 'ReceiveCryptoRoute';

  static const _i168.PageInfo<void> page = _i168.PageInfo<void>(name);
}

/// generated route for
/// [_i124.ReferPage]
class ReferRoute extends _i168.PageRouteInfo<void> {
  const ReferRoute({List<_i168.PageRouteInfo>? children})
      : super(
          ReferRoute.name,
          initialChildren: children,
        );

  static const String name = 'ReferRoute';

  static const _i168.PageInfo<void> page = _i168.PageInfo<void>(name);
}

/// generated route for
/// [_i125.RefundDetailsPage]
class RefundDetailsRoute extends _i168.PageRouteInfo<void> {
  const RefundDetailsRoute({List<_i168.PageRouteInfo>? children})
      : super(
          RefundDetailsRoute.name,
          initialChildren: children,
        );

  static const String name = 'RefundDetailsRoute';

  static const _i168.PageInfo<void> page = _i168.PageInfo<void>(name);
}

/// generated route for
/// [_i126.RefundPolicyPage]
class RefundPolicyRoute extends _i168.PageRouteInfo<void> {
  const RefundPolicyRoute({List<_i168.PageRouteInfo>? children})
      : super(
          RefundPolicyRoute.name,
          initialChildren: children,
        );

  static const String name = 'RefundPolicyRoute';

  static const _i168.PageInfo<void> page = _i168.PageInfo<void>(name);
}

/// generated route for
/// [_i127.ReviewDocumentPage]
class ReviewDocumentRoute extends _i168.PageRouteInfo<void> {
  const ReviewDocumentRoute({List<_i168.PageRouteInfo>? children})
      : super(
          ReviewDocumentRoute.name,
          initialChildren: children,
        );

  static const String name = 'ReviewDocumentRoute';

  static const _i168.PageInfo<void> page = _i168.PageInfo<void>(name);
}

/// generated route for
/// [_i128.RoundWayTripPage]
class RoundWayTripRoute extends _i168.PageRouteInfo<void> {
  const RoundWayTripRoute({List<_i168.PageRouteInfo>? children})
      : super(
          RoundWayTripRoute.name,
          initialChildren: children,
        );

  static const String name = 'RoundWayTripRoute';

  static const _i168.PageInfo<void> page = _i168.PageInfo<void>(name);
}

/// generated route for
/// [_i129.SearchCardPage]
class SearchCardRoute extends _i168.PageRouteInfo<void> {
  const SearchCardRoute({List<_i168.PageRouteInfo>? children})
      : super(
          SearchCardRoute.name,
          initialChildren: children,
        );

  static const String name = 'SearchCardRoute';

  static const _i168.PageInfo<void> page = _i168.PageInfo<void>(name);
}

/// generated route for
/// [_i130.SearchResultPage]
class SearchResultRoute extends _i168.PageRouteInfo<void> {
  const SearchResultRoute({List<_i168.PageRouteInfo>? children})
      : super(
          SearchResultRoute.name,
          initialChildren: children,
        );

  static const String name = 'SearchResultRoute';

  static const _i168.PageInfo<void> page = _i168.PageInfo<void>(name);
}

/// generated route for
/// [_i131.SearchResultTwoPage]
class SearchResultTwoRoute extends _i168.PageRouteInfo<void> {
  const SearchResultTwoRoute({List<_i168.PageRouteInfo>? children})
      : super(
          SearchResultTwoRoute.name,
          initialChildren: children,
        );

  static const String name = 'SearchResultTwoRoute';

  static const _i168.PageInfo<void> page = _i168.PageInfo<void>(name);
}

/// generated route for
/// [_i132.SelectAssetPage]
class SelectAssetRoute extends _i168.PageRouteInfo<SelectAssetRouteArgs> {
  SelectAssetRoute({
    _i169.Key? key,
    bool isForSelling = false,
    bool isForReceiving = false,
    List<_i168.PageRouteInfo>? children,
  }) : super(
          SelectAssetRoute.name,
          args: SelectAssetRouteArgs(
            key: key,
            isForSelling: isForSelling,
            isForReceiving: isForReceiving,
          ),
          initialChildren: children,
        );

  static const String name = 'SelectAssetRoute';

  static const _i168.PageInfo<SelectAssetRouteArgs> page =
      _i168.PageInfo<SelectAssetRouteArgs>(name);
}

class SelectAssetRouteArgs {
  const SelectAssetRouteArgs({
    this.key,
    this.isForSelling = false,
    this.isForReceiving = false,
  });

  final _i169.Key? key;

  final bool isForSelling;

  final bool isForReceiving;

  @override
  String toString() {
    return 'SelectAssetRouteArgs{key: $key, isForSelling: $isForSelling, isForReceiving: $isForReceiving}';
  }
}

/// generated route for
/// [_i133.SelectInboundSeatPage]
class SelectInboundSeatRoute extends _i168.PageRouteInfo<void> {
  const SelectInboundSeatRoute({List<_i168.PageRouteInfo>? children})
      : super(
          SelectInboundSeatRoute.name,
          initialChildren: children,
        );

  static const String name = 'SelectInboundSeatRoute';

  static const _i168.PageInfo<void> page = _i168.PageInfo<void>(name);
}

/// generated route for
/// [_i134.SelectOutboundSeatPage]
class SelectOutboundSeatRoute extends _i168.PageRouteInfo<void> {
  const SelectOutboundSeatRoute({List<_i168.PageRouteInfo>? children})
      : super(
          SelectOutboundSeatRoute.name,
          initialChildren: children,
        );

  static const String name = 'SelectOutboundSeatRoute';

  static const _i168.PageInfo<void> page = _i168.PageInfo<void>(name);
}

/// generated route for
/// [_i135.SelectSeatPage]
class SelectSeatRoute extends _i168.PageRouteInfo<void> {
  const SelectSeatRoute({List<_i168.PageRouteInfo>? children})
      : super(
          SelectSeatRoute.name,
          initialChildren: children,
        );

  static const String name = 'SelectSeatRoute';

  static const _i168.PageInfo<void> page = _i168.PageInfo<void>(name);
}

/// generated route for
/// [_i136.SellCryptoPage]
class SellCryptoRoute extends _i168.PageRouteInfo<void> {
  const SellCryptoRoute({List<_i168.PageRouteInfo>? children})
      : super(
          SellCryptoRoute.name,
          initialChildren: children,
        );

  static const String name = 'SellCryptoRoute';

  static const _i168.PageInfo<void> page = _i168.PageInfo<void>(name);
}

/// generated route for
/// [_i137.SellGiftCardFeaturesPage]
class SellGiftCardFeaturesRoute extends _i168.PageRouteInfo<void> {
  const SellGiftCardFeaturesRoute({List<_i168.PageRouteInfo>? children})
      : super(
          SellGiftCardFeaturesRoute.name,
          initialChildren: children,
        );

  static const String name = 'SellGiftCardFeaturesRoute';

  static const _i168.PageInfo<void> page = _i168.PageInfo<void>(name);
}

/// generated route for
/// [_i138.SellGiftCardSuccessPage]
class SellGiftCardSuccessRoute
    extends _i168.PageRouteInfo<SellGiftCardSuccessRouteArgs> {
  SellGiftCardSuccessRoute({
    _i169.Key? key,
    required String cardType,
    required double amountInUSD,
    required double nairaEquivalent,
    required double sellRate,
    List<_i168.PageRouteInfo>? children,
  }) : super(
          SellGiftCardSuccessRoute.name,
          args: SellGiftCardSuccessRouteArgs(
            key: key,
            cardType: cardType,
            amountInUSD: amountInUSD,
            nairaEquivalent: nairaEquivalent,
            sellRate: sellRate,
          ),
          initialChildren: children,
        );

  static const String name = 'SellGiftCardSuccessRoute';

  static const _i168.PageInfo<SellGiftCardSuccessRouteArgs> page =
      _i168.PageInfo<SellGiftCardSuccessRouteArgs>(name);
}

class SellGiftCardSuccessRouteArgs {
  const SellGiftCardSuccessRouteArgs({
    this.key,
    required this.cardType,
    required this.amountInUSD,
    required this.nairaEquivalent,
    required this.sellRate,
  });

  final _i169.Key? key;

  final String cardType;

  final double amountInUSD;

  final double nairaEquivalent;

  final double sellRate;

  @override
  String toString() {
    return 'SellGiftCardSuccessRouteArgs{key: $key, cardType: $cardType, amountInUSD: $amountInUSD, nairaEquivalent: $nairaEquivalent, sellRate: $sellRate}';
  }
}

/// generated route for
/// [_i139.SellGiftcardPage]
class SellGiftcardRoute extends _i168.PageRouteInfo<SellGiftcardRouteArgs> {
  SellGiftcardRoute({
    _i169.Key? key,
    required _i173.TransactionEntity transaction,
    List<_i168.PageRouteInfo>? children,
  }) : super(
          SellGiftcardRoute.name,
          args: SellGiftcardRouteArgs(
            key: key,
            transaction: transaction,
          ),
          initialChildren: children,
        );

  static const String name = 'SellGiftcardRoute';

  static const _i168.PageInfo<SellGiftcardRouteArgs> page =
      _i168.PageInfo<SellGiftcardRouteArgs>(name);
}

class SellGiftcardRouteArgs {
  const SellGiftcardRouteArgs({
    this.key,
    required this.transaction,
  });

  final _i169.Key? key;

  final _i173.TransactionEntity transaction;

  @override
  String toString() {
    return 'SellGiftcardRouteArgs{key: $key, transaction: $transaction}';
  }
}

/// generated route for
/// [_i140.SetUpFingerprintPage]
class SetUpFingerprintRoute extends _i168.PageRouteInfo<void> {
  const SetUpFingerprintRoute({List<_i168.PageRouteInfo>? children})
      : super(
          SetUpFingerprintRoute.name,
          initialChildren: children,
        );

  static const String name = 'SetUpFingerprintRoute';

  static const _i168.PageInfo<void> page = _i168.PageInfo<void>(name);
}

/// generated route for
/// [_i141.SettingUpFingerprintPage]
class SettingUpFingerprintRoute extends _i168.PageRouteInfo<void> {
  const SettingUpFingerprintRoute({List<_i168.PageRouteInfo>? children})
      : super(
          SettingUpFingerprintRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingUpFingerprintRoute';

  static const _i168.PageInfo<void> page = _i168.PageInfo<void>(name);
}

/// generated route for
/// [_i142.SettingsPage]
class SettingsRoute extends _i168.PageRouteInfo<void> {
  const SettingsRoute({List<_i168.PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static const _i168.PageInfo<void> page = _i168.PageInfo<void>(name);
}

/// generated route for
/// [_i143.ShoppingPage]
class ShoppingRoute extends _i168.PageRouteInfo<void> {
  const ShoppingRoute({List<_i168.PageRouteInfo>? children})
      : super(
          ShoppingRoute.name,
          initialChildren: children,
        );

  static const String name = 'ShoppingRoute';

  static const _i168.PageInfo<void> page = _i168.PageInfo<void>(name);
}

/// generated route for
/// [_i144.SignupPage]
class SignupRoute extends _i168.PageRouteInfo<void> {
  const SignupRoute({List<_i168.PageRouteInfo>? children})
      : super(
          SignupRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignupRoute';

  static const _i168.PageInfo<void> page = _i168.PageInfo<void>(name);
}

/// generated route for
/// [_i145.SplashPage]
class SplashRoute extends _i168.PageRouteInfo<void> {
  const SplashRoute({List<_i168.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i168.PageInfo<void> page = _i168.PageInfo<void>(name);
}

/// generated route for
/// [_i146.TermsAndConditionPage]
class TermsAndConditionRoute extends _i168.PageRouteInfo<void> {
  const TermsAndConditionRoute({List<_i168.PageRouteInfo>? children})
      : super(
          TermsAndConditionRoute.name,
          initialChildren: children,
        );

  static const String name = 'TermsAndConditionRoute';

  static const _i168.PageInfo<void> page = _i168.PageInfo<void>(name);
}

/// generated route for
/// [_i147.TokenDetailPage]
class TokenDetailRoute extends _i168.PageRouteInfo<TokenDetailRouteArgs> {
  TokenDetailRoute({
    _i169.Key? key,
    required _i179.TokenDetailModel token,
    List<_i168.PageRouteInfo>? children,
  }) : super(
          TokenDetailRoute.name,
          args: TokenDetailRouteArgs(
            key: key,
            token: token,
          ),
          initialChildren: children,
        );

  static const String name = 'TokenDetailRoute';

  static const _i168.PageInfo<TokenDetailRouteArgs> page =
      _i168.PageInfo<TokenDetailRouteArgs>(name);
}

class TokenDetailRouteArgs {
  const TokenDetailRouteArgs({
    this.key,
    required this.token,
  });

  final _i169.Key? key;

  final _i179.TokenDetailModel token;

  @override
  String toString() {
    return 'TokenDetailRouteArgs{key: $key, token: $token}';
  }
}

/// generated route for
/// [_i148.TrackOrderPage]
class TrackOrderRoute extends _i168.PageRouteInfo<TrackOrderRouteArgs> {
  TrackOrderRoute({
    _i169.Key? key,
    required String orderId,
    List<_i168.PageRouteInfo>? children,
  }) : super(
          TrackOrderRoute.name,
          args: TrackOrderRouteArgs(
            key: key,
            orderId: orderId,
          ),
          initialChildren: children,
        );

  static const String name = 'TrackOrderRoute';

  static const _i168.PageInfo<TrackOrderRouteArgs> page =
      _i168.PageInfo<TrackOrderRouteArgs>(name);
}

class TrackOrderRouteArgs {
  const TrackOrderRouteArgs({
    this.key,
    required this.orderId,
  });

  final _i169.Key? key;

  final String orderId;

  @override
  String toString() {
    return 'TrackOrderRouteArgs{key: $key, orderId: $orderId}';
  }
}

/// generated route for
/// [_i149.TransactionDetailsPage]
class TransactionDetailsRoute
    extends _i168.PageRouteInfo<TransactionDetailsRouteArgs> {
  TransactionDetailsRoute({
    _i169.Key? key,
    required _i180.DollarCardTransactionEntity transaction,
    List<_i168.PageRouteInfo>? children,
  }) : super(
          TransactionDetailsRoute.name,
          args: TransactionDetailsRouteArgs(
            key: key,
            transaction: transaction,
          ),
          initialChildren: children,
        );

  static const String name = 'TransactionDetailsRoute';

  static const _i168.PageInfo<TransactionDetailsRouteArgs> page =
      _i168.PageInfo<TransactionDetailsRouteArgs>(name);
}

class TransactionDetailsRouteArgs {
  const TransactionDetailsRouteArgs({
    this.key,
    required this.transaction,
  });

  final _i169.Key? key;

  final _i180.DollarCardTransactionEntity transaction;

  @override
  String toString() {
    return 'TransactionDetailsRouteArgs{key: $key, transaction: $transaction}';
  }
}

/// generated route for
/// [_i150.TransactionHistoryDetailPage]
class TransactionHistoryDetailRoute
    extends _i168.PageRouteInfo<TransactionHistoryDetailRouteArgs> {
  TransactionHistoryDetailRoute({
    _i169.Key? key,
    required _i173.TransactionEntity transaction,
    List<_i168.PageRouteInfo>? children,
  }) : super(
          TransactionHistoryDetailRoute.name,
          args: TransactionHistoryDetailRouteArgs(
            key: key,
            transaction: transaction,
          ),
          initialChildren: children,
        );

  static const String name = 'TransactionHistoryDetailRoute';

  static const _i168.PageInfo<TransactionHistoryDetailRouteArgs> page =
      _i168.PageInfo<TransactionHistoryDetailRouteArgs>(name);
}

class TransactionHistoryDetailRouteArgs {
  const TransactionHistoryDetailRouteArgs({
    this.key,
    required this.transaction,
  });

  final _i169.Key? key;

  final _i173.TransactionEntity transaction;

  @override
  String toString() {
    return 'TransactionHistoryDetailRouteArgs{key: $key, transaction: $transaction}';
  }
}

/// generated route for
/// [_i151.TransactionHistoryPage]
class TransactionHistoryRoute extends _i168.PageRouteInfo<void> {
  const TransactionHistoryRoute({List<_i168.PageRouteInfo>? children})
      : super(
          TransactionHistoryRoute.name,
          initialChildren: children,
        );

  static const String name = 'TransactionHistoryRoute';

  static const _i168.PageInfo<void> page = _i168.PageInfo<void>(name);
}

/// generated route for
/// [_i152.TransactionLimitPage]
class TransactionLimitRoute extends _i168.PageRouteInfo<void> {
  const TransactionLimitRoute({List<_i168.PageRouteInfo>? children})
      : super(
          TransactionLimitRoute.name,
          initialChildren: children,
        );

  static const String name = 'TransactionLimitRoute';

  static const _i168.PageInfo<void> page = _i168.PageInfo<void>(name);
}

/// generated route for
/// [_i153.TransactionSuccessfulPage]
class TransactionSuccessfulRoute
    extends _i168.PageRouteInfo<TransactionSuccessfulRouteArgs> {
  TransactionSuccessfulRoute({
    _i169.Key? key,
    required _i170.BankAccountEntity account,
    required double amount,
    List<_i168.PageRouteInfo>? children,
  }) : super(
          TransactionSuccessfulRoute.name,
          args: TransactionSuccessfulRouteArgs(
            key: key,
            account: account,
            amount: amount,
          ),
          initialChildren: children,
        );

  static const String name = 'TransactionSuccessfulRoute';

  static const _i168.PageInfo<TransactionSuccessfulRouteArgs> page =
      _i168.PageInfo<TransactionSuccessfulRouteArgs>(name);
}

class TransactionSuccessfulRouteArgs {
  const TransactionSuccessfulRouteArgs({
    this.key,
    required this.account,
    required this.amount,
  });

  final _i169.Key? key;

  final _i170.BankAccountEntity account;

  final double amount;

  @override
  String toString() {
    return 'TransactionSuccessfulRouteArgs{key: $key, account: $account, amount: $amount}';
  }
}

/// generated route for
/// [_i154.TransferFundsPage]
class TransferFundsRoute extends _i168.PageRouteInfo<void> {
  const TransferFundsRoute({List<_i168.PageRouteInfo>? children})
      : super(
          TransferFundsRoute.name,
          initialChildren: children,
        );

  static const String name = 'TransferFundsRoute';

  static const _i168.PageInfo<void> page = _i168.PageInfo<void>(name);
}

/// generated route for
/// [_i155.TvCableConfirmPage]
class TvCableConfirmRoute extends _i168.PageRouteInfo<void> {
  const TvCableConfirmRoute({List<_i168.PageRouteInfo>? children})
      : super(
          TvCableConfirmRoute.name,
          initialChildren: children,
        );

  static const String name = 'TvCableConfirmRoute';

  static const _i168.PageInfo<void> page = _i168.PageInfo<void>(name);
}

/// generated route for
/// [_i156.TvCablePage]
class TvCableRoute extends _i168.PageRouteInfo<void> {
  const TvCableRoute({List<_i168.PageRouteInfo>? children})
      : super(
          TvCableRoute.name,
          initialChildren: children,
        );

  static const String name = 'TvCableRoute';

  static const _i168.PageInfo<void> page = _i168.PageInfo<void>(name);
}

/// generated route for
/// [_i157.TvCableReceiptPage]
class TvCableReceiptRoute extends _i168.PageRouteInfo<void> {
  const TvCableReceiptRoute({List<_i168.PageRouteInfo>? children})
      : super(
          TvCableReceiptRoute.name,
          initialChildren: children,
        );

  static const String name = 'TvCableReceiptRoute';

  static const _i168.PageInfo<void> page = _i168.PageInfo<void>(name);
}

/// generated route for
/// [_i158.VerifyCodePage]
class VerifyCodeRoute extends _i168.PageRouteInfo<void> {
  const VerifyCodeRoute({List<_i168.PageRouteInfo>? children})
      : super(
          VerifyCodeRoute.name,
          initialChildren: children,
        );

  static const String name = 'VerifyCodeRoute';

  static const _i168.PageInfo<void> page = _i168.PageInfo<void>(name);
}

/// generated route for
/// [_i159.VerifyEmailOtpPage]
class VerifyEmailOtpRoute extends _i168.PageRouteInfo<void> {
  const VerifyEmailOtpRoute({List<_i168.PageRouteInfo>? children})
      : super(
          VerifyEmailOtpRoute.name,
          initialChildren: children,
        );

  static const String name = 'VerifyEmailOtpRoute';

  static const _i168.PageInfo<void> page = _i168.PageInfo<void>(name);
}

/// generated route for
/// [_i160.VerifyForgotPage]
class VerifyForgotRoute extends _i168.PageRouteInfo<VerifyForgotRouteArgs> {
  VerifyForgotRoute({
    _i169.Key? key,
    required String email,
    List<_i168.PageRouteInfo>? children,
  }) : super(
          VerifyForgotRoute.name,
          args: VerifyForgotRouteArgs(
            key: key,
            email: email,
          ),
          initialChildren: children,
        );

  static const String name = 'VerifyForgotRoute';

  static const _i168.PageInfo<VerifyForgotRouteArgs> page =
      _i168.PageInfo<VerifyForgotRouteArgs>(name);
}

class VerifyForgotRouteArgs {
  const VerifyForgotRouteArgs({
    this.key,
    required this.email,
  });

  final _i169.Key? key;

  final String email;

  @override
  String toString() {
    return 'VerifyForgotRouteArgs{key: $key, email: $email}';
  }
}

/// generated route for
/// [_i161.VerifyPasswordDetailPage]
class VerifyPasswordDetailRoute
    extends _i168.PageRouteInfo<VerifyPasswordDetailRouteArgs> {
  VerifyPasswordDetailRoute({
    _i169.Key? key,
    required String emailAddress,
    List<_i168.PageRouteInfo>? children,
  }) : super(
          VerifyPasswordDetailRoute.name,
          args: VerifyPasswordDetailRouteArgs(
            key: key,
            emailAddress: emailAddress,
          ),
          initialChildren: children,
        );

  static const String name = 'VerifyPasswordDetailRoute';

  static const _i168.PageInfo<VerifyPasswordDetailRouteArgs> page =
      _i168.PageInfo<VerifyPasswordDetailRouteArgs>(name);
}

class VerifyPasswordDetailRouteArgs {
  const VerifyPasswordDetailRouteArgs({
    this.key,
    required this.emailAddress,
  });

  final _i169.Key? key;

  final String emailAddress;

  @override
  String toString() {
    return 'VerifyPasswordDetailRouteArgs{key: $key, emailAddress: $emailAddress}';
  }
}

/// generated route for
/// [_i162.VerifyPhonePage]
class VerifyPhoneRoute extends _i168.PageRouteInfo<void> {
  const VerifyPhoneRoute({List<_i168.PageRouteInfo>? children})
      : super(
          VerifyPhoneRoute.name,
          initialChildren: children,
        );

  static const String name = 'VerifyPhoneRoute';

  static const _i168.PageInfo<void> page = _i168.PageInfo<void>(name);
}

/// generated route for
/// [_i163.VirtualCardPage]
class VirtualCardRoute extends _i168.PageRouteInfo<void> {
  const VirtualCardRoute({List<_i168.PageRouteInfo>? children})
      : super(
          VirtualCardRoute.name,
          initialChildren: children,
        );

  static const String name = 'VirtualCardRoute';

  static const _i168.PageInfo<void> page = _i168.PageInfo<void>(name);
}

/// generated route for
/// [_i164.VirtualCardSuccessPage]
class VirtualCardSuccessRoute extends _i168.PageRouteInfo<void> {
  const VirtualCardSuccessRoute({List<_i168.PageRouteInfo>? children})
      : super(
          VirtualCardSuccessRoute.name,
          initialChildren: children,
        );

  static const String name = 'VirtualCardSuccessRoute';

  static const _i168.PageInfo<void> page = _i168.PageInfo<void>(name);
}

/// generated route for
/// [_i165.WatchlistPage]
class WatchlistRoute extends _i168.PageRouteInfo<void> {
  const WatchlistRoute({List<_i168.PageRouteInfo>? children})
      : super(
          WatchlistRoute.name,
          initialChildren: children,
        );

  static const String name = 'WatchlistRoute';

  static const _i168.PageInfo<void> page = _i168.PageInfo<void>(name);
}

/// generated route for
/// [_i166.YourAssetsPage]
class YourAssetsRoute extends _i168.PageRouteInfo<void> {
  const YourAssetsRoute({List<_i168.PageRouteInfo>? children})
      : super(
          YourAssetsRoute.name,
          initialChildren: children,
        );

  static const String name = 'YourAssetsRoute';

  static const _i168.PageInfo<void> page = _i168.PageInfo<void>(name);
}

/// generated route for
/// [_i167.YourOrderPage]
class YourOrderRoute extends _i168.PageRouteInfo<void> {
  const YourOrderRoute({List<_i168.PageRouteInfo>? children})
      : super(
          YourOrderRoute.name,
          initialChildren: children,
        );

  static const String name = 'YourOrderRoute';

  static const _i168.PageInfo<void> page = _i168.PageInfo<void>(name);
}
