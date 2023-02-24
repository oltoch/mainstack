class ImageModel {
  final bool hasHeading;
  final String? title;
  final String? description;
  final LayoutStyle layoutStyle;
  final List<ImageFile> images;

  const ImageModel({
    this.hasHeading = false,
    this.title,
    this.description,
    this.layoutStyle = LayoutStyle.single,
    this.images = const [],
  })  : assert(hasHeading == false || title != null,
            'title cannot be null if hasHeading is true'),
        //Assert that if layoutStyle is grid or carousel, images.length must be greater than 1
        assert(
            (layoutStyle == LayoutStyle.single && images.length == 1) ||
                (layoutStyle == LayoutStyle.grid && images.length > 1) ||
                (layoutStyle == LayoutStyle.carousel && images.length > 1),
            'images.length must be greater than 1 if layoutStyle is grid or carousel');

  ImageModel copyWith({
    bool? hasHeading,
    String? title,
    String? description,
    LayoutStyle? layoutStyle,
    List<ImageFile>? images,
  }) =>
      ImageModel(
        hasHeading: hasHeading ?? this.hasHeading,
        title: title ?? this.title,
        description: description ?? this.description,
        layoutStyle: layoutStyle ?? this.layoutStyle,
        images: images ?? this.images,
      );
}

class ImageFile {
  final String image;
  final String? caption;
  final String? altText;
  final String? link;

  const ImageFile({
    required this.image,
    this.caption,
    this.altText,
    this.link,
  });

  ImageFile copyWith({
    String? image,
    String? caption,
    String? altText,
    String? link,
  }) =>
      ImageFile(
        image: image ?? this.image,
        caption: caption ?? this.caption,
        altText: altText ?? this.altText,
        link: link ?? this.link,
      );
}

enum LayoutStyle {
  single,
  grid,
  carousel,
}
