import 'dart:convert';
import 'dart:typed_data';

import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class XanoLoginCall {
  static Future<ApiCallResponse> call({
    String? email = '',
    String? password = '',
  }) {
    final body = '''
{
  "email": "${email}",
  "password": "${password}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Xano login',
      apiUrl: 'https://x8ki-letl-twmt.n7.xano.io/api:9UAcfRBI/auth/login',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic authorization(dynamic response) => getJsonField(
        response,
        r'''$.authToken''',
      );
}

class XanoSignupCall {
  static Future<ApiCallResponse> call({
    String? name = '',
    String? email = '',
    String? password = '',
  }) {
    final body = '''
{
  "name": "${name}",
  "email": "${email}",
  "password": "${password}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Xano Signup',
      apiUrl: 'https://x8ki-letl-twmt.n7.xano.io/api:9UAcfRBI/auth/signup',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic authorization(dynamic response) => getJsonField(
        response,
        r'''$.authToken''',
      );
}

class DetailsCall {
  static Future<ApiCallResponse> call({
    String? authToken = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Details',
      apiUrl: 'https://x8ki-letl-twmt.n7.xano.io/api:9UAcfRBI/patient',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer${authToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic id(dynamic response) => getJsonField(
        response,
        r'''$[:].id''',
      );
  static dynamic name(dynamic response) => getJsonField(
        response,
        r'''$[:].Name''',
      );
  static dynamic mobile(dynamic response) => getJsonField(
        response,
        r'''$[:].M_No''',
      );
  static dynamic dob(dynamic response) => getJsonField(
        response,
        r'''$[:].DOB''',
      );
  static dynamic bgroup(dynamic response) => getJsonField(
        response,
        r'''$[:].Blood_group''',
      );
  static dynamic bsugar(dynamic response) => getJsonField(
        response,
        r'''$[:].Blood_Sugar''',
      );
  static dynamic bpressure(dynamic response) => getJsonField(
        response,
        r'''$[:].Blood_pressure''',
      );
  static dynamic uid(dynamic response) => getJsonField(
        response,
        r'''$[:].user_id''',
      );
  static dynamic pimage(dynamic response) => getJsonField(
        response,
        r'''$[:].P_image''',
      );
}

class MedicalrecordsCall {
  static Future<ApiCallResponse> call({
    String? authToken = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Medicalrecords',
      apiUrl: 'https://x8ki-letl-twmt.n7.xano.io/api:9UAcfRBI/medical_records',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer${authToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic mrecord(dynamic response) => getJsonField(
        response,
        r'''$[:]''',
        true,
      );
}

class AlldoctorsCall {
  static Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'Alldoctors',
      apiUrl: 'https://x8ki-letl-twmt.n7.xano.io/api:9UAcfRBI/doctors',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic doctors(dynamic response) => getJsonField(
        response,
        r'''$[:]''',
        true,
      );
  static dynamic cardiologist(dynamic response) => getJsonField(
        response,
        r'''$[?(@.Doc_type=='Cardiologist')]''',
        true,
      );
  static dynamic opthamologist(dynamic response) => getJsonField(
        response,
        r'''$[?(@.Doc_type=='Opthamologist')]''',
        true,
      );
  static dynamic pulmonologist(dynamic response) => getJsonField(
        response,
        r'''$[?(@.Doc_type=='Pulmonologist')]''',
        true,
      );
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar) {
  jsonVar ??= {};
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return '{}';
  }
}
