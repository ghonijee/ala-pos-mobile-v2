part of 'route_page.dart';

class RouteName {
  static const splashScreen = "Splashscreen";
  static const login = "login";
  static const register = "register";
  static const newStoreForm = "new/store/form";
  static const posWrapper = "pos/";
  static const posCustomProduct = "pos/custom/product";
  static const posProduct = "pos/product";
  static const posCart = "pos/cart";
  static const posCartItemDetail = "pos/cart/edit/:index";
  static const posOrderResume = "pos/order/resume";
  static const posPaymentCash = "pos/payment/cash";
  static const posOrderSuccess = "pos/order/success";
  static const posPrintReceipt = "pos/print/receipt";

  // Master Product
  static const product = "product/";
  static const productList = "product/list";
  static const productForm = "product/create";
  static const productScan = "product/scan";

  // Transaction
  static const transaction = "transaction/";
  static const transactionList = "transaction/list";
  static const transactionDetail = "transaction/detail";

  // Receipt
  static const receiptScreen = "receipt";

  // Profile
  static const profile = "profile";
  static const profileUser = "profile/user";
  static const profileUserForm = "profile/user/form";
  static const profileChangePassword = "profile/change-password";
  static const profileStoreForm = "profile/store/form";
  static const profileStoreList = "profile/store";
}
