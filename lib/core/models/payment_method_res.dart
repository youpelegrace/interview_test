class PaymentMethodRes {
  String? responseCode;
  String? message;
  List<Data>? data;

  PaymentMethodRes({this.responseCode, this.message, this.data});

  PaymentMethodRes.fromJson(Map<String, dynamic> json)
      : responseCode = json['responseCode'] as String?,
        message = json['message'] as String?,
        data = (json['data'] as List<dynamic>?)
            ?.map((v) => Data.fromJson(v as Map<String, dynamic>))
            .toList();

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'responseCode': responseCode,
      'message': message,
    };
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? code;
  String? titleEn;
  String? titleFr;
  String? descriptionEn;
  int? minAmount;
  String? descriptionFr;
  String? iconImage;

  Data({
    this.id,
    this.code,
    this.titleEn,
    this.titleFr,
    this.descriptionEn,
    this.minAmount,
    this.descriptionFr,
    this.iconImage,
  });

  Data.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        code = json['code'] as String?,
        titleEn = json['title_en'] as String?,
        titleFr = json['title_fr'] as String?,
        descriptionEn = json['description_en'] as String?,
        minAmount = json['min_amount'] as int?,
        descriptionFr = json['description_fr'] as String?,
        iconImage = json['icon_image'] as String?;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'id': id,
      'code': code,
      'title_en': titleEn,
      'title_fr': titleFr,
      'description_en': descriptionEn,
      'min_amount': minAmount,
      'description_fr': descriptionFr,
      'icon_image': iconImage,
    };
    return data;
  }
}
