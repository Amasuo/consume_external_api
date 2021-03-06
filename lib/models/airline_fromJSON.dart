import 'dart:convert';

Airline airlineFromJson(String str) => Airline.fromJson(json.decode(str));

String airlineToJson(Airline data) => json.encode(data.toJson());

class Airline {
  Airline({
    this.meta,
    this.data,
  });

  Meta meta;
  List<Datum> data;

  factory Airline.fromJson(Map<String, dynamic> json) => Airline(
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
    this.iataCode,
    this.icaoCode,
    this.businessName,
    this.commonName,
  });

  String type;
  String iataCode;
  String icaoCode;
  String businessName;
  String commonName;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    type: json["type"],
    iataCode: json["iataCode"],
    icaoCode: json["icaoCode"],
    businessName: json["businessName"],
    commonName: json["commonName"],
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "iataCode": iataCode,
    "icaoCode": icaoCode,
    "businessName": businessName,
    "commonName": commonName,
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
