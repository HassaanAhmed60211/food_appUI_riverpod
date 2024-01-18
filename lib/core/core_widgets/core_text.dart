import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:snackees/configs/constants/fonts_configs/fonts_constants.dart';

Widget customTextWidget({
  required text,
  double fontSize = 14.0,
  Color color = Colors.black,
  String fontNameP = FontsConstants.roboto,
  FontWeight fontWeight = FontWeight.w600,
  TextOverflow overflow = TextOverflow.visible,
  double lineHeight = 1.2,
  TextAlign textAlign = TextAlign.start,
  double? letterSpacing,
  int? maxLines,
  fixText = false,
  isPlusJakartaFont = false,
  TextDecoration? jakartaDecoration,
}) {
  return fixText
      ? AutoSizeText(text.toString(),
          maxLines: maxLines,
          textAlign: textAlign,
          style: GoogleFonts.getFont(fontNameP,
              color: color,
              fontSize: fontSize,
              fontWeight: fontWeight,
              height: lineHeight,
              textStyle: TextStyle(
                decoration: jakartaDecoration ?? TextDecoration.none,
                overflow: overflow,
              )))
      : Text(text.toString(),
          // softWrap: softwrap,
          textAlign: textAlign,
          style: GoogleFonts.getFont(fontNameP,
              color: color,
              fontSize: fontSize,
              fontWeight: fontWeight,
              height: lineHeight,
              textStyle: TextStyle(
                overflow: overflow,
              )));
}
