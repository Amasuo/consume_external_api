import 'dart:convert';

Flight flightFromJson(String str) => Flight.fromJson(json.decode(str));

String flightToJson(Flight data) => json.encode(data.toJson());

class Flight {
  Flight({
    this.meta,
    this.data,
    this.dictionaries,
  });

  Meta meta;
  List<Datum> data;
  Dictionaries dictionaries;

  factory Flight.fromJson(Map<String, dynamic> json) => Flight(
    meta: Meta.fromJson(json["meta"]),
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    dictionaries: Dictionaries.fromJson(json["dictionaries"]),
  );

  Map<String, dynamic> toJson() => {
    "meta": meta.toJson(),
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "dictionaries": dictionaries.toJson(),
  };
}

class Datum {
  Datum({
    this.type,
    this.id,
    this.source,
    this.instantTicketingRequired,
    this.nonHomogeneous,
    this.oneWay,
    this.lastTicketingDate,
    this.numberOfBookableSeats,
    this.itineraries,
    this.price,
    this.pricingOptions,
    this.validatingAirlineCodes,
    this.travelerPricings,
  });

  String type;
  String id;
  String source;
  bool instantTicketingRequired;
  bool nonHomogeneous;
  bool oneWay;
  DateTime lastTicketingDate;
  int numberOfBookableSeats;
  List<Itinerary> itineraries;
  DatumPrice price;
  PricingOptions pricingOptions;
  List<String> validatingAirlineCodes;
  List<TravelerPricing> travelerPricings;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    type: json["type"],
    id: json["id"],
    source: json["source"],
    instantTicketingRequired: json["instantTicketingRequired"],
    nonHomogeneous: json["nonHomogeneous"],
    oneWay: json["oneWay"],
    lastTicketingDate: DateTime.parse(json["lastTicketingDate"]),
    numberOfBookableSeats: json["numberOfBookableSeats"],
    itineraries: List<Itinerary>.from(json["itineraries"].map((x) => Itinerary.fromJson(x))),
    price: DatumPrice.fromJson(json["price"]),
    pricingOptions: PricingOptions.fromJson(json["pricingOptions"]),
    validatingAirlineCodes: List<String>.from(json["validatingAirlineCodes"].map((x) => x)),
    travelerPricings: List<TravelerPricing>.from(json["travelerPricings"].map((x) => TravelerPricing.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "id": id,
    "source": source,
    "instantTicketingRequired": instantTicketingRequired,
    "nonHomogeneous": nonHomogeneous,
    "oneWay": oneWay,
    "lastTicketingDate": "${lastTicketingDate.year.toString().padLeft(4, '0')}-${lastTicketingDate.month.toString().padLeft(2, '0')}-${lastTicketingDate.day.toString().padLeft(2, '0')}",
    "numberOfBookableSeats": numberOfBookableSeats,
    "itineraries": List<dynamic>.from(itineraries.map((x) => x.toJson())),
    "price": price.toJson(),
    "pricingOptions": pricingOptions.toJson(),
    "validatingAirlineCodes": List<dynamic>.from(validatingAirlineCodes.map((x) => x)),
    "travelerPricings": List<dynamic>.from(travelerPricings.map((x) => x.toJson())),
  };
}

class Itinerary {
  Itinerary({
    this.duration,
    this.segments,
  });

  String duration;
  List<Segment> segments;

