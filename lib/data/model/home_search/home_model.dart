import 'package:json_annotation/json_annotation.dart';

part 'home_model.g.dart';

@JsonSerializable()
class HomeModel {
  HomeModel({
    required this.bdxid,
    required this.bdxCommunityId,
    required this.name,
    this.planImage,
    this.type,
    this.address,
    this.city,
    this.state,
    this.zip,
    required this.basePrice,
    required this.bedrooms,
    required this.baths,
    required this.baseSquareFeet,
    required this.garage,
    required this.stories,
    this.masterBedLocation,
    this.virtualTour,
    required this.planType,
    required this.livingAreas,
    this.diningAreas,
    this.basement,
    this.envisionDesignCenter,
    this.description,
    this.vendorReference,
    required this.hasEnvisionUrl,
    required this.siteId,
    this.communityVendorReference,
    this.builderListingUrl,
    this.status,
    required this.halfBath,
    required this.selfGuidedTour,
    required this.brandId,
    required this.parentBdxCommunityId,
    required this.builderBdxid,
    this.phone,
    required this.brandName,
    this.error,
    required this.id,
  });

  @JsonKey(name: "BDXID")
  int bdxid;
  @JsonKey(name: "BDXCommunityID")
  int bdxCommunityId;
  @JsonKey(name: "Name")
  String name;
  @JsonKey(name: "PlanImage")
  String? planImage;
  @JsonKey(name: "Type")
  String? type;
  @JsonKey(name: "Address")
  String? address;
  @JsonKey(name: "City")
  String? city;
  @JsonKey(name: "State")
  String? state;
  @JsonKey(name: "Zip")
  String? zip;
  @JsonKey(name: "BasePrice")
  double basePrice;
  @JsonKey(name: "Bedrooms")
  int? bedrooms;
  @JsonKey(name: "Baths")
  double baths;
  @JsonKey(name: "BaseSquareFeet")
  int? baseSquareFeet;
  @JsonKey(name: "Garage")
  double garage;
  @JsonKey(name: "Stories")
  int? stories;
  @JsonKey(name: "MasterBedLocation")
  String? masterBedLocation;
  @JsonKey(name: "VirtualTour")
  String? virtualTour;
  @JsonKey(name: "PlanType")
  String? planType;
  @JsonKey(name: "LivingAreas")
  int? livingAreas;
  @JsonKey(name: "DiningAreas")
  dynamic diningAreas;
  @JsonKey(name: "Basement")
  dynamic basement;
  @JsonKey(name: "EnvisionDesignCenter")
  String? envisionDesignCenter;
  @JsonKey(name: "Description")
  String? description;
  @JsonKey(name: "VendorReference")
  String? vendorReference;
  @JsonKey(name: "HasEnvisionURL")
  bool hasEnvisionUrl;
  @JsonKey(name: "SiteID")
  int? siteId;
  @JsonKey(name: "CommunityVendorReference")
  String? communityVendorReference;
  @JsonKey(name: "BuilderListingURL")
  String? builderListingUrl;
  @JsonKey(name: "Status")
  String? status;
  @JsonKey(name: "HalfBath")
  double halfBath;
  @JsonKey(name: "SelfGuidedTour")
  bool selfGuidedTour;
  @JsonKey(name: "BrandId")
  int? brandId;
  @JsonKey(name: "ParentBDXCommunityID")
  int? parentBdxCommunityId;
  @JsonKey(name: "BuilderBDXID")
  int? builderBdxid;
  @JsonKey(name: "Phone")
  String? phone;
  @JsonKey(name: "BrandName")
  String brandName;
  @JsonKey(name: "Error")
  String? error;
  @JsonKey(name: "ID")
  int? id;

  String get homeSpec {
    var result = "";

    if ((baseSquareFeet ?? 0) > 0) {
      result = result + "$baseSquareFeet sq.ft.";
    }
    if (result.isNotEmpty) {
      if ((bedrooms ?? 0) > 0) {
        result = result + " / $bedrooms Br";
      }
    } else {
      result = result + "$bedrooms Br";
    }

    if (result.isNotEmpty) {
      if (baths > 0) {
        result = result + " / ${baths.truncate()} Ba";
      }
    } else {
      result = result + "${baths.truncate()} Ba";
    }

    if (result.isNotEmpty) {
      if (baths > 0) {
        result = result + " / ${garage.truncate()} Gr";
      }
    } else {
      result = result + "${garage.truncate()} Gr";
    }

    return result;
  }

// all keys are present inside model which comes from response
  factory HomeModel.fromJson(Map<String, dynamic> json) =>
      _$HomeModelFromJson(json);

  Map<String, dynamic> toJson() => _$HomeModelToJson(this);
}
