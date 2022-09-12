class CheckoutModel {
   String street, city, state, country, phone, totalPrice, date;

  CheckoutModel({
     this.street,
     this.city,
     this.state,
     this.country,
     this.phone,
     this.totalPrice,
     this.date,
  });

  CheckoutModel.fromJson(Map<dynamic, dynamic> map) {
    street = map['street'];
    city = map['city'];
    state = map['state'];
    country = map['country'];
    phone = map['phone'];
    totalPrice = map['totalPrice'];
    date = map['date'];
  }

  toJson() {
    return {
      'street': street,
      'city': city,
      'state': state,
      'country': country,
      'phone': phone,
      'totalPrice': totalPrice,
      'date': date,
    };
  }
}
