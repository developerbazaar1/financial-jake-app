class ServiceModal {
  String? categoryName;
  List<Services>? services;

  ServiceModal({this.categoryName, this.services});

  ServiceModal.fromJson(Map<String, dynamic> json) {
    categoryName = json['category_name'];
    if (json['services'] != null) {
      services = <Services>[];
      json['services'].forEach((v) {
        services!.add(new Services.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category_name'] = this.categoryName;
    if (this.services != null) {
      data['services'] = this.services!.map((v) => v.toJson()).toList();
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['service_name'] = this.serviceName;
    data['rating'] = this.rating;
    data['total_review'] = this.totalReview;
    data['address'] = this.address;
    data['distance'] = this.distance;
    return data;
  }
}
