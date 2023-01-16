import 'dart:convert';
import 'package:http/http.dart';

class Failure {
  final String? message;
  final String? error;
  final int? code;
  final Message? errorMessage;

  Failure(this.message, {this.code, this.error, this.errorMessage});
}

Message messageFromJson(String str) => Message.fromJson(json.decode(str));

class Message {
  Message({
    this.message,
    this.response,
  });

  Map? message;
  bool? response;

  Message copyWith({
    Map? message,
    bool? response,
  }) =>
      Message(
        message: message ?? this.message,
        response: response ?? this.response,
      );

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        message: json["message"] == null || (json["message"] is String)
            ? null
            : Map.from(
                json["message"].map((key, value) => MapEntry(key, value))),
        response: json["response"],
      );
}

dynamic validateResponse(Response response) {
  // stacked.SnackbarService _snackbarService = locator<stacked.SnackbarService>();
  switch (response.statusCode) {
    case 200:
      return json.decode(response.body);
    case 201:
      return json.decode(response.body);
    case 202:
      return json.decode(response.body);
    case 404:
      throw Failure(getMessageString(response),
          code: response.statusCode,
          error: getErrorString(response),
          errorMessage: messageFromJson(response.body));
    case 403:
      throw Failure(getMessageString(response),
          code: response.statusCode,
          error: getErrorString(response),
          errorMessage: messageFromJson(response.body));
    case 401:
      throw Failure(getMessageString(response),
          code: response.statusCode,
          error: getErrorString(response),
          errorMessage: messageFromJson(response.body));

    case 400:
      throw Failure(getMessageString(response),
          code: response.statusCode,
          error: getErrorString(response),
          errorMessage: messageFromJson(response.body));
    case 405:
      throw Failure(getMessageString(response),
          code: response.statusCode,
          error: getErrorString(response),
          errorMessage: messageFromJson(response.body));
    case 500:
      throw Failure(getMessageString(response),
          code: response.statusCode,
          error: getErrorString(response),
          errorMessage: messageFromJson(response.body));

    default:
      throw Failure(getMessageString(response),
          code: response.statusCode,
          error: getErrorString(response),
          errorMessage: messageFromJson(response.body));
  }
}

Error onError(error) {
  if (error.toString().contains('SocketException')) {
    throw Failure("No Internet Connection");
  } else {
    if (error is Failure) {
      throw Failure(error.message,
          code: error.code, errorMessage: error.errorMessage);
    } else {
      throw Failure(
        error.toString(),
      );
    }
  }
}

String? getErrorString(Response response) {
  Map decodesMessage = json.decode(response.body) ?? {};
  if (decodesMessage.containsKey("error") &&
      decodesMessage["error"] is String) {
    if (decodesMessage["error"] == 'Invalid Authentication Token' ||
        decodesMessage["error"] == 'Authentication Token Expired') {
      return decodesMessage["error"];
    }
  } else {
    return "Something went wrong";
  return null;
  }
  return null;
}

String getMessageString(Response response) {
  Map decodesMessage = json.decode(response.body) ?? {};
  if (decodesMessage.containsKey("message") &&
      decodesMessage["message"] is String) {
    return decodesMessage["message"];
  } else {
    return "Something went wrong";
  }
}

dynamic validateListResponse(dynamic response) {
  switch (response.statusCode) {
    case 200:
      return response.body;
    case 201:
      return response.body;
    default:
      throw Failure(response.body.toString(),
          code: response.statusCode,
          errorMessage: messageFromJson(response.body));
  }
}
