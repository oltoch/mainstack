
import 'package:mainstack/utils/constants.dart';

enum SocialMedia{
  facebook,
  twitter,
  instagram,
  linkedin,
  whatsapp,
  telegram,
}

extension SocialMediaMap on SocialMedia{
  static const values = {
    SocialMedia.facebook: Constants.facebook,
    SocialMedia.twitter: Constants.twitter,
    SocialMedia.instagram: Constants.instagram,
    SocialMedia.linkedin: Constants.linkedIn,
    SocialMedia.whatsapp: Constants.whatsapp,
    SocialMedia.telegram: Constants.telegram,
  };

  static const urls = {
    SocialMedia.facebook: Constants.facebookUrl,
    SocialMedia.twitter: Constants.twitterUrl,
    SocialMedia.instagram: Constants.instagramUrl,
    SocialMedia.linkedin: Constants.linkedInUrl,
    SocialMedia.whatsapp: Constants.whatsappUrl,
    SocialMedia.telegram: Constants.telegramUrl,
  };
  
  static const icons = {
    SocialMedia.facebook: 'assets/icons/facebook_icon.svg',
    SocialMedia.twitter: 'assets/icons/twitter_icon.svg',
    SocialMedia.instagram: 'assets/icons/instagram_icon.svg',
    SocialMedia.linkedin: 'assets/icons/linkedin_icon.svg',
    SocialMedia.whatsapp: 'assets/icons/whatsapp_icon.svg',
    SocialMedia.telegram: 'assets/icons/telegram_icon.svg',
  };

  String? get icon => icons[this];
  String? get value => values[this];
  String? get url => urls[this];

  static SocialMedia? fromString(String input){
    final reverseValueMap = values.map<String, SocialMedia>((key, value) => MapEntry(value, key));

    SocialMedia? output = reverseValueMap[input];
    return output;
  }
}