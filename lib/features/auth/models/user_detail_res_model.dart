class UserDetailsResModel {
  String? id;
  String? username;
  String? firstName;
  String? lastName;
  String? email;
  bool? emailVerified;
  Attributes? attributes;
  Null? userProfileMetadata;
  Null? self;
  Null? origin;
  int? createdTimestamp;
  bool? enabled;
  bool? totp;
  Null? federationLink;
  Null? serviceAccountClientId;
  Null? credentials;
  List<Null>? disableableCredentialTypes;
  List<Null>? requiredActions;
  Null? federatedIdentities;
  Null? realmRoles;
  Null? clientRoles;
  Null? clientConsents;
  int? notBefore;
  Null? applicationRoles;
  Null? socialLinks;
  Null? groups;
  Access? access;

  UserDetailsResModel({
    this.id,
    this.username,
    this.firstName,
    this.lastName,
    this.email,
    this.emailVerified,
    this.attributes,
    this.userProfileMetadata,
    this.self,
    this.origin,
    this.createdTimestamp,
    this.enabled,
    this.totp,
    this.federationLink,
    this.serviceAccountClientId,
    this.credentials,
    this.disableableCredentialTypes,
    this.requiredActions,
    this.federatedIdentities,
    this.realmRoles,
    this.clientRoles,
    this.clientConsents,
    this.notBefore,
    this.applicationRoles,
    this.socialLinks,
    this.groups,
    this.access,
  });

  UserDetailsResModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    emailVerified = json['emailVerified'];
    attributes = json['attributes'] != null
        ? new Attributes.fromJson(json['attributes'])
        : null;
    userProfileMetadata = json['userProfileMetadata'];
    self = json['self'];
    origin = json['origin'];
    createdTimestamp = json['createdTimestamp'];
    enabled = json['enabled'];
    totp = json['totp'];
    federationLink = json['federationLink'];
    serviceAccountClientId = json['serviceAccountClientId'];
    credentials = json['credentials'];
    if (json['disableableCredentialTypes'] != null) {
      disableableCredentialTypes = <Null>[];
      json['disableableCredentialTypes'].forEach((v) {
        // disableableCredentialTypes!.add(new Null.fromJson(v));
      });
    }
    if (json['requiredActions'] != null) {
      requiredActions = <Null>[];
      json['requiredActions'].forEach((v) {
        // requiredActions!.add(new Null.fromJson(v));
      });
    }
    federatedIdentities = json['federatedIdentities'];
    realmRoles = json['realmRoles'];
    clientRoles = json['clientRoles'];
    clientConsents = json['clientConsents'];
    notBefore = json['notBefore'];
    applicationRoles = json['applicationRoles'];
    socialLinks = json['socialLinks'];
    groups = json['groups'];
    access = json['access'] != null
        ? new Access.fromJson(json['access'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['username'] = this.username;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['email'] = this.email;
    data['emailVerified'] = this.emailVerified;
    if (this.attributes != null) {
      data['attributes'] = this.attributes!.toJson();
    }
    data['userProfileMetadata'] = this.userProfileMetadata;
    data['self'] = this.self;
    data['origin'] = this.origin;
    data['createdTimestamp'] = this.createdTimestamp;
    data['enabled'] = this.enabled;
    data['totp'] = this.totp;
    data['federationLink'] = this.federationLink;
    data['serviceAccountClientId'] = this.serviceAccountClientId;
    data['credentials'] = this.credentials;
    data['federatedIdentities'] = this.federatedIdentities;
    data['realmRoles'] = this.realmRoles;
    data['clientRoles'] = this.clientRoles;
    data['clientConsents'] = this.clientConsents;
    data['notBefore'] = this.notBefore;
    data['applicationRoles'] = this.applicationRoles;
    data['socialLinks'] = this.socialLinks;
    data['groups'] = this.groups;
    if (this.access != null) {
      data['access'] = this.access!.toJson();
    }
    return data;
  }
}

class Attributes {
  List<String>? phoneNumber;
  List<String>? countryCode;
  List<String>? dateOfBirth;
  List<String>? middleName;

  Attributes({
    this.phoneNumber,
    this.countryCode,
    this.dateOfBirth,
    this.middleName,
  });

  Attributes.fromJson(Map<String, dynamic> json) {
    phoneNumber = json['phoneNumber'].cast<String>();
    countryCode = json['countryCode'].cast<String>();
    dateOfBirth = json['dateOfBirth'].cast<String>();
    middleName = json['middleName'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['phoneNumber'] = this.phoneNumber;
    data['countryCode'] = this.countryCode;
    data['dateOfBirth'] = this.dateOfBirth;
    data['middleName'] = this.middleName;
    return data;
  }
}

class Access {
  bool? manageGroupMembership;
  bool? view;
  bool? mapRoles;
  bool? impersonate;
  bool? manage;

  Access({
    this.manageGroupMembership,
    this.view,
    this.mapRoles,
    this.impersonate,
    this.manage,
  });

  Access.fromJson(Map<String, dynamic> json) {
    manageGroupMembership = json['manageGroupMembership'];
    view = json['view'];
    mapRoles = json['mapRoles'];
    impersonate = json['impersonate'];
    manage = json['manage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['manageGroupMembership'] = this.manageGroupMembership;
    data['view'] = this.view;
    data['mapRoles'] = this.mapRoles;
    data['impersonate'] = this.impersonate;
    data['manage'] = this.manage;
    return data;
  }
}
