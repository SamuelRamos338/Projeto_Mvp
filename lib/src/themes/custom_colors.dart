import 'package:flutter/material.dart';

/// Extensão de tema para armazenar paletas personalizadas.
/// Isso permite aplicar essas cores de forma consistente via Theme.of(context).extension<CustomColors>().
class CustomColors extends ThemeExtension<CustomColors> {
  const CustomColors({
    required this.titleColor,
    required this.subtitleColor,
    required this.emailLinkColor,
    required this.iconColor,
    required this.cardTitleColor,
    required this.cardSubtitleColor,
    required this.centerTextColor,
  });

  final Color? titleColor;
  final Color? subtitleColor;
  final Color? emailLinkColor;
  final Color? iconColor;
  final Color? cardTitleColor;
  final Color? cardSubtitleColor;
  final Color? centerTextColor;

  /// Cria uma cópia com valores atualizados, necessário para temas dinâmicos.
  @override
  CustomColors copyWith({
    Color? titleColor,
    Color? subtitleColor,
    Color? emailLinkColor,
    Color? iconColor,
    Color? cardTitleColor,
    Color? cardSubtitleColor,
    Color? centerTextColor,
  }) {
    return CustomColors(
      titleColor: titleColor ?? this.titleColor,
      subtitleColor: subtitleColor ?? this.subtitleColor,
      emailLinkColor: emailLinkColor ?? this.emailLinkColor,
      iconColor: iconColor ?? this.iconColor,
      cardTitleColor: cardTitleColor ?? this.cardTitleColor,
      cardSubtitleColor: cardSubtitleColor ?? this.cardSubtitleColor,
      centerTextColor: centerTextColor ?? this.centerTextColor,
    );
  }

  /// Responsável por animar transições entre temas
  @override
  CustomColors lerp(ThemeExtension<CustomColors>? other, double t) {
    if (other is! CustomColors) return this;

    return CustomColors(
      titleColor: Color.lerp(titleColor, other.titleColor, t),
      subtitleColor: Color.lerp(subtitleColor, other.subtitleColor, t),
      emailLinkColor: Color.lerp(emailLinkColor, other.emailLinkColor, t),
      iconColor: Color.lerp(iconColor, other.iconColor, t),
      cardTitleColor: Color.lerp(cardTitleColor, other.cardTitleColor, t),
      cardSubtitleColor: Color.lerp(cardSubtitleColor, other.cardSubtitleColor, t),
      centerTextColor: Color.lerp(centerTextColor, other.centerTextColor, t),
    );
  }

  /// Paleta padrão para tema claro
  static const CustomColors light = CustomColors(
    titleColor: Colors.brown,
    subtitleColor: Color(0xFF6B3916),
    emailLinkColor: Colors.blueAccent,
    iconColor: Color(0xFF8E2321),
    cardTitleColor: Colors.black87,
    cardSubtitleColor: Colors.black54,
    centerTextColor: Colors.brown,
  );

  /// Paleta padrão para tema escuro
  static const CustomColors dark = CustomColors(
    titleColor: Colors.white,
    subtitleColor: Colors.white,
    emailLinkColor: Colors.blueAccent,
    iconColor: Colors.red,
    cardTitleColor: Colors.white,
    cardSubtitleColor: Colors.white54,
    centerTextColor: Colors.white,
  );
}
