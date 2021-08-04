class Classes {
  late String? id;
  late String classID;
  late String dateCreated;

  Classes({this.id, required this.classID, required this.dateCreated});

  Classes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    classID = json['classID'];
    dateCreated = json['dateCreated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['classID'] = this.classID;
    data['dateCreated'] = this.dateCreated;
    return data;
  }
}
