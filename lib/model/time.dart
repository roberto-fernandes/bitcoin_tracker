class Time {
  String updated;
  String updatedISO;

  Time({this.updated, this.updatedISO});

  Time.fromJson(Map<String, dynamic> json) {
    updated = json['updated'];
    updatedISO = json['updatedISO'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['updated'] = this.updated;
    data['updatedISO'] = this.updatedISO;
    return data;
  }
}
