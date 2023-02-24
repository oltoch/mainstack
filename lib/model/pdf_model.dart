class PdfModel{
  final bool hasHeading;
  final String? heading;
final List<Pdf> pdf;

  PdfModel({
    required this.hasHeading,
    this.heading,
    required this.pdf,
  });

  PdfModel copyWith({
    bool? hasHeading,
    String? heading,
    List<Pdf>? pdf,
  }){
    return PdfModel(
      hasHeading: hasHeading ?? this.hasHeading,
      heading: heading ?? this.heading,
      pdf: pdf ?? this.pdf,
    );
  }
}

class Pdf{
  final String title;
  final String pdf;

  Pdf({
    required this.title,
    required this.pdf,
  });

  Pdf copyWith({
    String? title,
    String? pdf,
  }){
    return Pdf(
      title: title ?? this.title,
      pdf: pdf ?? this.pdf,
    );
  }
}