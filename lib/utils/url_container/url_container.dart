class UrlContainer {
  static const String domainUrl =
  // 'https://demo.savari.ai'; //YOUR WEBSITE DOMAIN URL HERE
      'https://www.savari.ai'; //YOUR WEBSITE DOMAIN URL HERE
  static const String baseUrl = '$domainUrl/api/';
  static const String dashBoardEndPoint = 'dashboard';
  static const String depositHistoryUrl = 'deposit/history';
  static const String depositMethodUrl = 'deposit/methods';
  static const String addMoneyUrl = 'add-money';
  static const String BOPBankLink = 'bank';
  static const String getPaymentStatus = 'bank-payments';

  static const String registrationEndPoint = 'register';
  static const String loginEndPoint = 'login';
  static const String socialLoginEndPoint = 'social-login';
  static const String logoutUrl = 'logout';

  static const String forgetPasswordEndPoint = 'password/email';
  static const String passwordVerifyEndPoint = 'password/verify-code';
  static const String resetPasswordEndPoint = 'password/reset';

  static const String verify2FAUrl = 'verify-g2fa';
  static const String otpVerify = 'otp-verify';
  static const String otpResend = 'otp-resend';

  static const String verifyEmailEndPoint = 'verify-email';
  static const String verifySmsEndPoint = 'verify-mobile';
  static const String verifyMobileLogin = 'verify-mobile-login';
  static const String resendVerifyCodeEndPoint = 'resend-verify/';
  static const String resendVerifyCodeMobileLoginEndPoint = 'resend-otp/';
  static const String authorizationCodeEndPoint = 'authorization';
  static const String dashBoardUrl = 'dashboard';
  static const String driversListUrl = 'drivers-list';
  static const String paymentHistoryEndpoint = 'payment/history';

  static const String addWithdrawRequestUrl = 'withdraw-request';
  static const String withdrawMethodUrl = 'withdraw-method';
  static const String withdrawRequestConfirm = 'withdraw-request/confirm';
  static const String withdrawHistoryUrl = 'withdraw/history';
  static const String withdrawStoreUrl = 'withdraw/store/';
  static const String withdrawConfirmScreenUrl = 'withdraw/preview/';
  static const String kycFormUrl = 'kyc-form';
  static const String kycSubmitUrl = 'kyc-submit';

  static const String generalSettingEndPoint = 'general-setting';
  static const String userDeleteEndPoint = 'delete-account';
  static const String privacyPolicyEndPoint = 'policies';
  static const String getProfileEndPoint = 'user-info';
  static const String updateProfileEndPoint = 'profile-setting';
  static const String profileCompleteEndPoint = 'user-data-submit';
  static const String faq = "faq";

  static const String changePasswordEndPoint = 'change-password';
  static const String countryEndPoint = 'get-countries';
  static const String deviceTokenEndPoint = 'save-device-token';
  static const String languageUrl = 'language/';

  static const String ride = 'ride';
  static const String rideDetails = '$ride/details';
  static const String ridePayment = '$ride/payment';
  static const String rideFareAndDistance = '$ride/fare-and-distance';
  static const String createRide = '$ride/create';

  static const String sosRide = '$ride/sos';
  static const String reviewRide = 'review';
  static const String getDriverReview = 'get-driver-review';
  static const String rideList = '$ride/list';

  static const String activeRide = '$ride/active';
  static const String completedRide = '$ride/completed';
  static const String canceledRide = '$ride/canceled';

  static const String rideMessageList = '$ride/messages';
  static const String sendMessage = '$ride/send/message';
  static const String rideBidList = '$ride/bids';
  static const String acceptBid = '$ride/accept';
  static const String rejectBid = '$ride/reject';
  static const String cancelBid = '$ride/cancel';

  // coupon

  static const String reference = 'reference';
  static const String couponList = 'coupons';
  static const String applyCoupon = 'apply-coupon';
  static const String removeCoupon = 'remove-coupon';

  static const String paymentGateways = 'payment-gateways';
  static const String submitPayment = 'payment';
  static const String paymentHistory = 'payment/history';
  static const String pusherAuthenticate = 'pusher/auth/';

  static const String supportMethodsEndPoint = 'support/method';
  static const String supportListEndPoint = 'ticket';
  static const String storeSupportEndPoint = 'ticket/create';
  static const String supportViewEndPoint = 'ticket/view';
  static const String supportReplyEndPoint = 'ticket/reply';
  static const String supportCloseEndPoint = 'ticket/close';
  static const String supportDownloadEndPoint = 'ticket/download';

  //////////////////// Seller Mode /////////////////////

  static const String getSellerAds = 'seller';
  static const String storeSellerData = 'store-seller-data';
  static const String sellerAdDelete = 'seller-delete';
  static const String sellerFilter = 'seller-filter';
  static const String getVehicleFormData = 'vehicle-form-data';
  static const String getSellerOffer = 'seller-offer';
  static const String sellerSendMessage = 'seller/seller-message/send/';
  static const String getConversation = 'seller/conversation/';
  static const String getMessagesList = 'seller/messages';
  static const String getSellerAdsPrice = 'seller-ads';



  //////////////////// Buyer Mode /////////////////////

  static const String getAllAds = 'buyer';
  static const String buyerFilter = 'buyer-filter';
  static const String addSellerCounters = 'seller-counters';
  static const String addBuyerReview = 'buyer-review';
  static const String getAllBuyerReview = 'buyer-review';
  static const String getBrands = 'brands';




  //////////////////// Lend Mode /////////////////////

  static const String storeLenderData = 'store-lender-data';
  static const String lender = 'lender';
  static const String lenderFilter = 'lender-filter';
  static const String lenderDelete = 'lender-delete';




  //////////////////// Rent Mode /////////////////////

  static const String rent = 'rent';
  static const String rentFilter = 'rent-filter';
  static const String lenderCounters = 'lender-counters';
  static const String getRentConversation = 'lender/conversation';
  static const String getRentMessagesList = 'lender/messages';
  static const String rentSendMessage = 'lender/lender-message/send/';
  static const String addLendAdReview = 'rent-review';
  static const String getAllRentReview = 'rent-review';



  ///// //////////////////// Store Mode /////////////////////



  //////My Store
  static const String createMyStore = 'store-data';
  static const String getMyStore = 'store';
  static const String addProduct = 'store-product';
  static const String getStoreProduct = 'store-product';
  static const String getMyStoreOrder = 'store-orders/';
  static const String orderStatus = 'order-status';
  static const String getStoreOrdersReview = 'store-orders-review/';
  static const String getMyStoreDashboard = 'store-dashboard';
  static const String getStoreSellerConversation = 'store/seller-conversation';
  static const String deleteStoreProduct = 'store-product-delete';
  static const String getStoreOrderFilter = 'store-product-filter/';




  static const String getStoreCategories = 'store-categories';
  static const String addToCartData = 'cart-data';
  static const String getCart = 'cart';
  static const String clearCart= 'cart-data-remove/';
  static const String cartQuantityUpdate= 'cart-update/';
  static const String orderData= 'order-data';
  static const String getOrders= 'orders';
  static const String addStoreProductReview= 'store-product-review';
  static const String getStoreProductReview= 'store-product-review';
  static const String getStoreProductDetails= 'store-product-details';
  static const String getWalletsData= 'wallets-data';
  static const String getStoreUserConversation= 'store/buyer-conversation';
  static const String getStoreUserMessage= 'store/messages';
  static const String storeSendMessage= 'store/store-message/send/';
  static const String addMessageViewCount= 'store-counter-data';
  static const String getUserOrderFilter= 'store-order-filter';
  static const String getUserWallet= 'user-wallets';
  static const String sendUserTransactions= 'user-transactions';





  static const String supportImagePath = '$domainUrl/assets/support/';

  static const String userImagePath = '$domainUrl/assets/support/';

  static const String serviceImagePath = '$domainUrl/assets/images/service/';

  static const String countryFlagImageLink =
      'https://flagpedia.net/data/flags/h24/{countryCode}.webp';


}
