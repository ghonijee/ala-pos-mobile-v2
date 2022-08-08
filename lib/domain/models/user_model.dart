class UserModel {
  int? id;
  String? fullname;
  dynamic username;
  String? phone;
  dynamic email;
  dynamic emailVerifiedAt;
  int? isMember;
  dynamic userStatus;
  dynamic expiredDate;
  dynamic referalCode;
  dynamic imgProfilePath;
  dynamic imgProfileUrl;
  String? deviceName;
  DateTime? createdAt;
  DateTime? updatedAt;

  UserModel({
    this.id,
    this.fullname,
    this.username,
    this.phone,
    this.email,
    this.emailVerifiedAt,
    this.isMember,
    this.userStatus,
    this.expiredDate,
    this.referalCode,
    this.imgProfilePath,
    this.imgProfileUrl,
    this.deviceName,
    this.createdAt,
    this.updatedAt,
  });

  @override
  String toString() {
    return 'UserModel(id: $id, fullname: $fullname, username: $username, phone: $phone, email: $email, emailVerifiedAt: $emailVerifiedAt, isMember: $isMember, expiredDate: $expiredDate, referalCode: $referalCode, imgProfilePath: $imgProfilePath, imgProfileUrl: $imgProfileUrl, deviceName: $deviceName, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json['id'] as int?,
        fullname: json['fullname'] as String?,
        username: json['username'] as dynamic,
        phone: json['phone'] as String?,
        email: json['email'] as dynamic,
        emailVerifiedAt: json['email_verified_at'] as dynamic,
        isMember: json['is_member'] as int?,
        userStatus: json['user_status'] as dynamic,
        expiredDate: json['expired_date'] as dynamic,
        referalCode: json['referal_code'] as dynamic,
        imgProfilePath: json['img_profile_path'] as dynamic,
        imgProfileUrl: json['img_profile_url'] as dynamic,
        deviceName: json['device_name'] as String?,
        createdAt: json['created_at'] == null ? null : DateTime.parse(json['created_at'] as String),
        updatedAt: json['updated_at'] == null ? null : DateTime.parse(json['updated_at'] as String),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'fullname': fullname,
        'username': username,
        'phone': phone,
        'email': email,
        'email_verified_at': emailVerifiedAt,
        'is_member': isMember,
        'user_status': userStatus,
        'expired_date': expiredDate,
        'referal_code': referalCode,
        'img_profile_path': imgProfilePath,
        'img_profile_url': imgProfileUrl,
        'device_name': deviceName,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
      };
}
