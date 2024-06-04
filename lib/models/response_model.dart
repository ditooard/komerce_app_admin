class MyResponse<T> {
  int status;
  String message;
  T? data;

  MyResponse({this.status = 0, this.message = "", this.data});

  factory MyResponse.fromJson(
      Map<String, dynamic> json, Function fromJsonModel) {
    return MyResponse(
      status: json['status'],
      message: json['message'],
      // data: fromJsonModel(json['data']),
    );
  }
}
