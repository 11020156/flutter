// Copyright 2016 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'message.dart';

/// Send a string and get a string response.
class RequestData extends Command {
  @override
  final String kind = 'request_data';

  /// Create a command that sends a message.
  RequestData(this.message, { Duration timeout }) : super(timeout: timeout);

  /// The message being sent from the test to the application.
  final String message;

  /// Deserializes this command from the value generated by [serialize].
  RequestData.deserialize(Map<String, String> params)
      : this.message = params['message'],
        super.deserialize(params);

  @override
  Map<String, String> serialize() => super.serialize()..addAll(<String, String>{
    'message': message,
  });
}

/// The result of the [RequestData] command.
class RequestDataResult extends Result {
  /// Creates a result with the given [message].
  RequestDataResult(this.message);

  /// The text extracted by the [RequestData] command.
  final String message;

  /// Deserializes the result from JSON.
  static RequestDataResult fromJson(Map<String, dynamic> json) {
    return new RequestDataResult(json['message']);
  }

  @override
  Map<String, dynamic> toJson() => <String, String>{
    'message': message,
  };
}
