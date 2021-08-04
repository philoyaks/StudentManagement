class Students {
  late String? id;
  late String className;
  late String studentName;
  late String studentID;
  late String stdAddress;
  late String dateCreated;
  late String studentBirthday;

  Students(
      {this.id,
      required this.className,
      required this.studentName,
      required this.stdAddress,
      required this.studentID,
      required this.dateCreated,
      required this.studentBirthday});

  Students.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    className = json['className'];
    studentName = json['studentName'];
    stdAddress = json['stdAddress'];
    dateCreated = json['dateCreated'];
    studentID = json["studentID"];
    studentBirthday = json['studentBirthday'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['className'] = this.className;
    data['studentName'] = this.studentName;
    data['stdAddress'] = this.stdAddress;
    data['dateCreated'] = this.dateCreated;
    data['studentID'] = this.studentID;
    data['studentBirthday'] = this.studentBirthday;
    return data;
  }
}
