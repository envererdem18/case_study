import 'dart:convert';

class Customer {
  final String id;
  final String fullName;
  final String groceryName;
  final String district;
  final String city;
  final String avatar;
  Customer({
    this.id,
    this.fullName,
    this.groceryName,
    this.district,
    this.city,
    this.avatar,
  });

  Customer copyWith({
    String id,
    String fullName,
    String groceryName,
    String district,
    String city,
    String avatar,
  }) {
    return Customer(
      id: id ?? this.id,
      fullName: fullName ?? this.fullName,
      groceryName: groceryName ?? this.groceryName,
      district: district ?? this.district,
      city: city ?? this.city,
      avatar: avatar ?? this.avatar,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'fullName': fullName,
      'groceryName': groceryName,
      'district': district,
      'city': city,
      'avatar': avatar,
    };
  }

  static Customer fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Customer(
      id: map['id'],
      fullName: map['fullName'],
      groceryName: map['groceryName'],
      district: map['district'],
      city: map['city'],
      avatar: map['avatar'],
    );
  }

  String toJson() => json.encode(toMap());

  static Customer fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() {
    return 'Customer(id: $id, fullName: $fullName, groceryName: $groceryName, district: $district, city: $city, avatar: $avatar)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Customer &&
        o.id == id &&
        o.fullName == fullName &&
        o.groceryName == groceryName &&
        o.district == district &&
        o.city == city &&
        o.avatar == avatar;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        fullName.hashCode ^
        groceryName.hashCode ^
        district.hashCode ^
        city.hashCode ^
        avatar.hashCode;
  }
}

extension XCustomer on Customer {
  String get title => "${this.id} - ${this.groceryName} - ${this.fullName}";
}
