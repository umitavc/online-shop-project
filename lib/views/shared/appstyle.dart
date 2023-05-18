

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle appstyle(double size, Color color , FontWeight fontweight){
  return GoogleFonts.poppins(fontSize: size, color: color,fontWeight: fontweight);
}

TextStyle appstyleWithHt(double size, Color color , FontWeight fontweight, double ht){
  return GoogleFonts.poppins(fontSize: size, color: color,fontWeight: fontweight, height: ht);
}