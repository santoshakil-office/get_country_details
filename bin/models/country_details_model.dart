import 'dart:convert';

List<CountryDetailsModel> countryDetailsModelFromJson(String str) =>
    List<CountryDetailsModel>.from(
        json.decode(str).map((x) => CountryDetailsModel.fromJson(x)));

String countryDetailsModelToJson(List<CountryDetailsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

List<State> statesModelFromJson(String str) =>
    List<State>.from(json.decode(str).map((x) => State.fromJson(x)));

String statesModelToJson(List<State> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CountryDetailsModel {
  CountryDetailsModel({
    this.countryName,
    this.countryShortName,
    this.countryPhoneCode,
    this.states,
  });

  String countryName;
  String countryShortName;
  int countryPhoneCode;
  List<State> states;

  factory CountryDetailsModel.fromJson(Map<String, dynamic> json) =>
      CountryDetailsModel(
        countryName: json['country_name'],
        countryShortName: json['country_short_name'],
        countryPhoneCode: json['country_phone_code'],
        states:
            List<State>.from(json['state_name'].map((x) => State.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        'country_name': countryName,
        'country_short_name': countryShortName,
        'country_phone_code': countryPhoneCode,
        'state_name': List<dynamic>.from(states.map((x) => x.toJson())),
      };
}

class State {
  State({
    this.state,
  });

  String state;

  factory State.fromJson(Map<String, dynamic> json) => State(
        state: json['state_name'],
      );

  Map<String, dynamic> toJson() => {
        'state_name': state,
      };
}
