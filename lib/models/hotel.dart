// To parse this JSON data, do
//
//     final hotel = hotelFromJson(jsonString);

import 'dart:convert';

Hotel hotelFromJson(String str) => Hotel.fromJson(json.decode(str));

String hotelToJson(Hotel data) => json.encode(data.toJson());

class Hotel {
  Hotel({
    this.data,
    this.meta,
  });

  List<Datum> data;
  Meta meta;

  factory Hotel.fromJson(Map<String, dynamic> json) => Hotel(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    meta: Meta.fromJson(json["meta"]),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "meta": meta.toJson(),
  };
}

class Datum {
  Datum({
    this.type,
    this.hotel,
    this.available,
    this.offers,
    this.self,
  });

  String type;
  HotelClass hotel;
  bool available;
  List<Offer> offers;
  String self;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    type: json["type"],
    hotel: HotelClass.fromJson(json["hotel"]),
    available: json["available"],
    offers: List<Offer>.from(json["offers"].map((x) => Offer.fromJson(x))),
    self: json["self"],
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "hotel": hotel.toJson(),
    "available": available,
    "offers": List<dynamic>.from(offers.map((x) => x.toJson())),
    "self": self,
  };
}

class HotelClass {
  HotelClass({
    this.type,
    this.hotelId,
    this.chainCode,
    this.dupeId,
    this.name,
    this.rating,
    this.cityCode,
    this.latitude,
    this.longitude,
    this.hotelDistance,
    this.address,
    this.contact,
    this.amenities,
    this.media,
    this.description,
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
  HotelDistance hotelDistance;
  Address address;
  Contact contact;
  List<String> amenities;
  List<Media> media;
  Description description;

  factory HotelClass.fromJson(Map<String, dynamic> json) => HotelClass(
    type: json["type"],
    hotelId: json["hotelId"],
    chainCode: json["chainCode"],
    dupeId: json["dupeId"],
    name: json["name"],
    rating: json["rating"],
    cityCode: json["cityCode"],
    latitude: json["latitude"].toDouble(),
    longitude: json["longitude"].toDouble(),
    hotelDistance: HotelDistance.fromJson(json["hotelDistance"]),
    address: Address.fromJson(json["address"]),
    contact: Contact.fromJson(json["contact"]),
    amenities: []/*List<String>.from(json["amenities"].map((x) => x))*/,
    media: []/*List<Media>.from(json["media"].map((x) => Media.fromJson(x)))*/,
    description: json["description"] == null ? null : Description.fromJson(json["description"]),
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
    "hotelDistance": hotelDistance.toJson(),
    "address": address.toJson(),
    "contact": contact.toJson(),
    "amenities": List<dynamic>.from(amenities.map((x) => x)),
    "media": List<dynamic>.from(media.map((x) => x.toJson())),
    "description": description == null ? null : description.toJson(),
  };
}

class Address {
  Address({
    this.lines,
    this.cityName,
    this.countryCode,
    this.postalCode,
  });

  List<String> lines;
  String cityName;
  String countryCode;
  String postalCode;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
    lines: List<String>.from(json["lines"].map((x) => x)),
    cityName: json["cityName"],
    countryCode: json["countryCode"],
    postalCode: json["postalCode"] == null ? null : json["postalCode"],
  );

  Map<String, dynamic> toJson() => {
    "lines": List<dynamic>.from(lines.map((x) => x)),
    "cityName": cityName,
    "countryCode": countryCode,
    "postalCode": postalCode == null ? null : postalCode,
  };
}

class Contact {
  Contact({
    this.phone,
    this.fax,
  });

  String phone;
  String fax;

  factory Contact.fromJson(Map<String, dynamic> json) => Contact(
    phone: 'json["phone"]',
    fax: 'json["fax"]',
  );

  Map<String, dynamic> toJson() => {
    "phone": phone,
    "fax": fax,
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
    lang: json["lang"],
    text: json["text"],
  );

