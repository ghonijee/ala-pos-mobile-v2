abstract class ApiResponse {
  final bool? status;
  final String? message;
  final dynamic? data;

  ApiResponse({this.status, this.message, this.data});

  @override
  String toString() => "data: $data , message: $message , status: $status";
}

class SuccessResponse extends ApiResponse {
  SuccessResponse({status, message, data}) : super(status: status, message: message, data: data);

  factory SuccessResponse.fromJson(Map<String, dynamic> json) => SuccessResponse(
        status: json["status"],
        data: json["data"],
        message: json["message"] ?? "",
      );
}

class FailedResponse extends ApiResponse {
  FailedResponse({status, message}) : super(status: status, message: message);

  factory FailedResponse.fromJson(Map<String, dynamic> json) => FailedResponse(
        status: json["status"],
        message: json["error"] ?? json['message'],
      );
}

class ErrorResponse extends ApiResponse {
  ErrorResponse({status, message}) : super(status: status, message: message);

  factory ErrorResponse.fromJson(Map<String, dynamic> json) => ErrorResponse(
        status: json["status"],
        message: json["error"],
      );
}
