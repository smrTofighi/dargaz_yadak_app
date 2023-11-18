class UserModel {
  String? fullName;
  String? mobile;
  String? address;
  dynamic postalCode;
  String? nationalCode;
  String? provinceId;

  UserModel({
    this.fullName,
    this.mobile,
    this.address,
    this.postalCode,
    this.nationalCode,
    this.provinceId,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    fullName = json["full_name"];
    mobile = json["mobile"];
    address = json["address"];
    postalCode = json["postal_code"];
    nationalCode = json["national_code"];
    provinceId = json["province_id"];
  }
}
