import 'image_links.dart';
import 'panelization_summary.dart';
import 'reading_modes.dart';

class VolumeInfo {
  String? title;
  List<String>? authors;
  String? publisher;
  String? publishedDate;
  String? description;
  List<String>?
      industryIdentifiers; // عدلناه من List<IndustryIdentifier> لـ List<String>
  ReadingModes? readingModes;
  num? pageCount;
  String? printType;
  List<String>? categories;
  num? averageRating;
  num? ratingsCount;
  String? maturityRating;
  bool? allowAnonLogging;
  String? contentVersion;
  PanelizationSummary? panelizationSummary;
  ImageLinks? imageLinks;
  String? language;
  String? previewLink;
  String? infoLink;
  String? canonicalVolumeLink;

  VolumeInfo({
    this.title,
    this.authors,
    this.publisher,
    this.publishedDate,
    this.description,
    this.industryIdentifiers,
    this.readingModes,
    this.pageCount,
    this.printType,
    this.categories,
    this.averageRating,
    this.ratingsCount,
    this.maturityRating,
    this.allowAnonLogging,
    this.contentVersion,
    this.panelizationSummary,
    this.imageLinks,
    this.language,
    this.previewLink,
    this.infoLink,
    this.canonicalVolumeLink,
  });

  factory VolumeInfo.fromJson(Map<String, dynamic> json) {
    // تحويل authors من List<dynamic> لـ List<String>
    var authorsList = json['authors'] as List<dynamic>?;
    List<String> authors = authorsList != null
        ? authorsList.map((author) => author.toString()).toList()
        : [];

    // تحويل categories من List<dynamic> لـ List<String>
    var categoriesList = json['categories'] as List<dynamic>?;
    List<String> categories = categoriesList != null
        ? categoriesList.map((category) => category.toString()).toList()
        : [];

    // تحويل industryIdentifiers من List<dynamic> لـ List<String>
    var identifiersList = json['industryIdentifiers'] as List<dynamic>?;
    List<String> identifiers = identifiersList != null
        ? identifiersList
            .map((item) =>
                (item as Map<String, dynamic>)['identifier'] as String)
            .toList()
        : [];

    return VolumeInfo(
      title: json['title'] as String?,
      authors: authors, // تمرير الـ List<String>
      publisher: json['publisher'] as String?,
      publishedDate: json['publishedDate'] as String?,
      description: json['description'] as String?,
      industryIdentifiers: identifiers, // تمرير الـ List<String>
      readingModes: json['readingModes'] == null
          ? null
          : ReadingModes.fromJson(json['readingModes'] as Map<String, dynamic>),
      pageCount: json['pageCount'] as num?,
      printType: json['printType'] as String?,
      categories: categories, // تمرير الـ List<String>
      averageRating: (json['averageRating'] as num?)?.toDouble(),
      ratingsCount: json['ratingsCount'] as num?,
      maturityRating: json['maturityRating'] as String?,
      allowAnonLogging: json['allowAnonLogging'] as bool?,
      contentVersion: json['contentVersion'] as String?,
      panelizationSummary: json['panelizationSummary'] == null
          ? null
          : PanelizationSummary.fromJson(
              json['panelizationSummary'] as Map<String, dynamic>),
      imageLinks: json['imageLinks'] == null
          ? null
          : ImageLinks.fromJson(json['imageLinks'] as Map<String, dynamic>),
      language: json['language'] as String?,
      previewLink: json['previewLink'] as String?,
      infoLink: json['infoLink'] as String?,
      canonicalVolumeLink: json['canonicalVolumeLink'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'title': title,
        'authors': authors,
        'publisher': publisher,
        'publishedDate': publishedDate,
        'description': description,
        'industryIdentifiers': industryIdentifiers, // دلوقتي List<String>
        'readingModes': readingModes?.toJson(),
        'pageCount': pageCount,
        'printType': printType,
        'categories': categories,
        'averageRating': averageRating,
        'ratingsCount': ratingsCount,
        'maturityRating': maturityRating,
        'allowAnonLogging': allowAnonLogging,
        'contentVersion': contentVersion,
        'panelizationSummary': panelizationSummary?.toJson(),
        'imageLinks': imageLinks?.toJson(),
        'language': language,
        'previewLink': previewLink,
        'infoLink': infoLink,
        'canonicalVolumeLink': canonicalVolumeLink,
      };
}
