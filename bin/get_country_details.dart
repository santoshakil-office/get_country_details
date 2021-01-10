import 'dart:io';

import 'package:http/http.dart' as http;

import 'constants/constants.dart';
import 'models/all_country_model.dart';
import 'models/country_details_model.dart';

void main() {
  getData();
}

void getData() async {
  var cons = Constants();

  var jsonFile = File('CountryDetails.json');

  var headers = {
    'Accept': 'application/json',
    'Authorization': 'Bearer ${cons.token}',
  };

  var responseC = await http.get(
      'https://www.universal-tutorial.com/api/countries/',
      headers: headers);

  if (responseC.statusCode == 200) {
    var countries = allCountryModelFromJson(responseC.body);

    countries.forEach((element) async {
      var responseS = await http.get(
          'https://www.universal-tutorial.com/api/states/${element.countryName}',
          headers: headers);

      if (responseS.statusCode == 200) {
        var stateList = statesModelFromJson(responseS.body);

        var states = <String>[];

        stateList.asMap().forEach((k, v) {
          states.add('{\"state_name\": \"${v.state}\"}\n');
        });

        var data =
            '{\"country_name\": \"${element.countryName}\",\n \"alpha2_code\": \"${element.countryShortName}\",\n\"country_code\": \"${element.countryPhoneCode.toString()}\",\n\"states\": $states}\n';

        jsonFile.writeAsStringSync(data.toString() + ',\n',
            mode: FileMode.append);

        print(data.toString());
      }
    });
  }
}
