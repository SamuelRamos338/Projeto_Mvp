import 'package:flutter/material.dart';

// Define uma extensão de tema para suas cores personalizadas
// Isso permite adicionar propriedades de cor ao ThemeData do Flutter
class CustomColors extends ThemeExtension<CustomColors> {
  // Construtor constante para a classe CustomColors
  const CustomColors({
    required this.titleColor,
    required this.subtitleColor,
    required this.emailLinkColor,
    required this.iconColor,
    required this.cardTitleColor,
    required this.cardSubtitleColor,
    required this.centerTextColor,
  });

  // Declare suas cores personalizadas como campos finais e anuláveis
  // O tipo Color? indica que a cor pode ser nula, embora a usaremos como obrigatória no construtor
  final Color? titleColor;
  final Color? subtitleColor;
  final Color? emailLinkColor;
  final Color? iconColor;
  final Color? cardTitleColor;
  final Color? cardSubtitleColor;
  final Color? centerTextColor;

  // Implementa o método copyWith para criar uma cópia da extensão com valores alterados
  // Essencial para o funcionamento do tema do Flutter
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
      titleColor: titleColor ?? this.titleColor, // Se o novo valor for nulo, mantém o valor atual
      subtitleColor: subtitleColor ?? this.subtitleColor,
      emailLinkColor: emailLinkColor ?? this.emailLinkColor,
      iconColor: iconColor ?? this.iconColor,
      cardTitleColor: cardTitleColor ?? this.cardTitleColor,
      cardSubtitleColor: cardSubtitleColor ?? this.cardSubtitleColor,
      centerTextColor: centerTextColor ?? this.centerTextColor,
    );
  }

  // Implementa o método lerp (linear interpolation) para interpolação de cores
  // Usado pelo Flutter para animar transições entre temas (por exemplo, claro para escuro)
  @override
  CustomColors lerp(ThemeExtension<CustomColors>? other, double t) {
    // Verifica se o outro objeto é do mesmo tipo
    if (other is! CustomColors) {
      return this; // Se não for, retorna a instância atual
    }
    return CustomColors(
      // Interpola cada cor individualmente
      titleColor: Color.lerp(titleColor, other.titleColor, t),
      subtitleColor: Color.lerp(subtitleColor, other.subtitleColor, t),
      emailLinkColor: Color.lerp(emailLinkColor, other.emailLinkColor, t),
      iconColor: Color.lerp(iconColor, other.iconColor, t),
      cardTitleColor: Color.lerp(cardTitleColor, other.cardTitleColor, t),
      cardSubtitleColor: Color.lerp(cardSubtitleColor, other.cardSubtitleColor, t),
      centerTextColor: Color.lerp(centerTextColor, other.centerTextColor, t),
    );
  }
}
