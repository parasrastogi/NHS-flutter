import 'package:json_annotation/json_annotation.dart';
import 'community_version_model.dart';
part 'community_model.g.dart';

@JsonSerializable()
class CommunityModel {
  int ID;
  int BDXID;
  @JsonKey(name: 'BDXBuilderID')
  int bdxBuilderID;
  @JsonKey(name: 'PartnerName')
  String? partnerName;
  @JsonKey(name: 'PartnerID')
  int partnerId;
  @JsonKey(name: 'CurrentDBVersion')
  int currentDBVersion;
  @JsonKey(name: 'CommunityImage')
  String? communityImage;
  @JsonKey(name: 'maximumPrice')
  double maximumPrice;
  @JsonKey(name: 'minimumPrice')
  double minimumPrice;
  @JsonKey(name: 'HasVideos')
  bool hasVideos;
  @JsonKey(name: 'MasterPlanID')
  int? masterPlanID;
  @JsonKey(name: 'MarketID')
  int marketID;
  @JsonKey(name: 'CustomDescription')
  String? customDescription;
  @JsonKey(name: 'SubDescription')
  String? subDescription;
  @JsonKey(name: 'Phone')
  String? phone;
  @JsonKey(name: 'Longitude')
  double longitude;
  @JsonKey(name: 'Latitude')
  double latitude;
  @JsonKey(name: 'BrandLogoSmall')
  String? brandLogoSmall;
  @JsonKey(name: 'BrandLogoMedium')
  String? brandLogoMedium;
  @JsonKey(name: 'Zip')
  String? zip;
  @JsonKey(name: 'State')
  String? state;
  @JsonKey(name: 'SqftLow')
  String? sqftLow;
  @JsonKey(name: 'SqftHigh')
  String? sqftHigh;
  @JsonKey(name: 'City')
  String? city;
  @JsonKey(name: 'Address')
  String? address;
  @JsonKey(name: 'Name')
  String? name;
  @JsonKey(name: 'EnvisionDesignCenter')
  String? envisionDesignCenter;
  @JsonKey(name: 'Hours')
  String? hours;
  @JsonKey(name: 'PreferredCommunityAssetId')
  int preferredCommunityAssetId;
  int homeCount;
  @JsonKey(name: 'IsAlreadyAdded')
  bool isAlreadyAdded;
  @JsonKey(name: 'HasGeoJSON')
  bool hasGeoJSON;
  @JsonKey(name: 'CommunityStatus')
  String? communityStatus;
  @JsonKey(name: 'CommunityVersion')
  CommunityVersionModel? communityVersion;
  @JsonKey(name: 'IsFavorite')
  bool isFavorite;
  @JsonKey(name: 'HasPhotos', defaultValue: false)
  bool hasPhotos;
  @JsonKey(name: 'HasNotes', defaultValue: false)
  bool hasNotes;
  @JsonKey(name: 'BedLow')
  int bedLow;
  @JsonKey(name: 'BedHigh')
  int bedHigh;
  @JsonKey(name: 'BathLow')
  double bathLow;
  @JsonKey(name: 'BathHigh')
  double bathHigh;
  @JsonKey(name: 'GrLow')
  double grLow;
  @JsonKey(name: 'GrHigh')
  double grHigh;
  @JsonKey(name: 'HaBathLow')
  double haBathLow;
  @JsonKey(name: 'HaBathHigh')
  double haBathHigh;
  @JsonKey(name: 'BDXBrandId')
  double BDXBrandId;
  @JsonKey(name: 'ProjectType')
  String? projectType;
  @JsonKey(name: 'MarketName')
  String? marketName;
  String get displayLocationAddress {
    return (city ?? "").isNotEmpty
        ? (city! + ", " + (state ?? ""))
        : (state ?? "");
  }

  bool get isMPC {
    return (projectType ?? "") == "MPC";
  }

  String get communitySpec {
    String result = "";

    var bed = [];
    var bath = [];
    var garage = [];
    List<String> spec = [];
    if (bedLow > 0 || bedHigh > 0) {
      if (bedLow == bedHigh) {
        bed.add(bedLow);
      } else {
        bed.add(bedLow);
        bed.add(bedHigh);
      }
    }

    if (bathLow > 0 || bathHigh > 0) {
      if (bathLow == bathHigh) {
        bath.add(bathLow.truncate());
      } else {
        bath.add(bathLow.truncate());
        bath.add(bathHigh.truncate());
      }
    }

    if (grLow > 0 || grHigh > 0) {
      if (grLow == grHigh) {
        garage.add(grLow.truncate());
      } else {
        garage.add(grLow.truncate());
        garage.add(grHigh.truncate());
      }
    }
    spec.add(bed.join("-") + "Br");
    spec.add(bath.join("-") + "Ba");
    spec.add(garage.join("-") + "Gr");

    result = spec.join(" / ");

    return result;
  }

  CommunityModel(
      {required this.ID,
      required this.BDXID,
      required this.bdxBuilderID,
      this.partnerName,
      required this.partnerId,
      required this.currentDBVersion,
      this.communityImage,
      required this.maximumPrice,
      required this.minimumPrice,
      required this.hasVideos,
      required this.masterPlanID,
      required this.marketID,
      this.customDescription,
      this.subDescription,
      this.phone,
      required this.longitude,
      required this.latitude,
      this.brandLogoSmall,
      this.brandLogoMedium,
      this.zip,
      this.state,
      this.sqftLow,
      this.sqftHigh,
      this.city,
      this.address,
      this.name,
      this.envisionDesignCenter,
      this.hours,
      required this.preferredCommunityAssetId,
      required this.homeCount,
      required this.isAlreadyAdded,
      required this.hasGeoJSON,
      this.communityStatus,
      this.communityVersion,
      required this.isFavorite,
      required this.hasPhotos,
      required this.hasNotes,
      required this.bedLow,
      required this.bedHigh,
      required this.bathLow,
      required this.bathHigh,
      required this.grLow,
      required this.grHigh,
      required this.haBathLow,
      required this.haBathHigh,
      required this.BDXBrandId,
      this.projectType,
      this.marketName});

  CommunityModel.createEmptyModel()
      : BDXBrandId = 0,
        ID = 0,
        BDXID = 0,
        bdxBuilderID = 0,
        partnerId = 0,
        currentDBVersion = 0,
        maximumPrice = 0,
        minimumPrice = 0,
        hasVideos = false,
        masterPlanID = 0,
        marketID = 0,
        longitude = 0,
        latitude = 0,
        preferredCommunityAssetId = 0,
        homeCount = 0,
        isAlreadyAdded = false,
        hasGeoJSON = false,
        isFavorite = false,
        hasPhotos = false,
        hasNotes = false,
        bedLow = 0,
        bedHigh = 0,
        bathLow = 0,
        bathHigh = 0,
        grLow = 0,
        grHigh = 0,
        haBathLow = 0,
        haBathHigh = 0;

  factory CommunityModel.fromJson(Map<String, dynamic> json) =>
      _$CommunityModelFromJson(json);

  Map<String, dynamic> toJson() => _$CommunityModelToJson(this);
}
