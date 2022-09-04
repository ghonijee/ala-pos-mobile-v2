enum StoreKey {
  token,
  expireTime,
  user,
  locale,
}

class Constant {
  static const token = "TOKEN";
  static const userLogin = "USER_LOGIN";
  static const userModel = "USER_MODEL";
  static const mainStore = "MAIN_STORE";
  static const userRole = "USER_ROLE";
  static const userPermissionList = "USER_PERMISSION_LIST";
  static const storeCategoryList = "STORE_CATEGORY_LIST";
}

class UserStatus {
  static const FREE = "Free";
  static const TRIAL = "Trial";
  static const PRO = "Pro";
}
