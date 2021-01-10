import 'dart:convert';

List<AllCountryModel> allCountryModelFromJson(String str) =>
    List<AllCountryModel>.from(
        json.decode(str).map((x) => AllCountryModel.fromJson(x)));

String allCountryModelToJson(List<AllCountryModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AllCountryModel {
  AllCountryModel({
    this.countryName,
    this.countryShortName,
    this.countryPhoneCode,
  });

  String countryName;
  String countryShortName;
  int countryPhoneCode;

  factory AllCountryModel.fromJson(Map<String, dynamic> json) =>
      AllCountryModel(
        countryName: json['country_name'],
        countryShortName: json['country_short_name'],
        countryPhoneCode: json['country_phone_code'],
      );

  Map<String, dynamic> toJson() => {
        'country_name': countryName,
        'country_short_name': countryShortName,
        'country_phone_code': countryPhoneCode,
      };
}
