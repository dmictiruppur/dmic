import 'dart:convert';
import 'dart:async';

class SearchMemberListModel {
  String RegistrationId;
  String RegCode;
  String MemberName_en;
  String ProfilePhotoImage;
  String age;
  String KolamTitle_en;
  String GothramTitle_en;
  String RasiMoonTitle_en;
  String StarProTitle_en;
  String CityName_en;
  String mProfileViewId;

  SearchMemberListModel(
      {this.RegistrationId,
      this.RegCode,
      this.MemberName_en,
      this.ProfilePhotoImage,
      this.age,
      this.KolamTitle_en,
      this.GothramTitle_en,
      this.mProfileViewId,
      this.RasiMoonTitle_en,
      this.CityName_en,
      this.StarProTitle_en});

  factory SearchMemberListModel.fromJson(Map<String, dynamic> jsonData) {
    return SearchMemberListModel(
      RegistrationId: jsonData['RegistrationId'],
      RegCode: jsonData['RegCode'],
      MemberName_en: jsonData['MemberName_en'],
      ProfilePhotoImage: jsonData['ProfilePhotoImage'],
      age: jsonData['age'],
      KolamTitle_en: jsonData['KolamTitle_en'],
      GothramTitle_en: jsonData['GothramTitle_en'],
      RasiMoonTitle_en: jsonData['RasiMoonTitle_en'],
      StarProTitle_en: jsonData['StarProTitle_en'],
      CityName_en: jsonData['CityName_en'],
      mProfileViewId: jsonData['mProfileViewId'],
    );
  }

  Map<String, dynamic> toJson() => {
        'RegistrationId': RegistrationId,
        'RegCode': RegCode,
        'MemberName_en': MemberName_en,
        'ProfilePhotoImage': ProfilePhotoImage,
        'age': age,
        'KolamTitle_en': KolamTitle_en,
        'GothramTitle_en': GothramTitle_en,
        'RasiMoonTitle_en': RasiMoonTitle_en,
        'StarProTitle_en': StarProTitle_en,
        'CityName_en': CityName_en,
        'mProfileViewId': mProfileViewId,
      };

  String get _RegistrationId => RegistrationId;
  String get _RegCode => RegCode;
  String get _MemberName_en => MemberName_en;
  String get _ProfilePhotoImage => ProfilePhotoImage;
  String get _age => age;
  String get _KolamTitle_en => KolamTitle_en;
  String get _GothramTitle_en => GothramTitle_en;
  String get _RasiMoonTitle_en => RasiMoonTitle_en;
  String get _StarProTitle_en => StarProTitle_en;
  String get _CityName_en => CityName_en;
  String get _mProfileViewId => mProfileViewId;
}
