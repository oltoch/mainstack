class MailingModel {
  final String title;
  final String? description;
  final bool customLegalInfo;
  final String? legalText;
  final String? legalUrl;
  final String infoDestination;

  MailingModel({
    required this.title,
    this.description,
    this.customLegalInfo = false,
    this.legalText,
    this.legalUrl,
    this.infoDestination = 'mainstack',
  });
}
