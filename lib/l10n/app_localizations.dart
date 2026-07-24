import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_am.dart';
import 'app_localizations_en.dart';
import 'app_localizations_om.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('am'),
    Locale('en'),
    Locale('om'),
  ];

  /// No description provided for @appName.
  ///
  /// In en, this message translates to:
  /// **'Waanofi Dairy'**
  String get appName;

  /// No description provided for @dashboard.
  ///
  /// In en, this message translates to:
  /// **'Dashboard'**
  String get dashboard;

  /// No description provided for @herd.
  ///
  /// In en, this message translates to:
  /// **'Herd'**
  String get herd;

  /// No description provided for @reports.
  ///
  /// In en, this message translates to:
  /// **'Reports'**
  String get reports;

  /// No description provided for @more.
  ///
  /// In en, this message translates to:
  /// **'More'**
  String get more;

  /// No description provided for @recordMilk.
  ///
  /// In en, this message translates to:
  /// **'Record Milk'**
  String get recordMilk;

  /// No description provided for @recordFeed.
  ///
  /// In en, this message translates to:
  /// **'Record Feed'**
  String get recordFeed;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings & More'**
  String get settings;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Sign Out'**
  String get logout;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @preferences.
  ///
  /// In en, this message translates to:
  /// **'Preferences'**
  String get preferences;

  /// No description provided for @account.
  ///
  /// In en, this message translates to:
  /// **'Account'**
  String get account;

  /// No description provided for @adminTools.
  ///
  /// In en, this message translates to:
  /// **'Admin Tools'**
  String get adminTools;

  /// No description provided for @manageWorkers.
  ///
  /// In en, this message translates to:
  /// **'Manage Workers'**
  String get manageWorkers;

  /// No description provided for @manageFeedTypes.
  ///
  /// In en, this message translates to:
  /// **'Manage Feed Types'**
  String get manageFeedTypes;

  /// No description provided for @farmSettings.
  ///
  /// In en, this message translates to:
  /// **'Farm Settings'**
  String get farmSettings;

  /// No description provided for @milkPricePerLitre.
  ///
  /// In en, this message translates to:
  /// **'Milk Price per Litre (ETB)'**
  String get milkPricePerLitre;

  /// No description provided for @onboardingTitle1.
  ///
  /// In en, this message translates to:
  /// **'Track Your Herd'**
  String get onboardingTitle1;

  /// No description provided for @onboardingDesc1.
  ///
  /// In en, this message translates to:
  /// **'Easily manage your dairy cows, their health status, and production records.'**
  String get onboardingDesc1;

  /// No description provided for @onboardingTitle2.
  ///
  /// In en, this message translates to:
  /// **'Record Daily Milk'**
  String get onboardingTitle2;

  /// No description provided for @onboardingDesc2.
  ///
  /// In en, this message translates to:
  /// **'Log milk production per cow or at the farm level with intuitive forms.'**
  String get onboardingDesc2;

  /// No description provided for @onboardingTitle3.
  ///
  /// In en, this message translates to:
  /// **'Analyze Performance'**
  String get onboardingTitle3;

  /// No description provided for @onboardingDesc3.
  ///
  /// In en, this message translates to:
  /// **'View dynamic charts, profit/loss metrics, and identify your top producers.'**
  String get onboardingDesc3;

  /// No description provided for @getStarted.
  ///
  /// In en, this message translates to:
  /// **'Get Started'**
  String get getStarted;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @skip.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get skip;

  /// No description provided for @signIn.
  ///
  /// In en, this message translates to:
  /// **'Sign In'**
  String get signIn;

  /// No description provided for @signInToContinue.
  ///
  /// In en, this message translates to:
  /// **'Sign in to continue'**
  String get signInToContinue;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @sendMagicLink.
  ///
  /// In en, this message translates to:
  /// **'Send Magic Link'**
  String get sendMagicLink;

  /// No description provided for @enterEmailFirst.
  ///
  /// In en, this message translates to:
  /// **'Enter your email first'**
  String get enterEmailFirst;

  /// No description provided for @checkEmailForLink.
  ///
  /// In en, this message translates to:
  /// **'Check your email for a sign-in link!'**
  String get checkEmailForLink;

  /// No description provided for @backToSignIn.
  ///
  /// In en, this message translates to:
  /// **'Back to sign in'**
  String get backToSignIn;

  /// No description provided for @noAccountSignUp.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account? Create one'**
  String get noAccountSignUp;

  /// No description provided for @hasAccountSignIn.
  ///
  /// In en, this message translates to:
  /// **'Already have an account? Sign in'**
  String get hasAccountSignIn;

  /// No description provided for @createAccount.
  ///
  /// In en, this message translates to:
  /// **'Create Account'**
  String get createAccount;

  /// No description provided for @createAccountAndFarm.
  ///
  /// In en, this message translates to:
  /// **'Create Account & Farm'**
  String get createAccountAndFarm;

  /// No description provided for @setUpYourDairy.
  ///
  /// In en, this message translates to:
  /// **'Set up your dairy'**
  String get setUpYourDairy;

  /// No description provided for @fullName.
  ///
  /// In en, this message translates to:
  /// **'Full Name'**
  String get fullName;

  /// No description provided for @farmName.
  ///
  /// In en, this message translates to:
  /// **'Farm Name'**
  String get farmName;

  /// No description provided for @nameRequired.
  ///
  /// In en, this message translates to:
  /// **'Name is required'**
  String get nameRequired;

  /// No description provided for @farmNameRequired.
  ///
  /// In en, this message translates to:
  /// **'Farm name is required'**
  String get farmNameRequired;

  /// No description provided for @emailRequired.
  ///
  /// In en, this message translates to:
  /// **'Email is required'**
  String get emailRequired;

  /// No description provided for @validEmailRequired.
  ///
  /// In en, this message translates to:
  /// **'Enter a valid email'**
  String get validEmailRequired;

  /// No description provided for @passwordMinLength.
  ///
  /// In en, this message translates to:
  /// **'Password must be at least 6 characters'**
  String get passwordMinLength;

  /// No description provided for @required.
  ///
  /// In en, this message translates to:
  /// **'Required'**
  String get required;

  /// No description provided for @todaysMilk.
  ///
  /// In en, this message translates to:
  /// **'Today\'s Milk'**
  String get todaysMilk;

  /// No description provided for @thirtyDayTrend.
  ///
  /// In en, this message translates to:
  /// **'30D Trend'**
  String get thirtyDayTrend;

  /// No description provided for @thirtyDayProfit.
  ///
  /// In en, this message translates to:
  /// **'30D Profit'**
  String get thirtyDayProfit;

  /// No description provided for @thirtyDayMilkTrend.
  ///
  /// In en, this message translates to:
  /// **'30 Day Milk Trend'**
  String get thirtyDayMilkTrend;

  /// No description provided for @noDataThirtyDays.
  ///
  /// In en, this message translates to:
  /// **'No data for the last 30 days'**
  String get noDataThirtyDays;

  /// No description provided for @financialOverview.
  ///
  /// In en, this message translates to:
  /// **'Financial Overview (30 Days)'**
  String get financialOverview;

  /// No description provided for @revenue.
  ///
  /// In en, this message translates to:
  /// **'Revenue'**
  String get revenue;

  /// No description provided for @feedCost.
  ///
  /// In en, this message translates to:
  /// **'Feed Cost'**
  String get feedCost;

  /// No description provided for @herdStatus.
  ///
  /// In en, this message translates to:
  /// **'Herd Status'**
  String get herdStatus;

  /// No description provided for @topProducers.
  ///
  /// In en, this message translates to:
  /// **'Top Producers (30 Days)'**
  String get topProducers;

  /// No description provided for @noRecords.
  ///
  /// In en, this message translates to:
  /// **'No records'**
  String get noRecords;

  /// No description provided for @failedToLoadDashboard.
  ///
  /// In en, this message translates to:
  /// **'Failed to load dashboard'**
  String get failedToLoadDashboard;

  /// No description provided for @herdManagement.
  ///
  /// In en, this message translates to:
  /// **'Herd Management'**
  String get herdManagement;

  /// No description provided for @offlineMode.
  ///
  /// In en, this message translates to:
  /// **'Offline mode - showing cached data'**
  String get offlineMode;

  /// No description provided for @searchTagOrName.
  ///
  /// In en, this message translates to:
  /// **'Search tag or name...'**
  String get searchTagOrName;

  /// No description provided for @status.
  ///
  /// In en, this message translates to:
  /// **'Status'**
  String get status;

  /// No description provided for @breed.
  ///
  /// In en, this message translates to:
  /// **'Breed'**
  String get breed;

  /// No description provided for @allStatuses.
  ///
  /// In en, this message translates to:
  /// **'All Statuses'**
  String get allStatuses;

  /// No description provided for @active.
  ///
  /// In en, this message translates to:
  /// **'Active'**
  String get active;

  /// No description provided for @dry.
  ///
  /// In en, this message translates to:
  /// **'Dry'**
  String get dry;

  /// No description provided for @pregnant.
  ///
  /// In en, this message translates to:
  /// **'Pregnant'**
  String get pregnant;

  /// No description provided for @sick.
  ///
  /// In en, this message translates to:
  /// **'Sick'**
  String get sick;

  /// No description provided for @sold.
  ///
  /// In en, this message translates to:
  /// **'Sold'**
  String get sold;

  /// No description provided for @deceased.
  ///
  /// In en, this message translates to:
  /// **'Deceased'**
  String get deceased;

  /// No description provided for @allBreeds.
  ///
  /// In en, this message translates to:
  /// **'All Breeds'**
  String get allBreeds;

  /// No description provided for @noAnimalsFound.
  ///
  /// In en, this message translates to:
  /// **'No animals found'**
  String get noAnimalsFound;

  /// No description provided for @emptyHerdDesc.
  ///
  /// In en, this message translates to:
  /// **'Your herd is currently empty or no animals match your filter.'**
  String get emptyHerdDesc;

  /// No description provided for @addAnimal.
  ///
  /// In en, this message translates to:
  /// **'Add Animal'**
  String get addAnimal;

  /// No description provided for @unnamed.
  ///
  /// In en, this message translates to:
  /// **'Unnamed'**
  String get unnamed;

  /// No description provided for @unknownBreed.
  ///
  /// In en, this message translates to:
  /// **'Unknown breed'**
  String get unknownBreed;

  /// No description provided for @newAnimal.
  ///
  /// In en, this message translates to:
  /// **'New Animal'**
  String get newAnimal;

  /// No description provided for @editAnimal.
  ///
  /// In en, this message translates to:
  /// **'Edit Animal'**
  String get editAnimal;

  /// No description provided for @tagNumber.
  ///
  /// In en, this message translates to:
  /// **'Tag Number *'**
  String get tagNumber;

  /// No description provided for @nameOptional.
  ///
  /// In en, this message translates to:
  /// **'Name (Optional)'**
  String get nameOptional;

  /// No description provided for @breedOptional.
  ///
  /// In en, this message translates to:
  /// **'Breed (Optional)'**
  String get breedOptional;

  /// No description provided for @sex.
  ///
  /// In en, this message translates to:
  /// **'Sex'**
  String get sex;

  /// No description provided for @dateOfBirth.
  ///
  /// In en, this message translates to:
  /// **'Date of Birth'**
  String get dateOfBirth;

  /// No description provided for @selectDate.
  ///
  /// In en, this message translates to:
  /// **'Select Date'**
  String get selectDate;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @saving.
  ///
  /// In en, this message translates to:
  /// **'Saving...'**
  String get saving;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @notFound.
  ///
  /// In en, this message translates to:
  /// **'Not Found'**
  String get notFound;

  /// No description provided for @animalNotFound.
  ///
  /// In en, this message translates to:
  /// **'Animal not found.'**
  String get animalNotFound;

  /// No description provided for @info.
  ///
  /// In en, this message translates to:
  /// **'Info'**
  String get info;

  /// No description provided for @milk.
  ///
  /// In en, this message translates to:
  /// **'Milk'**
  String get milk;

  /// No description provided for @feed.
  ///
  /// In en, this message translates to:
  /// **'Feed'**
  String get feed;

  /// No description provided for @milkHistoryComingSoon.
  ///
  /// In en, this message translates to:
  /// **'Milk history coming soon'**
  String get milkHistoryComingSoon;

  /// No description provided for @feedHistoryComingSoon.
  ///
  /// In en, this message translates to:
  /// **'Feed history coming soon'**
  String get feedHistoryComingSoon;

  /// No description provided for @saveBatch.
  ///
  /// In en, this message translates to:
  /// **'Save Batch'**
  String get saveBatch;

  /// No description provided for @savedLocally.
  ///
  /// In en, this message translates to:
  /// **'Saved locally. Will sync when online.'**
  String get savedLocally;

  /// No description provided for @feedRecordedSecurely.
  ///
  /// In en, this message translates to:
  /// **'Feed recorded securely!'**
  String get feedRecordedSecurely;

  /// No description provided for @selectFeedTypeFirst.
  ///
  /// In en, this message translates to:
  /// **'Please select a Feed Type first.'**
  String get selectFeedTypeFirst;

  /// No description provided for @farmWideEntry.
  ///
  /// In en, this message translates to:
  /// **'Farm-wide Entry'**
  String get farmWideEntry;

  /// No description provided for @perAnimalEntry.
  ///
  /// In en, this message translates to:
  /// **'Per Animal Entry'**
  String get perAnimalEntry;

  /// No description provided for @enterTotalQuantity.
  ///
  /// In en, this message translates to:
  /// **'Enter total quantity distributed to the herd:'**
  String get enterTotalQuantity;

  /// No description provided for @estimatedCost.
  ///
  /// In en, this message translates to:
  /// **'Estimated Cost (Hidden from Workers):'**
  String get estimatedCost;

  /// No description provided for @saveFeed.
  ///
  /// In en, this message translates to:
  /// **'Save Feed'**
  String get saveFeed;

  /// No description provided for @noActiveFeedTypes.
  ///
  /// In en, this message translates to:
  /// **'No Feed Types (Ask Admin)'**
  String get noActiveFeedTypes;

  /// No description provided for @feedType.
  ///
  /// In en, this message translates to:
  /// **'Feed Type'**
  String get feedType;

  /// No description provided for @date.
  ///
  /// In en, this message translates to:
  /// **'Date'**
  String get date;

  /// No description provided for @noActiveAnimals.
  ///
  /// In en, this message translates to:
  /// **'No active animals found.'**
  String get noActiveAnimals;

  /// No description provided for @session.
  ///
  /// In en, this message translates to:
  /// **'Session'**
  String get session;

  /// No description provided for @morning.
  ///
  /// In en, this message translates to:
  /// **'Morning'**
  String get morning;

  /// No description provided for @afternoon.
  ///
  /// In en, this message translates to:
  /// **'Afternoon'**
  String get afternoon;

  /// No description provided for @evening.
  ///
  /// In en, this message translates to:
  /// **'Evening'**
  String get evening;

  /// No description provided for @adminConsole.
  ///
  /// In en, this message translates to:
  /// **'Admin Console'**
  String get adminConsole;

  /// No description provided for @workers.
  ///
  /// In en, this message translates to:
  /// **'Workers'**
  String get workers;

  /// No description provided for @auditLog.
  ///
  /// In en, this message translates to:
  /// **'Audit Log'**
  String get auditLog;

  /// No description provided for @addNewWorker.
  ///
  /// In en, this message translates to:
  /// **'Add New Worker'**
  String get addNewWorker;

  /// No description provided for @role.
  ///
  /// In en, this message translates to:
  /// **'Role'**
  String get role;

  /// No description provided for @workerUser.
  ///
  /// In en, this message translates to:
  /// **'Worker (User)'**
  String get workerUser;

  /// No description provided for @admin.
  ///
  /// In en, this message translates to:
  /// **'Admin'**
  String get admin;

  /// No description provided for @createAccountBtn.
  ///
  /// In en, this message translates to:
  /// **'Create Account'**
  String get createAccountBtn;

  /// No description provided for @workerCreatedSuccess.
  ///
  /// In en, this message translates to:
  /// **'Worker created successfully!'**
  String get workerCreatedSuccess;

  /// No description provided for @currentTeam.
  ///
  /// In en, this message translates to:
  /// **'Current Team'**
  String get currentTeam;

  /// No description provided for @deactivated.
  ///
  /// In en, this message translates to:
  /// **'Deactivated'**
  String get deactivated;

  /// No description provided for @noAuditLogs.
  ///
  /// In en, this message translates to:
  /// **'No audit logs available.'**
  String get noAuditLogs;

  /// No description provided for @modified.
  ///
  /// In en, this message translates to:
  /// **'modified'**
  String get modified;

  /// No description provided for @created.
  ///
  /// In en, this message translates to:
  /// **'Created'**
  String get created;

  /// No description provided for @deleted.
  ///
  /// In en, this message translates to:
  /// **'Deleted'**
  String get deleted;

  /// No description provided for @addFeedType.
  ///
  /// In en, this message translates to:
  /// **'Add Feed Type'**
  String get addFeedType;

  /// No description provided for @feedName.
  ///
  /// In en, this message translates to:
  /// **'Feed Name (e.g. Alfalfa)'**
  String get feedName;

  /// No description provided for @unit.
  ///
  /// In en, this message translates to:
  /// **'Unit (e.g. kg, bales)'**
  String get unit;

  /// No description provided for @costPerUnit.
  ///
  /// In en, this message translates to:
  /// **'Cost per Unit'**
  String get costPerUnit;

  /// No description provided for @mustBeNumber.
  ///
  /// In en, this message translates to:
  /// **'Must be a number'**
  String get mustBeNumber;

  /// No description provided for @noFeedTypesConfigured.
  ///
  /// In en, this message translates to:
  /// **'No feed types configured yet.'**
  String get noFeedTypesConfigured;

  /// No description provided for @exportPdf.
  ///
  /// In en, this message translates to:
  /// **'Export PDF'**
  String get exportPdf;

  /// No description provided for @exportCsv.
  ///
  /// In en, this message translates to:
  /// **'Export CSV'**
  String get exportCsv;

  /// No description provided for @groupBy.
  ///
  /// In en, this message translates to:
  /// **'Group By'**
  String get groupBy;

  /// No description provided for @byDay.
  ///
  /// In en, this message translates to:
  /// **'By Day'**
  String get byDay;

  /// No description provided for @byMonth.
  ///
  /// In en, this message translates to:
  /// **'By Month'**
  String get byMonth;

  /// No description provided for @byAnimal.
  ///
  /// In en, this message translates to:
  /// **'By Animal'**
  String get byAnimal;

  /// No description provided for @noDataForPeriod.
  ///
  /// In en, this message translates to:
  /// **'No data for this period.'**
  String get noDataForPeriod;

  /// No description provided for @sessions.
  ///
  /// In en, this message translates to:
  /// **'sessions'**
  String get sessions;

  /// No description provided for @savedToPath.
  ///
  /// In en, this message translates to:
  /// **'Saved to {path}'**
  String savedToPath(String path);

  /// No description provided for @errorSomethingWrong.
  ///
  /// In en, this message translates to:
  /// **'Oops! Something went wrong.'**
  String get errorSomethingWrong;

  /// No description provided for @error.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get error;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['am', 'en', 'om'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'am':
      return AppLocalizationsAm();
    case 'en':
      return AppLocalizationsEn();
    case 'om':
      return AppLocalizationsOm();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
