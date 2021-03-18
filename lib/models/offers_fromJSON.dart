import 'dart:convert';

Offer offerFromJson(String str) => Offer.fromJson(json.decode(str));

String offerToJson(Offer data) => json.encode(data.toJson());

class Offer {
  Offer({
    this.data,
  });

  Data data;

  factory Offer.fromJson(Map<String, dynamic> json) => Offer(
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
  };
}

class Data {
  Data({
    this.type,
    this.hotel,
    this.available,
    this.offers,
  });

  String type;
  Hotel hotel;
  bool available;
  List<OfferElement> offers;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    type: "",//json["type"],
    hotel: Hotel.fromJson(json["hotel"]),
    available: json["available"],
    offers: List<OfferElement>.from(json["offers"].map((x) => OfferElement.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "hotel": hotel.toJson(),
    "available": available,
    "offers": List<dynamic>.from(offers.map((x) => x.toJson())),
  };
}

class Hotel {
  Hotel({
    this.type,
    this.hotelId,
    this.chainCode,
    this.dupeId,
    this.name,
    this.rating,
    this.cityCode,
    this.latitude,
    this.longitude,
    this.address,
    this.contact,
    this.description,
    this.amenities,
    this.media,
  });

  String type;
  String hotelId;
  String chainCode;
  String dupeId;
  String name;
  String rating;
  String cityCode;
  double latitude;
  double longitude;
  Address address;
  Contact contact;
  Description description;
  List<String> amenities;
  List<Media> media;

  factory Hotel.fromJson(Map<String, dynamic> json) => Hotel(
    type: json["type"],
    hotelId: json["hotelId"],
    chainCode: json["chainCode"],
    dupeId: json["dupeId"],
    name: json["name"],
    rating: json["rating"],
    cityCode: json["cityCode"],
    latitude: json["latitude"].toDouble(),
    longitude: json["longitude"].toDouble(),
    address: Address.fromJson(json["address"]),
    contact: Contact.fromJson(json["contact"]),
    description: Description.fromJson(json["description"]),
    amenities: List<String>.from(json["amenities"].map((x) => x)),
    media: [],//List<Media>.from(json["media"].map((x) => Media.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "hotelId": hotelId,
    "chainCode": chainCode,
    "dupeId": dupeId,
    "name": name,
    "rating": rating,
    "cityCode": cityCode,
    "latitude": latitude,
    "longitude": longitude,
    "address": address.toJson(),
    "contact": contact.toJson(),
    "description": description.toJson(),
    "amenities": List<dynamic>.from(amenities.map((x) => x)),
    "media": List<dynamic>.from(media.map((x) => x.toJson())),
  };
}

class Address {
  Address({
    this.lines,
    this.postalCode,
    this.cityName,
    this.countryCode,
  });

  List<String> lines;
  String postalCode;
  String cityName;
  String countryCode;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
    lines: List<String>.from(json["lines"].map((x) => x)),
    postalCode: json["postalCode"],
    cityName: json["cityName"],
    countryCode: json["countryCode"],
  );

  Map<String, dynamic> toJson() => {
    "lines": List<dynamic>.from(lines.map((x) => x)),
    "postalCode": postalCode,
    "cityName": cityName,
    "countryCode": countryCode,
  };
}

class Contact {
  Contact({
    this.phone,
    this.fax,
    this.email,
  });

  String phone;
  String fax;
  String email;

  factory Contact.fromJson(Map<String, dynamic> json) => Contact(
    phone: "",//json["phone"],
    fax: json["fax"],
    email: json["email"],
  );

  Map<String, dynamic> toJson() => {
    "phone": phone,
    "fax": fax,
    "email": email,
  };
}

class Description {
  Description({
    this.lang,
    this.text,
  });

  String lang;
  String text;

  factory Description.fromJson(Map<String, dynamic> json) => Description(
    lang: "",//json["lang"],
    text: ""//json["text"],
  );

  Map<String, dynamic> toJson() => {
    "lang": lang,
    "text": text,
  };
}

class Media {
  Media({
    this.uri,
    this.category,
  });

  String uri;
  String category;

