// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyles {
  // Colores principales de Zweck
  static const Color primaryColor = Color(0xFF1A1A1A); // Negro principal
  static const Color secondaryColor = Color(0xFF333333); // Gris oscuro
  static const Color accentColor = Color(0xFFFFD700); // Amarillo Zweck
  static const Color accentColorDark = Color(
    0xFFE6C200,
  ); // Amarillo Zweck oscuro
  static const Color accentColorLight = Color(
    0xFFFFE44D,
  ); // Amarillo Zweck claro
  static const Color textColor = Color(0xFF1A1A1A); // Negro texto
  static const Color backgroundColor = Color(0xFFFFFFFF); // Blanco fondo
  static const Color cardBackground = Color(0xFFF5F5F5); // Gris muy claro
  static const Color dividerColor = Color(0xFFE0E0E0); // Gris divisor
  static const Color errorColor = Color(0xFFD32F2F); // Rojo error
  static const Color successColor = Color(0xFF388E3C); // Verde éxito
  static const Color warningColor = Color(0xFFF57C00); // Naranja advertencia

  // Gradientes
  static const LinearGradient luxuryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [accentColor, accentColorDark],
  );

  static const LinearGradient lightGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [backgroundColor, cardBackground],
  );

  static const LinearGradient accentGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [accentColorLight, accentColor],
  );

  // Estilos de texto
  static TextStyle get displayTitle => GoogleFonts.playfairDisplay(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: textColor,
        letterSpacing: 1.2,
      );

  static TextStyle get displaySubtitle => GoogleFonts.playfairDisplay(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: textColor,
        letterSpacing: 1.0,
      );

  static TextStyle get bodyText => GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: textColor,
        height: 1.5,
      );

  static TextStyle get captionText => GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: textColor.withOpacity(0.7),
        height: 1.4,
      );

  static TextStyle get accentText => GoogleFonts.playfairDisplay(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: accentColor,
        letterSpacing: 1.0,
      );

  // Estilos de botones
  static ButtonStyle get primaryButton => ElevatedButton.styleFrom(
        backgroundColor: accentColor,
        foregroundColor: primaryColor,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadiusMd),
        ),
        elevation: 2,
        shadowColor: accentColor.withOpacity(0.3),
      ).copyWith(
        overlayColor:
            MaterialStateProperty.all(accentColorDark.withOpacity(0.1)),
      );

  static ButtonStyle get secondaryButton => ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent,
        foregroundColor: accentColor,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadiusMd),
          side: const BorderSide(color: accentColor, width: 1),
        ),
        elevation: 0,
      ).copyWith(
        overlayColor: MaterialStateProperty.all(accentColor.withOpacity(0.1)),
      );

  // Estilos de tarjetas
  static BoxDecoration get cardDecoration => BoxDecoration(
        color: cardBackground,
        borderRadius: BorderRadius.circular(borderRadiusLg),
        border: Border.all(color: dividerColor, width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      );

  // Estilos de inputs
  static InputDecoration get inputDecoration => InputDecoration(
        filled: true,
        fillColor: cardBackground,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: const BorderSide(color: dividerColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: const BorderSide(color: dividerColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: const BorderSide(color: accentColor, width: 1),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: const BorderSide(color: errorColor, width: 1),
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      );

  // Espaciado
  static const double spacingXs = 4.0;
  static const double spacingSm = 8.0;
  static const double spacingMd = 16.0;
  static const double spacingLg = 24.0;
  static const double spacingXl = 32.0;
  static const double spacingXxl = 48.0;
  static const double spacing = 16.0;

  // Bordes redondeados
  static const double borderRadiusSm = 2.0;
  static const double borderRadiusMd = 4.0;
  static const double borderRadiusLg = 8.0;
  static const double borderRadiusXl = 12.0;

  // Sombras
  static List<BoxShadow> get shadowSm => [
        BoxShadow(
          color: Colors.black.withOpacity(0.05),
          blurRadius: 2,
          offset: const Offset(0, 1),
        ),
      ];

  static List<BoxShadow> get shadowMd => [
        BoxShadow(
          color: Colors.black.withOpacity(0.1),
          blurRadius: 4,
          offset: const Offset(0, 2),
        ),
      ];

  static List<BoxShadow> get shadowLg => [
        BoxShadow(
          color: Colors.black.withOpacity(0.15),
          blurRadius: 8,
          offset: const Offset(0, 4),
        ),
      ];

  // Animaciones
  static const Duration animationFast = Duration(milliseconds: 200);
  static const Duration animationNormal = Duration(milliseconds: 300);
  static const Duration animationSlow = Duration(milliseconds: 500);

  // Curvas de animación
  static const Curve animationCurve = Curves.easeInOut;

  // Tema de la aplicación
  static ThemeData get lightTheme => ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.light(
          primary: primaryColor,
          secondary: accentColor,
          background: backgroundColor,
          surface: cardBackground,
          onPrimary: Colors.white,
          onSecondary: Colors.black,
          onBackground: textColor,
          onSurface: textColor,
        ),
        textTheme: TextTheme(
          displayLarge: displayTitle,
          displayMedium: displaySubtitle,
          displaySmall: bodyText,
          bodyLarge: bodyText,
          bodyMedium: bodyText,
          bodySmall: captionText,
        ),
        cardTheme: CardTheme(
          color: cardBackground,
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadiusLg),
          ),
          margin: const EdgeInsets.all(8),
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: backgroundColor,
          foregroundColor: textColor,
          elevation: 0,
          centerTitle: true,
          titleTextStyle: displaySubtitle.copyWith(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
          iconTheme: const IconThemeData(color: textColor),
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.light,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(style: primaryButton),
        dividerTheme: const DividerThemeData(
          color: dividerColor,
          thickness: 1,
          space: 24,
        ),
        scaffoldBackgroundColor: backgroundColor,
      );

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.red,
        brightness: Brightness.dark,
      ),
      appBarTheme: const AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
    );
  }
}
