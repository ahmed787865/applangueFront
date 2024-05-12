import 'dart:convert';
import '../utils/preferences_manager.dart';
import 'package:http/http.dart' as http;

import 'loading_idicator_dialog.dart';

class Network {
  var token;

  authData(data, apiUrl) async {
    return await http.post(Uri.parse(apiUrl), body: jsonEncode(data), headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    }).timeout(
      Duration(seconds: 5),
      onTimeout: () {
        LoadingIndicatorDialog().dismiss();
        return http.Response('Error Time out', 408);
      },
    );
  }

  getData(apiUrl) async {
    token = await PreferencesManager.getAuthToken();
    return await http.get(Uri.parse(apiUrl), headers: _setHeaders()).timeout(
      Duration(seconds: 5),
      onTimeout: () {
        LoadingIndicatorDialog().dismiss();
        return http.Response('Error Time out', 408);
      },
    );
  }

  getDataWithoutTimout(apiUrl) async {
    token = await PreferencesManager.getAuthToken();
    return await http.get(Uri.parse(apiUrl), headers: _setHeaders());
  }

  getDataAsGuest(apiUrl) async {
    return await http.get(Uri.parse(apiUrl), headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    }).timeout(
      Duration(seconds: 5),
      onTimeout: () {
        LoadingIndicatorDialog().dismiss();
        return http.Response('Error Time out', 408);
      },
    );
  }

  addData(data, apiUrl) async {
    token = await PreferencesManager.getAuthToken();
    return await http
        .post(Uri.parse(apiUrl), body: jsonEncode(data), headers: _setHeaders())
        .timeout(
      Duration(seconds: 5),
      onTimeout: () {
        LoadingIndicatorDialog().dismiss();
        return http.Response('Error Time out', 408);
      },
    );
  }

  editData(data, apiUrl) async {
    token = await PreferencesManager.getAuthToken();
    return await http
        .put(Uri.parse(apiUrl), body: jsonEncode(data), headers: _setHeaders())
        .timeout(
      Duration(seconds: 5),
      onTimeout: () {
        LoadingIndicatorDialog().dismiss();
        return http.Response('Error Time out', 408);
      },
    );
  }

  deleteData(apiUrl) async {
    token = await PreferencesManager.getAuthToken();
    return await http.delete(Uri.parse(apiUrl), headers: _setHeaders()).timeout(
      Duration(seconds: 5),
      onTimeout: () {
        LoadingIndicatorDialog().dismiss();
        return http.Response('Error Time out', 408);
      },
    );
  }

  _setHeaders() => {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Token $token'
      };
}
