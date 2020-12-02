
class InternationalService {
  var id;
  var name;
  var about;
  var phone;
  var city;
  var address;
  var long;
  var lat;


  InternationalService(
      {
        this.id,
        this.name,
        this.about,
        this.phone,
        this.city,
        this.address,
        this.long,
        this.lat,
      });

  factory InternationalService.fromJson(Map<String, dynamic> json) {
    return new InternationalService(
      id: json['user_id'] ,

      name: json['name'] ,
      about: json['about'],
      phone: json['phone'] ,
      city: json['city'] ,
      address: json['address'],
      long: json['long'] ,
      lat: json['lat'],

    );
  }
  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map['id'] = id;

    map['name'] = name;
    map['about'] = about;
    map['phone'] = phone;
    map['city'] = city;
    map['address'] = address;
    map['long'] = long;
    map['lat'] = lat;

    return map;
  }
  InternationalService.fromMap(Map<String, dynamic> map)
      :id = map['id'],
      name = map['name'],
        about = map['about'],
        phone = map['phone'],
        city = map['city'],
        address = map['address'],
        long = map['long'],
        lat = map['lat'];

  Map<String, dynamic> toJson() => <String, dynamic>{
    'id': id,
    'name': name,
    'about': about,
    'phone': phone,
    'city': city,
    'address': address,
    'long': long,
    'lat': lat
  };
}
