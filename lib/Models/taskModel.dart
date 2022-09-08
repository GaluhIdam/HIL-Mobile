import 'dart:convert';

Task taskFromJson(String str) => Task.fromJson(json.decode(str));

String taskToJson(Task data) => json.encode(data.toJson());

class Task {
  Task({
    required this.status,
    required this.message,
    required this.data,
  });

  bool status;
  String message;
  Data data;

  factory Task.fromJson(Map<String, dynamic> json) => Task(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.currentPage,
    required this.data,
    required this.firstPageUrl,
    required this.from,
    required this.lastPage,
    required this.lastPageUrl,
    required this.links,
    required this.nextPageUrl,
    required this.path,
    required this.perPage,
    required this.prevPageUrl,
    required this.to,
    required this.total,
  });

  int currentPage;
  List<Datum> data;
  String firstPageUrl;
  int from;
  int lastPage;
  String lastPageUrl;
  List<Link> links;
  String nextPageUrl;
  String path;
  int perPage;
  dynamic prevPageUrl;
  int to;
  int total;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        currentPage: json["current_page"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        firstPageUrl: json["first_page_url"],
        from: json["from"],
        lastPage: json["last_page"],
        lastPageUrl: json["last_page_url"],
        links: List<Link>.from(json["links"].map((x) => Link.fromJson(x))),
        nextPageUrl: json["next_page_url"],
        path: json["path"],
        perPage: json["per_page"],
        prevPageUrl: json["prev_page_url"],
        to: json["to"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "first_page_url": firstPageUrl,
        "from": from,
        "last_page": lastPage,
        "last_page_url": lastPageUrl,
        "links": List<dynamic>.from(links.map((x) => x.toJson())),
        "next_page_url": nextPageUrl,
        "path": path,
        "per_page": perPage,
        "prev_page_url": prevPageUrl,
        "to": to,
        "total": total,
      };
}

class Datum {
  Datum({
    required this.id,
    required this.userId,
    required this.itemId,
    required this.subject,
    required this.flightNumber,
    required this.aircraftType,
    required this.aircraftRegistration,
    required this.station,
    required this.stationCode,
    required this.ata,
    required this.faultCode,
    required this.sequenceNumber,
    required this.category,
    required this.techlog,
    required this.option,
    required this.status,
    required this.ref,
    required this.refDdg,
    required this.description,
    required this.partNumber,
    required this.partName,
    required this.dueStatus,
    required this.dueDate,
    required this.dateOccured,
    required this.createdAt,
    required this.updatedAt,
    required this.optionName,
    required this.categoryName,
    required this.statusName,
  });

  int id;
  int userId;
  String itemId;
  String subject;
  String flightNumber;
  String aircraftType;
  String aircraftRegistration;
  String station;
  String stationCode;
  String ata;
  String faultCode;
  String sequenceNumber;
  int category;
  String techlog;
  int option;
  int status;
  String ref;
  String refDdg;
  String description;
  String partNumber;
  String partName;
  DateTime dueStatus;
  DateTime dueDate;
  DateTime dateOccured;
  DateTime createdAt;
  DateTime updatedAt;
  String optionName;
  String categoryName;
  String statusName;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        userId: json["user_id"],
        itemId: json["item_id"],
        subject: json["subject"],
        flightNumber: json["flight_number"],
        aircraftType: json["aircraft_type"],
        aircraftRegistration: json["aircraft_registration"],
        station: json["station"],
        stationCode: json["station_code"],
        ata: json["ata"],
        faultCode: json["fault_code"],
        sequenceNumber: json["sequence_number"],
        category: json["category"],
        techlog: json["techlog"],
        option: json["option"],
        status: json["status"],
        ref: json["ref"],
        refDdg: json["ref_ddg"],
        description: json["description"],
        partNumber: json["part_number"],
        partName: json["part_name"],
        dueStatus: DateTime.parse(json["due_status"]),
        dueDate: DateTime.parse(json["due_date"]),
        dateOccured: DateTime.parse(json["date_occured"]),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        optionName: json["option_name"],
        categoryName: json["category_name"],
        statusName: json["status_name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "item_id": itemId,
        "subject": subject,
        "flight_number": flightNumber,
        "aircraft_type": aircraftType,
        "aircraft_registration": aircraftRegistration,
        "station": station,
        "station_code": stationCode,
        "ata": ata,
        "fault_code": faultCode,
        "sequence_number": sequenceNumber,
        "category": category,
        "techlog": techlog,
        "option": option,
        "status": status,
        "ref": ref,
        "ref_ddg": refDdg,
        "description": description,
        "part_number": partNumber,
        "part_name": partName,
        "due_status": dueStatus.toIso8601String(),
        "due_date": dueDate.toIso8601String(),
        "date_occured": dateOccured.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "option_name": optionName,
        "category_name": categoryName,
        "status_name": statusName,
      };
}

class Link {
  Link({
    required this.url,
    required this.label,
    required this.active,
  });

  String url;
  String label;
  bool active;

  factory Link.fromJson(Map<String, dynamic> json) => Link(
        url: json["url"] == null ? null : json["url"],
        label: json["label"],
        active: json["active"],
      );

  Map<String, dynamic> toJson() => {
        "url": url == null ? null : url,
        "label": label,
        "active": active,
      };
}
