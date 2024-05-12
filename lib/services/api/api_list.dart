
class ApiList {

  static const address = '127.0.0.1:8000';

  static const baseUrl = "http://$address/api/";
  static const String REGISTRATION = "token/";
  static const String LOGIN = "token/";
  static const String IS_VALIDE_VERIFICATION_CODE =
      "is-valide-verification-code/";
  static const String RESEND_VERIFICATION_CODE =
      "re-send-verification-code/";
  static const String DELETE_ACCOUNT = "delete-account/";
  static const String FORGOT_PASSWORD = "forgot-password/";
  static const String RENEW_PASSWORD = "renew-password/";
  static const String UPDATE_PASSWORD = "update-password/";
  static const String UPDATE_PHONE_NUMBER = "update-phone-number/";
  static const String UPDATE_WHATSAPP = "update-whatsapp/";
  static const String CATEGORIES = "categories/";
  static const String POPULAR_CATEGORIES = "popular-categories/";
  static const String GET_PROVIDERS = "get-providers/";
  static const String GET_PROVIDER_INFO = "get-provider-info/";
  static const String REQUEST_PROVIDER = "request-provider/";
  static const String ORDERS = "orders/";
  static const String CONFIRM_PAYMENT = "confirm-payment/";
  static const String SET_FIRE_BASE_TOKEN = "set-firebase-token/";
  static const String GET_TOP_NOTIFICATIONS =
      "get-my-top-notifications/";
  static const String GET_PROMOTIONS =
      "get-promotions/";
}