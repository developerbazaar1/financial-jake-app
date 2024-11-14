class ServiceListModal {
  String? name;
  String? logo;
  String? coverPage;
  String? description;
  String? addressFirst;
  String? addressSecond;
  String? county;
  String? eirCode;
  String? yearOfEstimation;
  String? registrationNumber;
  String? email;
  int? phoneNumber;
  String? website;
  List<Services>? services;
  BusinessHours? businessHours;
  List? images;
  List<Faq>? faq;
  SocialMedia? socialMedia;
  List<Qualifications>? qualifications;
  List<Certifications>? certifications;
  String? country; // New field added

  ServiceListModal({
    this.name,
    this.logo,
    this.coverPage,
    this.description,
    this.addressFirst,
    this.addressSecond,
    this.county,
    this.eirCode,
    this.yearOfEstimation,
    this.registrationNumber,
    this.email,
    this.phoneNumber,
    this.website,
    this.services,
    this.businessHours,
    this.images,
    this.faq,
    this.socialMedia,
    this.qualifications,
    this.certifications,
    this.country,
  });

  ServiceListModal.empty()
      : this(
    name: '',
    logo: '',
    coverPage: '',
    description: '',
    addressFirst: '',
    addressSecond: '',
    county: '',
    eirCode: '',
    yearOfEstimation: '',
    registrationNumber: '',
    email: '',
    phoneNumber: 0,
    website: '',
    services: [],
    businessHours: BusinessHours.empty(),
    images: [],
    faq: [],
    socialMedia: SocialMedia.empty(),
    qualifications: [],
    certifications: [],
    country: '',
  );

  ServiceListModal.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    logo = json['logo'];
    coverPage = json['coverPage'];
    description = json['description'];
    addressFirst = json['addressFirst'];
    addressSecond = json['addressSecond'];
    county = json['county'];
    eirCode = json['eirCode'];
    yearOfEstimation = json['yearOfEstimation'];
    registrationNumber = json['registrationNumber'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    website = json['website'];
    services = (json['services'] as List?)?.map((v) => Services.fromJson(v)).toList();
    businessHours = json['businessHours'] != null ? BusinessHours.fromJson(json['businessHours']) : null;
    images = json['images']?.cast<String>();
    faq = (json['faq'] as List?)?.map((v) => Faq.fromJson(v)).toList();
    socialMedia = json['socialMedia'] != null ? SocialMedia.fromJson(json['socialMedia']) : null;
    qualifications = (json['qualifications'] as List?)?.map((v) => Qualifications.fromJson(v)).toList();
    certifications = (json['certifications'] as List?)?.map((v) => Certifications.fromJson(v)).toList();
    country = json['country'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['logo'] = logo;
    data['coverPage'] = coverPage;
    data['description'] = description;
    data['addressFirst'] = addressFirst;
    data['addressSecond'] = addressSecond;
    data['county'] = county;
    data['eirCode'] = eirCode;
    data['yearOfEstimation'] = yearOfEstimation;
    data['registrationNumber'] = registrationNumber;
    data['email'] = email;
    data['phoneNumber'] = phoneNumber;
    data['website'] = website;
    data['services'] = services?.map((v) => v.toJson()).toList();
    data['businessHours'] = businessHours?.toJson();
    data['images'] = images;
    data['faq'] = faq?.map((v) => v.toJson()).toList();
    data['socialMedia'] = socialMedia?.toJson();
    data['qualifications'] = qualifications?.map((v) => v.toJson()).toList();
    data['certifications'] = certifications?.map((v) => v.toJson()).toList();
    data['country'] = country;
    return data;
  }

  ServiceListModal.fromSnapshot(Map<String, dynamic> snapshot) : this.fromJson(snapshot);
}

class Services {
  String? serviceType;
  String? customService;
  String? serviceCategory;
  List<Details>? details;

  Services({
    this.serviceType,
    this.customService,
    this.serviceCategory,
    this.details,
  });

  Services.empty()
      : this(
    serviceType: '',
    customService: '',
    serviceCategory: '',
    details: [],
  );

  Services.fromJson(Map<String, dynamic> json) {
    serviceType = json['serviceType'];
    customService = json['customService'];
    serviceCategory = json['serviceCategory'];
    details = (json['details'] as List?)?.map((v) => Details.fromJson(v)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['serviceType'] = serviceType;
    data['customService'] = customService;
    data['serviceCategory'] = serviceCategory;
    data['details'] = details?.map((v) => v.toJson()).toList();
    return data;
  }
}

class Details {
  String? serviceTitle;
  String? serviceDescriptionFirst;
  String? serviceDescriptionSecond;
  String? serviceDescriptionThird;
  String? serviceImage; // Changed to a single String field
  String? estimatedPrice;
  String? estimatedTime;

  Details({
    this.serviceTitle,
    this.serviceDescriptionFirst,
    this.serviceDescriptionSecond,
    this.serviceDescriptionThird,
    this.serviceImage,
    this.estimatedPrice,
    this.estimatedTime,
  });

  Details.empty()
      : this(
    serviceTitle: '',
    serviceDescriptionFirst: '',
    serviceDescriptionSecond: '',
    serviceDescriptionThird: '',
    serviceImage: '',
    estimatedPrice: '',
    estimatedTime: '',
  );

  Details.fromJson(Map<String, dynamic> json) {
    serviceTitle = json['serviceTitle'];
    serviceDescriptionFirst = json['serviceDescriptionFirst'];
    serviceDescriptionSecond = json['serviceDescriptionSecond'];
    serviceDescriptionThird = json['serviceDescriptionThird'];
    serviceImage = json['serviceImage'];
    estimatedPrice = json['estimatedPrice'];
    estimatedTime = json['estimatedTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['serviceTitle'] = serviceTitle;
    data['serviceDescriptionFirst'] = serviceDescriptionFirst;
    data['serviceDescriptionSecond'] = serviceDescriptionSecond;
    data['serviceDescriptionThird'] = serviceDescriptionThird;
    data['serviceImage'] = serviceImage;
    data['estimatedPrice'] = estimatedPrice;
    data['estimatedTime'] = estimatedTime;
    return data;
  }
}

class BusinessHours {
  Sunday? sunday;
  Sunday? monday;
  Sunday? tuesday;
  Sunday? wednesday;
  Sunday? thursday;
  Sunday? friday;
  Sunday? saturday;

  BusinessHours({
    this.sunday,
    this.monday,
    this.tuesday,
    this.wednesday,
    this.thursday,
    this.friday,
    this.saturday,
  });

  BusinessHours.empty()
      : this(
    sunday: Sunday.empty(),
    monday: Sunday.empty(),
    tuesday: Sunday.empty(),
    wednesday: Sunday.empty(),
    thursday: Sunday.empty(),
    friday: Sunday.empty(),
    saturday: Sunday.empty(),
  );

  BusinessHours.fromJson(Map<String, dynamic> json) {
    sunday = json['sunday'] != null ? Sunday.fromJson(json['sunday']) : null;
    monday = json['monday'] != null ? Sunday.fromJson(json['monday']) : null;
    tuesday = json['tuesday'] != null ? Sunday.fromJson(json['tuesday']) : null;
    wednesday = json['wednesday'] != null ? Sunday.fromJson(json['wednesday']) : null;
    thursday = json['thursday'] != null ? Sunday.fromJson(json['thursday']) : null;
    friday = json['friday'] != null ? Sunday.fromJson(json['friday']) : null;
    saturday = json['saturday'] != null ? Sunday.fromJson(json['saturday']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['sunday'] = sunday?.toJson();
    data['monday'] = monday?.toJson();
    data['tuesday'] = tuesday?.toJson();
    data['wednesday'] = wednesday?.toJson();
    data['thursday'] = thursday?.toJson();
    data['friday'] = friday?.toJson();
    data['saturday'] = saturday?.toJson();
    return data;
  }
}

class Sunday {
  bool? isOpen;
  String? openingTime;
  String? closingTime;

  Sunday({
    this.isOpen,
    this.openingTime,
    this.closingTime,
  });

  Sunday.empty() : this(isOpen: false, openingTime: '', closingTime: '');

  Sunday.fromJson(Map<String, dynamic> json) {
    isOpen = json['isOpen'];
    openingTime = json['openingTime'];
    closingTime = json['closingTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['isOpen'] = isOpen;
    data['openingTime'] = openingTime;
    data['closingTime'] = closingTime;
    return data;
  }
}

class Faq {
  String? question;
  String? answer;

  Faq({this.question, this.answer});

  Faq.empty() : this(question: '', answer: '');

  Faq.fromJson(Map<String, dynamic> json) {
    question = json['question'];
    answer = json['answer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['question'] = question;
    data['answer'] = answer;
    return data;
  }
}

class SocialMedia {
  String? instagram;
  String? facebook;

  SocialMedia({this.instagram, this.facebook});

  SocialMedia.empty() : this(instagram: '', facebook: '');

  SocialMedia.fromJson(Map<String, dynamic> json) {
    instagram = json['instagram'];
    facebook = json['facebook'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['instagram'] = instagram;
    data['facebook'] = facebook;
    return data;
  }
}

class Qualifications {
  String? qualification;
  String? awardingBody;

  Qualifications({this.qualification, this.awardingBody});

  Qualifications.empty() : this(qualification: '', awardingBody: '');

  Qualifications.fromJson(Map<String, dynamic> json) {
    qualification = json['qualification'];
    awardingBody = json['awardingBody'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['qualification'] = qualification;
    data['awardingBody'] = awardingBody;
    return data;
  }
}

class Certifications {
  String? certificate;
  String? issuingBody;

  Certifications({this.certificate, this.issuingBody});

  Certifications.empty() : this(certificate: '', issuingBody: '');

  Certifications.fromJson(Map<String, dynamic> json) {
    certificate = json['certificate'];
    issuingBody = json['issuingBody'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['certificate'] = certificate;
    data['issuingBody'] = issuingBody;
    return data;
  }
}
