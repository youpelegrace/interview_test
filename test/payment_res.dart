class PaymentMethodMockResponse {
  static var paymentMethodRes = {
    "responseCode": "get_payment_types_per_country_ok",
    "message": "2 payment type(s) found",
    "data": [
      {
        "id": 1,
        "code": "MOMO",
        "title_en": "Mobile Money",
        "title_fr": "Mobile Money",
        "description_en": "Instantly - 3.1% Telco Fees",
        "min_amount": 0,
        "description_fr": "Instantanément - 3.1% de frais",
        "icon_image": ""
      },
      {
        "id": 2,
        "code": "BAC",
        "title_en": "Bank",
        "title_fr": "Banque",
        "description_en": "1 business Day",
        "min_amount": 0,
        "description_fr": "1 jour ouvrable",
        "icon_image": ""
      }
    ]
  };
}
