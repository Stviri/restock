import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['ka', 'en'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? kaText = '',
    String? enText = '',
  }) =>
      [kaText, enText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // Categories
  {
    'cyus3xy1': {
      'ka': 'კატეგორიები',
      'en': 'Categories',
    },
    'nb2324w5': {
      'ka': 'სნექები',
      'en': 'Snacks',
    },
    '0rdv2q1e': {
      'ka': 'სნექები',
      'en': 'Snacks',
    },
    '5q2qd0dn': {
      'ka': 'სასმელი, ყავა და ჩაი',
      'en': 'Drinks, Coffe and Tea',
    },
    'he8ngzov': {
      'ka': 'სასმელი, ყავა და ჩაი',
      'en': 'Drinks, Coffe and Tea',
    },
    'ofq1nqyh': {
      'ka': 'ჰიგიენა - სახლის მოვლა',
      'en': 'Hygiene - Cleaning Products',
    },
    'b0wgjrm5': {
      'ka': 'ჰიგიენა - სახლის მოვლა',
      'en': 'Hygiene - Cleaning Products',
    },
    'b2usclft': {
      'ka': 'ცხოველთა მოვლა',
      'en': 'Pet Supplies',
    },
    '0d84ejuk': {
      'ka': 'ცხოველთა მოვლა',
      'en': 'Pet Supplies',
    },
    'yipheqp3': {
      'ka': 'ხილ - ბოსტნეული',
      'en': 'Fruits and Vegetables',
    },
    'xgesitfc': {
      'ka': 'ხილ - ბოსტნეული',
      'en': 'Fruits and Vegetables',
    },
    '3ev9oxs4': {
      'ka': 'პურ - ფუნთუშეული',
      'en': 'Pastry',
    },
    'xh6ljpy3': {
      'ka': 'პურ - ფუნთუშეული',
      'en': 'Pastry',
    },
    'kng05hca': {
      'ka': 'ძეხვეული და ხორცპროდუქტები',
      'en': 'Sausages and Meat Products',
    },
    'cfuj3zg3': {
      'ka': 'ძეხვეული და ხორცპროდუქტები',
      'en': 'Sausages and Meat Products',
    },
    'wurxw3e6': {
      'ka': 'ალკოჰოლური სასმელები',
      'en': 'Alcoholic Beverages',
    },
    'b6kif3cv': {
      'ka': 'ალკოჰოლური სასმელები',
      'en': 'Alcoholic Beverages',
    },
    'f5l4xcq4': {
      'ka': 'ზღვის პროდუქტი',
      'en': 'Sea Food',
    },
    'xi4jqrd3': {
      'ka': 'ზღვის პროდუქტი',
      'en': 'Sea Food',
    },
    '8fd9m60a': {
      'ka': 'ტკბილეული',
      'en': 'Sweets',
    },
    'td8sroz6': {
      'ka': 'ტკბილეული',
      'en': 'Sweets',
    },
    'oegpo55w': {
      'ka': 'კვერცხი და რძის ნაწარმი',
      'en': 'Eggs and Dairy',
    },
    'jehq1ugm': {
      'ka': 'კვერცხი და რძის ნაწარმი',
      'en': 'Eggs and Dairy',
    },
    'enjdljny': {
      'ka': 'ბაკალეა',
      'en': 'Dry Goods and Sauces',
    },
    '8h2bqjq3': {
      'ka': 'ბაკალეა',
      'en': 'Dry Goods and Sauces',
    },
    'yvjczbws': {
      'ka': 'ნახევარფაბრიკატები',
      'en': 'Frozen Products',
    },
    'ik0t77ma': {
      'ka': 'ნახევარფაბრიკატები',
      'en': 'Frozen Products',
    },
    'fwlwvhy5': {
      'ka': 'კატეგორიები',
      'en': 'Categories',
    },
  },
  // Search
  {
    'cqe9auc5': {
      'ka': 'მოძებნე სასურველი პროდუქტი',
      'en': 'Search for Desired Products',
    },
    'upm3gxkx': {
      'ka': 'ძიება',
      'en': 'Search',
    },
  },
  // Settings
  {
    'f9wtwhl4': {
      'ka': 'პარამეტრები',
      'en': 'Settings',
    },
    'cgarqtto': {
      'ka': 'შეტყობინებები',
      'en': 'Notifications',
    },
    '6dcle97s': {
      'ka': 'ბნელი რეჟიმი',
      'en': 'Dark Mode',
    },
    'bio2rbjb': {
      'ka': 'ენა',
      'en': 'Language',
    },
    'czrufg54': {
      'ka': 'გამოხმაურება',
      'en': 'Contact us',
    },
    'pqsjgft1': {
      'ka': 'ჩვენს შესახებ',
      'en': 'About us',
    },
    'i6aqiamk': {
      'ka': 'კონფიდენციალურობის პოლიტიკა',
      'en': 'Privacy Policy',
    },
    'bnlurwvp': {
      'ka': 'ვერსია 1.0.0',
      'en': 'Version 1.0.0',
    },
    'tc2di16f': {
      'ka': 'პარამეტრები',
      'en': 'Settings',
    },
  },
  // HomePage
  {
    're1osdvp': {
      'ka': 'დღევანდელი ფასდაკლებები',
      'en': 'Ongoing Sales',
    },
    '1et2qvwe': {
      'ka': 'მაღაზიები',
      'en': 'Supermarkets',
    },
    '2wsnep69': {
      'ka': 'მთავარი',
      'en': 'Home',
    },
  },
  // categoryView
  {
    'iju4zuef': {
      'ka': 'შოკოლადი',
      'en': 'Chocolate',
    },
    'xa78lyt8': {
      'ka': 'ორცხობილა',
      'en': 'Cookies',
    },
    'jbjklywl': {
      'ka': 'სოუსი',
      'en': 'Sauces',
    },
    '9pwpywgr': {
      'ka': 'მაკარონი',
      'en': 'Pasta',
    },
    'ijz3xc4w': {
      'ka': 'ყავა',
      'en': 'Coffee',
    },
    'fj2kc33a': {
      'ka': 'ენერგეტიკული',
      'en': 'Energy Drinks',
    },
    'qmqq0ko2': {
      'ka': 'Home',
      'en': '',
    },
  },
  // PrivacyPolicy
  {
    'vm3or7iz': {
      'ka': 'კონფიდენციალურობის პოლიტიკა',
      'en': '',
    },
    'bck7d3vg': {
      'ka': '\n\nბოლო განახლება: 10 მაისი, 2025 წელი',
      'en': '',
    },
    'dji3rrfq': {
      'ka':
          '\n\nმადლობას გიხდით, რომ იყენებთ reSTOCK-ს . ჩვენთვის მნიშვნელოვანია თქვენი პირადი მონაცემების დაცვა. \n\nეს კონფიდენციალურობის პოლიტიკა განმარტავს, როგორ ვაგროვებთ, ვიყენებთ და ვიცავთ თქვენს ინფორმაციას.',
      'en': '',
    },
    'ppxa1srw': {
      'ka': '\n\nრა ინფორმაციას ვაგროვებთ',
      'en': '',
    },
    'focbedom': {
      'ka':
          '\n\nreSTOCK აპლიკაცია აგროვებს შემდეგ მონაცემებს:\n\nსრული სახელი\n\nელფოსტის მისამართი\n\nმდებარეობის მონაცემები (მომხმარებელთან ახლომდებარე სუპერმარკეტების ჩვენებისთვის)\n',
      'en': '',
    },
    '5na3hcbn': {
      'ka': '\nროგორ ვიყენებთ თქვენს მონაცემებს',
      'en': '',
    },
    'u30qhpi6': {
      'ka':
          '\n\nჩვენ ვიღებთ და ვიყენებთ თქვენს მონაცემებს შემდეგი მიზნებისთვის:\n\nანგარიშის შექმნა და მართვა აპლიკაციაში\n\nთქვენი ლოკაციის გამოყენებით ახლომდებარე სუპერმარკეტების ჩვენება\n\nკავშირის შესაძლებლობა ჩვენი დახმარების ველის საშუალებით\n\nსუპერმარკეტების აქციების და პრომო ბანერების გაცნობა\n\nreSTOCK-ში არ გამოიყენება ტრადიციული რეკლამები. ჩვენ ვაჩვენებთ მხოლოდ სუპერმარკეტების სპეციალურ შეთავაზებებსა და აქციებს.\n',
      'en': '',
    },
    'ztp1foi6': {
      'ka': '\nმონაცემების გაზიარება',
      'en': '',
    },
    'kaxcgel2': {
      'ka':
          '\n\nჩვენ არ ვუზიარებთ თქვენს პირად მონაცემებს მესამე პირებს, გარდა იმ შემთხვევებისა, როდესაც ეს აუცილებელია კანონის მოთხოვნით ან თქვენი თანხმობით.',
      'en': '',
    },
    'rc75ttp6': {
      'ka': '\n\nთქვენი უფლებები',
      'en': '',
    },
    'mxf43d4j': {
      'ka':
          '\n\nთქვენ გაქვთ უფლება:\n\nმოითხოვოთ თქვენი მონაცემების ნახვა, ჩასწორება ან წაშლა\n\nუარი თქვათ მონაცემების დამუშავებაზე გარკვეულ შემთხვევებში\n',
      'en': '',
    },
    'wz6rqiw2': {
      'ka': '\nკონტაქტი',
      'en': '',
    },
    'yw8a76y9': {
      'ka':
          '\n\nთუ გაქვთ შეკითხვები კონფიდენციალურობასთან დაკავშირებით, გთხოვთ დაგვიკავშირდეთ:\n\nელფოსტა: support@restock.com\n',
      'en': '',
    },
    'm9a3tk09': {
      'ka': '\n\n© 2025 reSTOCK',
      'en': '',
    },
    '5u6mp5uk': {
      'ka': 'Home',
      'en': '',
    },
  },
  // AboutUs
  {
    '5tp4hpg3': {
      'ka':
          'ჩვენი მთავარი მიზანი იყო მომხმარებლისთვის საქართველოს ბაზარზე მაღაზიების ფასდაკლებებზე უფრო მარტივი წვდომის უზრუნველყოფა, \n\nრაც გაძლევთ საშუალებას რომ ყოველდღიურად დაზოგოთ თანხა.\n\nreSTOCK გეხმარებათ უკეთ დაგეგმოთ შესყიდვები, რათა არასოდეს გამოგრჩეთ კარგი შეთავაზება. \n\nრატომ უნდა გადაიხადოთ მეტი ერთ მაღაზიაში, როცა იგივე პროდუქტი სხვაგან ფასდაკლებაშია?\n\n',
      'en': '',
    },
    'kb2yxzq6': {
      'ka': 'Home',
      'en': '',
    },
  },
  // StorePage
  {
    '2jeqqzkn': {
      'ka': 'იხილეთ პროდუქცია',
      'en': '',
    },
    '5a3ynnv4': {
      'ka': 'Home',
      'en': '',
    },
  },
  // ProductPage
  {
    '4j0njy4b': {
      'ka': 'იხილეთ რუკაზე',
      'en': '',
    },
    'y4vgn5iu': {
      'ka': 'მსგავსი პროდუქტები',
      'en': '',
    },
    'v27kkyad': {
      'ka': 'Home',
      'en': '',
    },
  },
  // bottomNavBar
  {
    'xof408rd': {
      'ka': 'მთავარი',
      'en': '',
    },
    'qjcitq70': {
      'ka': 'მარკეტები',
      'en': '',
    },
    'qkey2qo2': {
      'ka': 'პროფილი',
      'en': '',
    },
  },
  // navbaru
  {
    'bxd6gizu': {
      'ka': 'მთავარი',
      'en': '',
    },
    '8cqk14bh': {
      'ka': 'მარკეტები',
      'en': '',
    },
    '548jfrfo': {
      'ka': 'პროფილი',
      'en': '',
    },
    'zks9j2g0': {
      'ka': 'პარამეტრები',
      'en': '',
    },
  },
  // Products
  {
    'dsazwopv': {
      'ka': 'TEST',
      'en': '',
    },
  },
  // ProductsList
  {
    'umhak2l0': {
      'ka': '88%',
      'en': '',
    },
    'vwwhdk61': {
      'ka': 'პროდუქტი',
      'en': '',
    },
    'u9pe1ts3': {
      'ka': '12.5 ₾',
      'en': '',
    },
    'x7na59uo': {
      'ka': '12 ₾',
      'en': '',
    },
  },
  // Supermarkets
  {
    'zqw7aw49': {
      'ka': 'იხილეთ პროდუქცია',
      'en': 'View Products',
    },
  },
  // SettingsComponent
  {
    'bzyl7bzq': {
      'ka': 'პარამეტრები',
      'en': '',
    },
    '7b96lmcd': {
      'ka': 'შეტყობინებები',
      'en': '',
    },
    'jj2pk0wu': {
      'ka': 'ბნელი რეჟიმი',
      'en': '',
    },
    'p8t3em1y': {
      'ka': 'ენა',
      'en': '',
    },
    '999nlhkb': {
      'ka': 'ქართული',
      'en': '',
    },
    'tfstyl15': {
      'ka': 'გამოხმაურება',
      'en': '',
    },
    'mq77s0a4': {
      'ka': 'ჩვენს შესახებ',
      'en': '',
    },
    '9ijz3lev': {
      'ka': 'კონფიდენციალურობის პოლიტიკა',
      'en': '',
    },
    '6m61qhyj': {
      'ka': 'ვერსია 1.0.0',
      'en': '',
    },
  },
  // Miscellaneous
  {
    '55mk2atg': {
      'ka': '',
      'en': '',
    },
    'z6az9e7c': {
      'ka': '',
      'en': '',
    },
    'lk0b5ruf': {
      'ka': '',
      'en': '',
    },
    'ntmg2fhm': {
      'ka': '',
      'en': '',
    },
    '10fuic3p': {
      'ka': '',
      'en': '',
    },
    'bdw4pfy3': {
      'ka': '',
      'en': '',
    },
    '9r33fwd4': {
      'ka': '',
      'en': '',
    },
    '56csm2hi': {
      'ka': '',
      'en': '',
    },
    '9raurlr2': {
      'ka': '',
      'en': '',
    },
    'kwdo7b52': {
      'ka': '',
      'en': '',
    },
    'j5vnjshm': {
      'ka': '',
      'en': '',
    },
    '3b6nxljx': {
      'ka': '',
      'en': '',
    },
    '9dxfsqrx': {
      'ka': '',
      'en': '',
    },
    's6y5scuw': {
      'ka': '',
      'en': '',
    },
    'nmnkmbqv': {
      'ka': '',
      'en': '',
    },
    'j7snvnfx': {
      'ka': '',
      'en': '',
    },
    'xcrw5c8c': {
      'ka': '',
      'en': '',
    },
    '92jpm1vf': {
      'ka': '',
      'en': '',
    },
    'gly5kx5k': {
      'ka': '',
      'en': '',
    },
    'jqzbwu51': {
      'ka': '',
      'en': '',
    },
    'kl5sgjqp': {
      'ka': '',
      'en': '',
    },
    '9fhlmbbo': {
      'ka': '',
      'en': '',
    },
    'qt95cj25': {
      'ka': '',
      'en': '',
    },
    'g6m5nihy': {
      'ka': '',
      'en': '',
    },
    'vrmpyxni': {
      'ka': '',
      'en': '',
    },
  },
].reduce((a, b) => a..addAll(b));
