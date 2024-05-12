class Variables {
  static const address = '127.0.0.1:8000';

  static const baseUrl = "http://" + address + "/api/";
  static const String REGISTRATION = baseUrl + "token/";
  static const String LOGIN = baseUrl + "token/";
  static const String IS_VALIDE_VERIFICATION_CODE =
      baseUrl + "is-valide-verification-code/";
  static const String RESEND_VERIFICATION_CODE =
      baseUrl + "re-send-verification-code/";
  static const String DELETE_ACCOUNT = baseUrl + "delete-account/";
  static const String FORGOT_PASSWORD = baseUrl + "forgot-password/";
  static const String RENEW_PASSWORD = baseUrl + "renew-password/";
  static const String UPDATE_PASSWORD = baseUrl + "update-password/";
  static const String UPDATE_PHONE_NUMBER = baseUrl + "update-phone-number/";
  static const String UPDATE_WHATSAPP = baseUrl + "update-whatsapp/";
  static const String CATEGORIES = baseUrl + "categories/";
  static const String POPULAR_CATEGORIES = baseUrl + "popular-categories/";
  static const String GET_PROVIDERS = baseUrl + "get-providers/";
  static const String GET_PROVIDER_INFO = baseUrl + "get-provider-info/";
  static const String REQUEST_PROVIDER = baseUrl + "request-provider/";
  static const String ORDERS = baseUrl + "orders/";
  static const String CONFIRM_PAYMENT = baseUrl + "confirm-payment/";
  static const String SET_FIRE_BASE_TOKEN = baseUrl + "set-firebase-token/";
  static const String GET_TOP_NOTIFICATIONS =
      baseUrl + "get-my-top-notifications/";
  static const String GET_PROMOTIONS =
      baseUrl + "get-promotions/";

  static const String appName = 'applanguefront';
  static const String logo = 'assets/images/logo.png';


}
