class Brand {
  final String id;
  final String name;
  final String description;
  final String logoUrl;
  final BrandLinks? links;
  final BrandContactInfo? contactInfo;

  const Brand({
    required this.id,
    required this.name,
    required this.description,
    required this.logoUrl,
    this.links,
    this.contactInfo,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'links': links?.toMap(),
      'contactInfo': contactInfo?.toMap(),
    };
  }

  factory Brand.fromMap(Map<String, dynamic> map) {
    return Brand(
      id: map['id'] as String,
      name: map['name'] as String,
      description: map['description'] as String,
      logoUrl: map['logoUrl'] as String,
      links: map['links'] as BrandLinks?,
      contactInfo: map['contactInfo'] as BrandContactInfo?,
    );
  }
}

class BrandLinks {
  final String? facebookPage;
  final String? instagramPage;
  final String? website;

  const BrandLinks({
    this.facebookPage,
    this.instagramPage,
    this.website,
  });

  Map<String, dynamic> toMap() {
    return {
      'facebookPage': facebookPage,
      'instagramPage': instagramPage,
      'website': website
    };
  }

  factory BrandLinks.fromMap(Map<String, dynamic> map) {
    return BrandLinks(
      facebookPage: map['facebookPage'] as String?,
      instagramPage: map['instagramPage'] as String?,
      website: map['website'] as String?,
    );
  }
}

class BrandContactInfo {
  final String emailAddress;
  final String phoneNumber;

  const BrandContactInfo(
      {required this.emailAddress, required this.phoneNumber});

  Map<String, dynamic> toMap() {
    return {'emailAddress': emailAddress, 'phoneNumber': phoneNumber};
  }

  factory BrandContactInfo.fromMap(Map<String, dynamic> map) {
    return BrandContactInfo(
      emailAddress: map['emailAddress'] as String,
      phoneNumber: map['phoneNumber'] as String,
    );
  }
}
