class CustomerModel {
  String? id;
  String? firstName;
  String? lastName;
  int? dni;
  String? address;
  int? totalVisits;

  CustomerModel(
      {this.id,
      this.firstName,
      this.lastName,
      this.dni,
      this.address,
      this.totalVisits});

  factory CustomerModel.fromMap({required Map dataMap}) => CustomerModel(
        id: dataMap["_id"],
        firstName: dataMap["firstName"],
        lastName: dataMap["lastName"],
        dni: dataMap["dni"],
        address: dataMap["address"],
        totalVisits: dataMap["totalVisits"],
      );

  Map<String, dynamic> toMap() {
    return {
      '_id': id,
      'firstName': firstName,
      'lastName': lastName,
      'dni': dni,
      'address': address,
      'totalVisits': totalVisits
    };
  }

  Map<String, dynamic> toUpdateMap() {
    return {
      '_id': id,
      'firstName': firstName,
      'lastName': lastName,
      'dni': dni,
      'address': address,
    };
  }

  static List<CustomerModel> toList(List dataListMap) {
    List<CustomerModel> pepito = dataListMap.map((index) {
      return CustomerModel.fromMap(dataMap: index);
    }).toList();

    return pepito;
  }
}
