// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Waanofi Dairy';

  @override
  String get login => 'Login';

  @override
  String get email => 'Email';

  @override
  String get password => 'Password';

  @override
  String get dashboard => 'Dashboard';

  @override
  String get herd => 'Herd';

  @override
  String get reports => 'Reports';

  @override
  String get more => 'More';

  @override
  String get recordMilk => 'Record Milk';

  @override
  String get recordFeed => 'Record Feed';

  @override
  String get animals => 'Animals';

  @override
  String get settings => 'Settings';

  @override
  String get logout => 'Logout';

  @override
  String get welcome => 'Welcome to Waanofi Dairy';

  @override
  String get onboardingTitle1 => 'Track Herd';

  @override
  String get onboardingDesc1 =>
      'Easily manage and track every animal in your dairy farm.';

  @override
  String get onboardingTitle2 => 'Monitor Production';

  @override
  String get onboardingDesc2 =>
      'Log daily milk yields per session and monitor trends.';

  @override
  String get onboardingTitle3 => 'Analyze Profit';

  @override
  String get onboardingDesc3 =>
      'Track feed costs against milk revenue to maximize your profits.';

  @override
  String get getStarted => 'Get Started';

  @override
  String get next => 'Next';

  @override
  String get skip => 'Skip';

  @override
  String get emptyAnimals => 'No animals found.';

  @override
  String get addAnimal => 'Add Animal';
}
