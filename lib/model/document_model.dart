import 'package:flutter/material.dart';
import 'package:ppay_mobile/screens/views/document_screen/driver_license_screen.dart';
import 'package:ppay_mobile/screens/views/document_screen/international_passport_screen.dart';
import 'package:ppay_mobile/screens/views/document_screen/national_identity_screen.dart';
import 'package:ppay_mobile/screens/views/document_screen/voter_card_screen.dart';

class DocumentModel {
  final String text;
  final Widget screen;

  DocumentModel({required this.text, required this.screen});
}

List documents = [
  DocumentModel(
    text: 'National Identity',
    screen: NationalIdentityScreen(selectedDocument: 'National Identity'),
  ),
  DocumentModel(
    text: 'International Passport',
    screen: InternationalPassportScreen(
      selectedDocument: 'International Passport',
    ),
  ),
  DocumentModel(
    text: "Driver's License",
    screen: DriverLicenseScreen(selectedDocument: "Driver's License"),
  ),
  DocumentModel(
    text: 'Voters Card',
    screen: VoterCardScreen(selectedDocument: 'Voters Card'),
  ),
];