  factory Media.fromJson(Map<String, dynamic> json) => Media(
    uri: json["uri"],
    category: json["category"],
  );

  Map<String, dynamic> toJson() => {
    "uri": uri,
    "category": category,
  };
}

class OfferElement {
  OfferElement({
    this.id,
    this.checkInDate,
    this.checkOutDate,
    this.rateCode,
    this.commission,
    this.boardType,
    this.room,
    this.guests,
    this.price,
    this.policies,
    this.self,
  });

  String id;
  DateTime checkInDate;
  DateTime checkOutDate;
  String rateCode;
  Commission commission;
  String boardType;
  Room room;
  Guests guests;
  Price price;
  Policies policies;
  String self;

  factory OfferElement.fromJson(Map<String, dynamic> json) => OfferElement(
    id: json["id"],
    checkInDate: DateTime.parse(json["checkInDate"]),
    checkOutDate: DateTime.parse(json["checkOutDate"]),
    rateCode: json["rateCode"],
    commission: Commission.fromJson({}),//json["commission"]),
    boardType: json["boardType"],
    room: Room.fromJson(json["room"]),
    guests: Guests.fromJson(json["guests"]),
    price: Price.fromJson(json["price"]),
    policies: Policies.fromJson(json["policies"]),
    self: json["self"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "checkInDate": "${checkInDate.year.toString().padLeft(4, '0')}-${checkInDate.month.toString().padLeft(2, '0')}-${checkInDate.day.toString().padLeft(2, '0')}",
    "checkOutDate": "${checkOutDate.year.toString().padLeft(4, '0')}-${checkOutDate.month.toString().padLeft(2, '0')}-${checkOutDate.day.toString().padLeft(2, '0')}",
    "rateCode": rateCode,
    "commission": commission.toJson(),
    "boardType": boardType,
    "room": room.toJson(),
    "guests": guests.toJson(),
    "price": price.toJson(),
    "policies": policies.toJson(),
    "self": self,
  };
}

class Commission {
  Commission({
    this.amount,
    this.percentage,
  });

  String amount;
  String percentage;

  factory Commission.fromJson(Map<String, dynamic> json) => Commission(
    amount: json["amount"],
    percentage: json["percentage"],
  );

  Map<String, dynamic> toJson() => {
    "amount": amount,
    "percentage": percentage,
  };
}

class Guests {
  Guests({
    this.adults,
  });

  int adults;

  factory Guests.fromJson(Map<String, dynamic> json) => Guests(
    adults: json["adults"],
  );

  Map<String, dynamic> toJson() => {
    "adults": adults,
  };
}

class Policies {
  Policies({
    this.guarantee,
    this.paymentType,
    this.cancellation,
  });

  Guarantee guarantee;
  String paymentType;
  Cancellation cancellation;

  factory Policies.fromJson(Map<String, dynamic> json) => Policies(
    guarantee: Guarantee.fromJson(json["guarantee"]),
    paymentType: json["paymentType"],
    cancellation: Cancellation.fromJson(json["cancellation"]),
  );

  Map<String, dynamic> toJson() => {
    "guarantee": guarantee.toJson(),
    "paymentType": paymentType,
    "cancellation": cancellation.toJson(),
  };
}

class Cancellation {
  Cancellation({
    this.deadline,
  });

  DateTime deadline;

  factory Cancellation.fromJson(Map<String, dynamic> json) => Cancellation(
    deadline: DateTime.now(),//parse(json["deadline"]),
  );

  Map<String, dynamic> toJson() => {
    "deadline": deadline.toIso8601String(),
  };
}

class Guarantee {
  Guarantee({
    this.acceptedPayments,
  });

  AcceptedPayments acceptedPayments;

  factory Guarantee.fromJson(Map<String, dynamic> json) => Guarantee(
    acceptedPayments: AcceptedPayments.fromJson({}),//json["acceptedPayments"]),
  );

  Map<String, dynamic> toJson() => {
    "acceptedPayments": acceptedPayments.toJson(),
  };
}

class AcceptedPayments {
  AcceptedPayments({
    this.creditCards,
    this.methods,
  });

  List<String> creditCards;
  List<String> methods;