  Map<String, dynamic> toJson() => {
    "lang": lang,
    "text": text,
  };
}

class HotelDistance {
  HotelDistance({
    this.distance,
    this.distanceUnit,
  });

  double distance;
  String distanceUnit;

  factory HotelDistance.fromJson(Map<String, dynamic> json) => HotelDistance(
    distance: json["distance"].toDouble(),
    distanceUnit: json["distanceUnit"],
  );

  Map<String, dynamic> toJson() => {
    "distance": distance,
    "distanceUnit": distanceUnit,
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

class Offer {
  Offer({
    this.id,
    this.rateCode,
    this.room,
    this.guests,
    this.price,
    this.rateFamilyEstimated,
  });

  String id;
  String rateCode;
  Room room;
  Guests guests;
  Price price;
  RateFamilyEstimated rateFamilyEstimated;

  factory Offer.fromJson(Map<String, dynamic> json) => Offer(
    id: json["id"],
    rateCode: json["rateCode"],
    room: Room.fromJson(json["room"]),
    guests: Guests.fromJson(json["guests"]),
    price: Price.fromJson(json["price"]),
    rateFamilyEstimated: json["rateFamilyEstimated"] == null ? null : RateFamilyEstimated.fromJson(json["rateFamilyEstimated"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "rateCode": rateCode,
    "room": room.toJson(),
    "guests": guests.toJson(),
    "price": price.toJson(),
    "rateFamilyEstimated": rateFamilyEstimated == null ? null : rateFamilyEstimated.toJson(),
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

class Price {
  Price({
    this.currency,
    this.base,
    this.total,
    this.variations,
  });

  String currency;
  String base;
  String total;
  Variations variations;

  factory Price.fromJson(Map<String, dynamic> json) => Price(
    currency: json["currency"],
    base: json["base"],
    total: json["total"],
    variations: Variations.fromJson(json["variations"]),
  );

  Map<String, dynamic> toJson() => {
    "currency": currency,
    "base": base,
    "total": total,
    "variations": variations.toJson(),
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
    this.base,
  });

  String base;

  factory Average.fromJson(Map<String, dynamic> json) => Average(
    base: json["base"],
  );

  Map<String, dynamic> toJson() => {
    "base": base,
  };
}

class Change {
  Change({
    this.startDate,
    this.endDate,
    this.base,
  });

  DateTime startDate;
  DateTime endDate;
  String base;

  factory Change.fromJson(Map<String, dynamic> json) => Change(
    startDate: DateTime.parse(json["startDate"]),
    endDate: DateTime.parse(json["endDate"]),
    base: json["base"],
  );

  Map<String, dynamic> toJson() => {
    "startDate": "${startDate.year.toString().padLeft(4, '0')}-${startDate.month.toString().padLeft(2, '0')}-${startDate.day.toString().padLeft(2, '0')}",
    "endDate": "${endDate.year.toString().padLeft(4, '0')}-${endDate.month.toString().padLeft(2, '0')}-${endDate.day.toString().padLeft(2, '0')}",
    "base": base,
  };
}

class RateFamilyEstimated {
  RateFamilyEstimated({
    this.code,
    this.type,
  });

  String code;
  String type;

  factory RateFamilyEstimated.fromJson(Map<String, dynamic> json) => RateFamilyEstimated(
    code: json["code"],
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "type": type,
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
    typeEstimated: json["typeEstimated"] == null ? null : TypeEstimated.fromJson(json["typeEstimated"]),
    description: Description.fromJson(json["description"]),
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "typeEstimated": typeEstimated == null ? null : typeEstimated.toJson(),
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

class Meta {
  Meta({
    this.links,
  });

  Links links;

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
    links: Links.fromJson(json["links"]),
  );

  Map<String, dynamic> toJson() => {
    "links": links.toJson(),
  };
}

class Links {
  Links({
    this.next,
  });

  String next;

  factory Links.fromJson(Map<String, dynamic> json) => Links(
    next: json["next"],
  );

  Map<String, dynamic> toJson() => {
    "next": next,
  };
}
