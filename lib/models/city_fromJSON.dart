import 'dart:convert';

City cityFromJson(String str) => City.fromJson(json.decode(str));

String cityToJson(City data) => json.encode(data.toJson());

class City {
  City({
    this.meta,
    this.data,
  });

  Meta meta;
  List<Datum> data;

  factory City.fromJson(Map<String, dynamic> json) => City(
    meta: Meta.fromJson(json["meta"]),
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "meta": meta.toJson(),
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    this.type,
    this.subType,
    this.name,
    this.detailedName,
    this.id,
    this.self,
    this.timeZoneOffset,
    this.iataCode,
    this.geoCode,
    this.address,
  });

  String type;
  String subType;
  String name;
  String detailedName;
  String id;
  Self self;
  String timeZoneOffset;
  String iataCode;
  GeoCode geoCode;
  Address address;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    type: json["type"],
    subType: json["subType"],
    name: json["name"],
    detailedName: json["detailedName"],
    id: json["id"],
    self: Self.fromJson(json["self"]),
    timeZoneOffset: json["timeZoneOffset"],
    iataCode: json["iataCode"],
    geoCode: GeoCode.fromJson(json["geoCode"]),
    address: Address.fromJson(json["address"]),
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "subType": subType,
    "name": name,
    "detailedName": detailedName,
    "id": id,
    "self": self.toJson(),
    "timeZoneOffset": timeZoneOffset,
    "iataCode": iataCode,
    "geoCode": geoCode.toJson(),
    "address": address.toJson(),
  };
}

class Address {
  Address({
    this.cityName,
    this.cityCode,
    this.countryName,
    this.countryCode,
    this.stateCode,
    this.regionCode,
  });

  String cityName;
  String cityCode;
  String countryName;
  String countryCode;
  String stateCode;
  String regionCode;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
    cityName: json["cityName"],
    cityCode: json["cityCode"],
    countryName: json["countryName"],
    countryCode: json["countryCode"],
    stateCode: json["stateCode"],
    regionCode: json["regionCode"],
  );

  Map<String, dynamic> toJson() => {
    "cityName": cityName,
    "cityCode": cityCode,
    "countryName": countryName,
    "countryCode": countryCode,
    "stateCode": stateCode,
    "regionCode": regionCode,
  };
}

class GeoCode {
  GeoCode({
    this.latitude,
    this.longitude,
  });

  double latitude;
  double longitude;

  factory GeoCode.fromJson(Map<String, dynamic> json) => GeoCode(
    latitude: json["latitude"].toDouble(),
    longitude: json["longitude"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "latitude": latitude,
    "longitude": longitude,
  };
}

class Self {
  Self({
    this.href,
    this.methods,
  });

  String href;
  List<String> methods;

  factory Self.fromJson(Map<String, dynamic> json) => Self(
    href: json["href"],
    methods: List<String>.from(json["methods"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "href": href,
    "methods": List<dynamic>.from(methods.map((x) => x)),
  };
}

class Meta {
  Meta({
    this.count,
    this.links,
  });

  int count;
  Links links;

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
    count: json["count"],
    links: Links.fromJson(json["links"]),
  );

  Map<String, dynamic> toJson() => {
    "count": count,
    "links": links.toJson(),
  };
}

class Links {
  Links({
    this.self,
  });

  String self;

  factory Links.fromJson(Map<String, dynamic> json) => Links(
    self: json["self"],
  );

  Map<String, dynamic> toJson() => {
    "self": self,
  };
}
