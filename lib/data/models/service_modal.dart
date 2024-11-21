class ServiceModal {
  String? categoryName;
  List<Services>? services;

  ServiceModal({this.categoryName, this.services});

  ServiceModal.fromJson(Map<String, dynamic> json) {
    categoryName = json['category_name'];
    if (json['services'] != null) {
      services = <Services>[];
      json['services'].forEach((v) {
        services!.add(Services.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['category_name'] = categoryName;
    if (services != null) {
      data['services'] = services!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Services {
  String? image;
  String? serviceName;
  double? rating;
  int? totalReview;
  String? address;
  String? distance;

  Services(
      {this.image,
      this.serviceName,
      this.rating,
      this.totalReview,
      this.address,
      this.distance});

  Services.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    serviceName = json['service_name'];
    rating = json['rating'];
    totalReview = json['total_review'];
    address = json['address'];
    distance = json['distance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['image'] = image;
    data['service_name'] = serviceName;
    data['rating'] = rating;
    data['total_review'] = totalReview;
    data['address'] = address;
    data['distance'] = distance;
    return data;
  }
}
