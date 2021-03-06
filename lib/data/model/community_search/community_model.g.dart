// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'community_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommunityModel _$CommunityModelFromJson(Map<String, dynamic> json) {
  return CommunityModel(
    ID: json['ID'] as int,
    BDXID: json['BDXID'] as int,
    bdxBuilderID: json['BDXBuilderID'] as int,
    partnerName: json['PartnerName'] as String?,
    partnerId: json['PartnerID'] as int,
    currentDBVersion: json['CurrentDBVersion'] as int,
    communityImage: json['CommunityImage'] as String?,
    maximumPrice: (json['maximumPrice'] as num).toDouble(),
    minimumPrice: (json['minimumPrice'] as num).toDouble(),
    hasVideos: json['HasVideos'] as bool,
    masterPlanID: json['MasterPlanID'] as int?,
    marketID: json['MarketID'] as int,
    customDescription: json['CustomDescription'] as String?,
    subDescription: json['SubDescription'] as String?,
    phone: json['Phone'] as String?,
    longitude: (json['Longitude'] as num).toDouble(),
    latitude: (json['Latitude'] as num).toDouble(),
    brandLogoSmall: json['BrandLogoSmall'] as String?,
    brandLogoMedium: json['BrandLogoMedium'] as String?,
    zip: json['Zip'] as String?,
    state: json['State'] as String?,
    sqftLow: json['SqftLow'] as String?,
    sqftHigh: json['SqftHigh'] as String?,
    city: json['City'] as String?,
    address: json['Address'] as String?,
    name: json['Name'] as String?,
    envisionDesignCenter: json['EnvisionDesignCenter'] as String?,
    hours: json['Hours'] as String?,
    preferredCommunityAssetId: json['PreferredCommunityAssetId'] as int,
    homeCount: json['homeCount'] as int,
    isAlreadyAdded: json['IsAlreadyAdded'] as bool,
    hasGeoJSON: json['HasGeoJSON'] as bool,
    communityStatus: json['CommunityStatus'] as String?,
    communityVersion: json['CommunityVersion'] == null
        ? null
        : CommunityVersionModel.fromJson(
            json['CommunityVersion'] as Map<String, dynamic>),
    isFavorite: json['IsFavorite'] as bool,
    hasPhotos: json['HasPhotos'] as bool? ?? false,
    hasNotes: json['HasNotes'] as bool? ?? false,
    bedLow: json['BedLow'] as int,
    bedHigh: json['BedHigh'] as int,
    bathLow: (json['BathLow'] as num).toDouble(),
    bathHigh: (json['BathHigh'] as num).toDouble(),
    grLow: (json['GrLow'] as num).toDouble(),
    grHigh: (json['GrHigh'] as num).toDouble(),
    haBathLow: (json['HaBathLow'] as num).toDouble(),
    haBathHigh: (json['HaBathHigh'] as num).toDouble(),
    BDXBrandId: (json['BDXBrandId'] as num).toDouble(),
    projectType: json['ProjectType'] as String?,
    marketName: json['MarketName'] as String?,
  );
}

Map<String, dynamic> _$CommunityModelToJson(CommunityModel instance) =>
    <String, dynamic>{
      'ID': instance.ID,
      'BDXID': instance.BDXID,
      'BDXBuilderID': instance.bdxBuilderID,
      'PartnerName': instance.partnerName,
      'PartnerID': instance.partnerId,
      'CurrentDBVersion': instance.currentDBVersion,
      'CommunityImage': instance.communityImage,
      'maximumPrice': instance.maximumPrice,
      'minimumPrice': instance.minimumPrice,
      'HasVideos': instance.hasVideos,
      'MasterPlanID': instance.masterPlanID,
      'MarketID': instance.marketID,
      'CustomDescription': instance.customDescription,
      'SubDescription': instance.subDescription,
      'Phone': instance.phone,
      'Longitude': instance.longitude,
      'Latitude': instance.latitude,
      'BrandLogoSmall': instance.brandLogoSmall,
      'BrandLogoMedium': instance.brandLogoMedium,
      'Zip': instance.zip,
      'State': instance.state,
      'SqftLow': instance.sqftLow,
      'SqftHigh': instance.sqftHigh,
      'City': instance.city,
      'Address': instance.address,
      'Name': instance.name,
      'EnvisionDesignCenter': instance.envisionDesignCenter,
      'Hours': instance.hours,
      'PreferredCommunityAssetId': instance.preferredCommunityAssetId,
      'homeCount': instance.homeCount,
      'IsAlreadyAdded': instance.isAlreadyAdded,
      'HasGeoJSON': instance.hasGeoJSON,
      'CommunityStatus': instance.communityStatus,
      'CommunityVersion': instance.communityVersion,
      'IsFavorite': instance.isFavorite,
      'HasPhotos': instance.hasPhotos,
      'HasNotes': instance.hasNotes,
      'BedLow': instance.bedLow,
      'BedHigh': instance.bedHigh,
      'BathLow': instance.bathLow,
      'BathHigh': instance.bathHigh,
      'GrLow': instance.grLow,
      'GrHigh': instance.grHigh,
      'HaBathLow': instance.haBathLow,
      'HaBathHigh': instance.haBathHigh,
      'BDXBrandId': instance.BDXBrandId,
      'ProjectType': instance.projectType,
      'MarketName': instance.marketName,
    };
