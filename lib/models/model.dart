class Package {
  String title;
  String name;
  String surname;
  String phone;
  String adress_1;
  String adress_2;
  String city;
  String zip_code;
  String sate;

  bool isExpanded;

  Package({
    this.title,
    this.name,
    this.surname,
    this.phone,
    this.adress_1,
    this.adress_2,
    this.city,
    this.zip_code,
    this.sate,
    this.isExpanded: false,
  });

  factory Package.fromJson(Map<String, dynamic> json) => Package(
        isExpanded: false,
        title: json['title'],
        name: json['name'],
        surname: json['surname'],
        phone: json['phone'],
        adress_1: json['adress_1'],
        adress_2: json['adress_2'],
        city: json['city'],
        zip_code: json['zip_code'],
        sate: json['sate'],
      );

  Map<String, dynamic> toJson() => {
        'title': title,
        'isExpanded': isExpanded,
        'name': name,
        'surname': surname,
        'phone': phone,
        'adress_1': adress_1,
        'adress_2': adress_2,
        'city': city,
        'zip_code': zip_code,
        'sate': sate
      };
}
