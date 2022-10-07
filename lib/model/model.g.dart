// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Post _$PostFromJson(Map<String, dynamic> json) => Post(
      status: json['status'] as String?,
      copyright: json['copyright'] as String?,
      section: json['section'] as String?,
      lastUpdated: json['lastUpdated'] as String?,
      numResults: json['numResults'] as int?,
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => Results.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PostToJson(Post instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('status', instance.status);
  writeNotNull('copyright', instance.copyright);
  writeNotNull('section', instance.section);
  writeNotNull('lastUpdated', instance.lastUpdated);
  writeNotNull('numResults', instance.numResults);
  writeNotNull('results', instance.results);
  return val;
}

Results _$ResultsFromJson(Map<String, dynamic> json) => Results(
      section: json['section'] as String?,
      subsection: json['subsection'] as String?,
      title: json['title'] as String?,
      abstract: json['abstract'] as String?,
      url: json['url'] as String?,
      uri: json['uri'] as String?,
      byline: json['byline'] as String?,
      itemType: json['itemType'] as String?,
      updatedDate: json['updatedDate'] as String?,
      createdDate: json['createdDate'] as String?,
      publishedDate: json['publishedDate'] as String?,
      materialTypeFacet: json['materialTypeFacet'] as String?,
      kicker: json['kicker'] as String?,
      desFacet: (json['desFacet'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      orgFacet: (json['orgFacet'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      perFacet: (json['perFacet'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      geoFacet: (json['geoFacet'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      multimedia: (json['multimedia'] as List<dynamic>?)
          ?.map((e) => Multimedia.fromJson(e as Map<String, dynamic>))
          .toList(),
      shortUrl: json['shortUrl'] as String?,
    );

Map<String, dynamic> _$ResultsToJson(Results instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('section', instance.section);
  writeNotNull('subsection', instance.subsection);
  writeNotNull('title', instance.title);
  writeNotNull('abstract', instance.abstract);
  writeNotNull('url', instance.url);
  writeNotNull('uri', instance.uri);
  writeNotNull('byline', instance.byline);
  writeNotNull('itemType', instance.itemType);
  writeNotNull('updatedDate', instance.updatedDate);
  writeNotNull('createdDate', instance.createdDate);
  writeNotNull('publishedDate', instance.publishedDate);
  writeNotNull('materialTypeFacet', instance.materialTypeFacet);
  writeNotNull('kicker', instance.kicker);
  writeNotNull('desFacet', instance.desFacet);
  writeNotNull('orgFacet', instance.orgFacet);
  writeNotNull('perFacet', instance.perFacet);
  writeNotNull('geoFacet', instance.geoFacet);
  writeNotNull('multimedia', instance.multimedia);
  writeNotNull('shortUrl', instance.shortUrl);
  return val;
}

Multimedia _$MultimediaFromJson(Map<String, dynamic> json) => Multimedia(
      url: json['url'] as String?,
      format: json['format'] as String?,
      height: json['height'] as int?,
      width: json['width'] as int?,
      type: json['type'] as String?,
      subtype: json['subtype'] as String?,
      caption: json['caption'] as String?,
      copyright: json['copyright'] as String?,
    );

Map<String, dynamic> _$MultimediaToJson(Multimedia instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('url', instance.url);
  writeNotNull('format', instance.format);
  writeNotNull('height', instance.height);
  writeNotNull('width', instance.width);
  writeNotNull('type', instance.type);
  writeNotNull('subtype', instance.subtype);
  writeNotNull('caption', instance.caption);
  writeNotNull('copyright', instance.copyright);
  return val;
}