  factory AcceptedPayments.fromJson(Map<String, dynamic> json) => AcceptedPayments(
    creditCards: List<String>.from([]),//json["creditCards"].map((x) => x)),
    methods: List<String>.from([]),//json["methods"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "creditCards": List<dynamic>.from([]),//creditCards.map((x) => x)),
    "methods": List<dynamic>.from([]),//methods.map((x) => x)),
  };
}

class Price {
  Price({
    this.currency,
    this.total,
    this.taxes,
    this.variations,
  });

  String currency;
  String total;
  List<Tax> taxes;
  Variations variations;

  factory Price.fromJson(Map<String, dynamic> json) => Price(
    currency: json["currency"],
    total: json["total"],
    taxes: [],//List<Tax>.from(json["taxes"].map((x) => Tax.fromJson(x))),
    variations: Variations.fromJson(json["variations"]),
  );

  Map<String, dynamic> toJson() => {
    "currency": currency,
    "total": total,
    "taxes": List<dynamic>.from(taxes.map((x) => x.toJson())),
    "variations": variations.toJson(),
  };
}

class Tax {
  Tax({
    this.code,
    this.pricingFrequency,
    this.pricingMode,
    this.amount,
    this.currency,
    this.included,
  });

  String code;
  String pricingFrequency;
  String pricingMode;
  String amount;
  String currency;
  bool included;

  factory Tax.fromJson(Map<String, dynamic> json) => Tax(
    code: json["code"],
    pricingFrequency: json["pricingFrequency"],
    pricingMode: json["pricingMode"],
    amount: json["amount"],
    currency: json["currency"],
    included: json["included"],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "pricingFrequency": pricingFrequency,
    "pricingMode": pricingMode,
    "amount": amount,
    "currency": currency,
    "included": included,
  };
}

class Variations {
  Variations({
    this.average,
    this.changes,
  });

  Average average;
  List<Change> changes;

  factory Variations.fromJson(Map<String, dynamic> json) => Variations(
    average: Average.fromJson(json["average"]),
    changes: List<Change>.from(json["changes"].map((x) => Change.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "average": average.toJson(),
    "changes": List<dynamic>.from(changes.map((x) => x.toJson())),
  };
}

class Average {
  Average({
    this.total,
  });

  String total;

  factory Average.fromJson(Map<String, dynamic> json) => Average(
    total: "",//json["total"],
  );

  Map<String, dynamic> toJson() => {
    "total": total,
  };
}

class Change {
  Change({
    this.startDate,
    this.endDate,
    this.total,
  });

  DateTime startDate;
  DateTime endDate;
  String total;

  factory Change.fromJson(Map<String, dynamic> json) => Change(
    startDate: DateTime.parse(json["startDate"]),
    endDate: DateTime.parse(json["endDate"]),
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "startDate": "${startDate.year.toString().padLeft(4, '0')}-${startDate.month.toString().padLeft(2, '0')}-${startDate.day.toString().padLeft(2, '0')}",
    "endDate": "${endDate.year.toString().padLeft(4, '0')}-${endDate.month.toString().padLeft(2, '0')}-${endDate.day.toString().padLeft(2, '0')}",
    "total": total,
  };
}

class Room {
  Room({
    this.type,
    this.typeEstimated,
    this.description,
  });

  String type;
  TypeEstimated typeEstimated;
  Description description;

  factory Room.fromJson(Map<String, dynamic> json) => Room(
    type: json["type"],
    typeEstimated: TypeEstimated.fromJson(json["typeEstimated"]),
    description: Description.fromJson(json["description"]),
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "typeEstimated": typeEstimated.toJson(),
    "description": description.toJson(),
  };
}

class TypeEstimated {
  TypeEstimated({
    this.category,
    this.beds,
    this.bedType,
  });

  String category;
  int beds;
  String bedType;

  factory TypeEstimated.fromJson(Map<String, dynamic> json) => TypeEstimated(
    category: json["category"],
    beds: json["beds"],
    bedType: json["bedType"],
  );

  Map<String, dynamic> toJson() => {
    "category": category,
    "beds": beds,
    "bedType": bedType,
  };
}