  factory Itinerary.fromJson(Map<String, dynamic> json) => Itinerary(
    duration: json["duration"],
    segments: List<Segment>.from(json["segments"].map((x) => Segment.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "duration": duration,
    "segments": List<dynamic>.from(segments.map((x) => x.toJson())),
  };
}

class Segment {
  Segment({
    this.departure,
    this.arrival,
    this.carrierCode,
    this.number,
    this.aircraft,
    this.operating,
    this.duration,
    this.id,
    this.numberOfStops,
    this.blacklistedInEu,
  });

  Arrival departure;
  Arrival arrival;
  String carrierCode;
  String number;
  Aircraft aircraft;
  Operating operating;
  String duration;
  String id;
  int numberOfStops;
  bool blacklistedInEu;

  factory Segment.fromJson(Map<String, dynamic> json) => Segment(
    departure: Arrival.fromJson(json["departure"]),
    arrival: Arrival.fromJson(json["arrival"]),
    carrierCode: json["carrierCode"],
    number: json["number"],
    aircraft: Aircraft.fromJson(json["aircraft"]),
    operating: Operating.fromJson(json["operating"]),
    duration: json["duration"],
    id: json["id"],
    numberOfStops: json["numberOfStops"],
    blacklistedInEu: json["blacklistedInEU"],
  );

  Map<String, dynamic> toJson() => {
    "departure": departure.toJson(),
    "arrival": arrival.toJson(),
    "carrierCode": carrierCode,
    "number": number,
    "aircraft": aircraft.toJson(),
    "operating": operating.toJson(),
    "duration": duration,
    "id": id,
    "numberOfStops": numberOfStops,
    "blacklistedInEU": blacklistedInEu,
  };
}

class Aircraft {
  Aircraft({
    this.code,
  });

  String code;

  factory Aircraft.fromJson(Map<String, dynamic> json) => Aircraft(
    code: json["code"],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
  };
}

class Arrival {
  Arrival({
    this.iataCode,
    this.terminal,
    this.at,
  });

  String iataCode;
  String terminal;
  DateTime at;

  factory Arrival.fromJson(Map<String, dynamic> json) => Arrival(
    iataCode: json["iataCode"],
    terminal: json["terminal"] == null ? null : json["terminal"],
    at: DateTime.parse(json["at"]),
  );

  Map<String, dynamic> toJson() => {
    "iataCode": iataCode,
    "terminal": terminal == null ? null : terminal,
    "at": at.toIso8601String(),
  };
}

class Operating {
  Operating({
    this.carrierCode,
  });

  String carrierCode;

  factory Operating.fromJson(Map<String, dynamic> json) => Operating(
    carrierCode: '',//json["carrierCode"],
  );

  Map<String, dynamic> toJson() => {
    "carrierCode": carrierCode,
  };
}

class DatumPrice {
  DatumPrice({
    this.currency,
    this.total,
    this.base,
    this.fees,
    this.grandTotal,
  });

  String currency;
  String total;
  String base;
  List<Fee> fees;
  String grandTotal;

  factory DatumPrice.fromJson(Map<String, dynamic> json) => DatumPrice(
    currency: json["currency"],
    total: json["total"],
    base: json["base"],
    fees: List<Fee>.from(json["fees"].map((x) => Fee.fromJson(x))),
    grandTotal: json["grandTotal"],
  );

  Map<String, dynamic> toJson() => {
    "currency": currency,
    "total": total,
    "base": base,
    "fees": List<dynamic>.from(fees.map((x) => x.toJson())),
    "grandTotal": grandTotal,
  };
}

class Fee {
  Fee({
    this.amount,
    this.type,
  });

  String amount;
  String type;

  factory Fee.fromJson(Map<String, dynamic> json) => Fee(
    amount: json["amount"],
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "amount": amount,
    "type": type,
  };
}

class PricingOptions {
  PricingOptions({
    this.fareType,
    this.includedCheckedBagsOnly,
  });

  List<String> fareType;
  bool includedCheckedBagsOnly;

  factory PricingOptions.fromJson(Map<String, dynamic> json) => PricingOptions(
    fareType: List<String>.from(json["fareType"].map((x) => x)),
    includedCheckedBagsOnly: json["includedCheckedBagsOnly"],
  );

  Map<String, dynamic> toJson() => {
    "fareType": List<dynamic>.from(fareType.map((x) => x)),
    "includedCheckedBagsOnly": includedCheckedBagsOnly,
  };
}

class TravelerPricing {
  TravelerPricing({
    this.travelerId,
    this.fareOption,
    this.travelerType,
    this.price,
    this.fareDetailsBySegment,
  });

  String travelerId;
  String fareOption;
  String travelerType;
  TravelerPricingPrice price;
  List<FareDetailsBySegment> fareDetailsBySegment;

  factory TravelerPricing.fromJson(Map<String, dynamic> json) => TravelerPricing(
    travelerId: json["travelerId"],
    fareOption: json["fareOption"],
    travelerType: json["travelerType"],
    price: TravelerPricingPrice.fromJson(json["price"]),
    fareDetailsBySegment: List<FareDetailsBySegment>.from(json["fareDetailsBySegment"].map((x) => FareDetailsBySegment.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "travelerId": travelerId,
    "fareOption": fareOption,
    "travelerType": travelerType,
    "price": price.toJson(),
    "fareDetailsBySegment": List<dynamic>.from(fareDetailsBySegment.map((x) => x.toJson())),
  };
}

class FareDetailsBySegment {
  FareDetailsBySegment({
    this.segmentId,
    this.cabin,
    this.fareBasis,
    this.fareDetailsBySegmentClass,
    this.includedCheckedBags,
  });

  String segmentId;
  String cabin;
  String fareBasis;
  String fareDetailsBySegmentClass;
  IncludedCheckedBags includedCheckedBags;

  factory FareDetailsBySegment.fromJson(Map<String, dynamic> json) => FareDetailsBySegment(
    segmentId: json["segmentId"],
    cabin: json["cabin"],
    fareBasis: json["fareBasis"],
    fareDetailsBySegmentClass: json["class"],
    includedCheckedBags: IncludedCheckedBags.fromJson(json["includedCheckedBags"]),
  );

  Map<String, dynamic> toJson() => {
    "segmentId": segmentId,
    "cabin": cabin,
    "fareBasis": fareBasis,
    "class": fareDetailsBySegmentClass,
    "includedCheckedBags": includedCheckedBags.toJson(),
  };
}

class IncludedCheckedBags {
  IncludedCheckedBags({
    this.weight,
    this.weightUnit,
  });

  int weight;
  String weightUnit;

  factory IncludedCheckedBags.fromJson(Map<String, dynamic> json) => IncludedCheckedBags(
    weight: json["weight"],
    weightUnit: json["weightUnit"],
  );

  Map<String, dynamic> toJson() => {
    "weight": weight,
    "weightUnit": weightUnit,
  };
}

class TravelerPricingPrice {
  TravelerPricingPrice({
    this.currency,
    this.total,
    this.base,
  });

  String currency;
  String total;
  String base;

  factory TravelerPricingPrice.fromJson(Map<String, dynamic> json) => TravelerPricingPrice(
    currency: json["currency"],
    total: json["total"],
    base: json["base"],
  );

  Map<String, dynamic> toJson() => {
    "currency": currency,
    "total": total,
    "base": base,
  };
}

class Dictionaries {
  Dictionaries({
    this.locations,
    this.aircraft,
    this.currencies,
    this.carriers,
  });

  Map<String, Location> locations;
  Map<String, String> aircraft;
  Currencies currencies;
  Carriers carriers;

  factory Dictionaries.fromJson(Map<String, dynamic> json) => Dictionaries(
    locations: {},//Map.from(json["locations"]).map((k, v) => MapEntry<String, Location>(k, Location.fromJson(v))),
    aircraft: {},//Map.from(json["aircraft"]).map((k, v) => MapEntry<String, String>(k, v)),
    currencies: Currencies.fromJson({}),//json["currencies"]),
    carriers: Carriers.fromJson({}),//json["carriers"]),
  );

  Map<String, dynamic> toJson() => {
    "locations": Map.from(locations).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
    "aircraft": Map.from(aircraft).map((k, v) => MapEntry<String, dynamic>(k, v)),
    "currencies": currencies.toJson(),
    "carriers": carriers.toJson(),
  };
}

class Carriers {
  Carriers({
    this.pr,
  });

  String pr;

  factory Carriers.fromJson(Map<String, dynamic> json) => Carriers(
    pr: json["PR"],
  );

  Map<String, dynamic> toJson() => {
    "PR": pr,
  };
}

class Currencies {
  Currencies({
    this.eur,
  });

  String eur;

  factory Currencies.fromJson(Map<String, dynamic> json) => Currencies(
    eur: json["EUR"],
  );

  Map<String, dynamic> toJson() => {
    "EUR": eur,
  };
}

class Location {
  Location({
    this.cityCode,
    this.countryCode,
  });

  String cityCode;
  String countryCode;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    cityCode: json["cityCode"],
    countryCode: json["countryCode"],
  );

  Map<String, dynamic> toJson() => {
    "cityCode": cityCode,
    "countryCode": countryCode,
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
