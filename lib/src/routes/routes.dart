import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:animaciones/src/labs/slideshow_page.dart';
import 'package:animaciones/src/pages/animaciones_page.dart';
import 'package:animaciones/src/pages/emergency_page.dart';
import 'package:animaciones/src/pages/graficas_circulares_page.dart';
import 'package:animaciones/src/pages/headers_page.dart';
import 'package:animaciones/src/pages/pinterest_page.dart';

final pageRoutes = [
  _Route(FontAwesomeIcons.slideshare, 'Slideshow', const SlideShowPage()),
  _Route(FontAwesomeIcons.ambulance, 'Emergencia', const EmergencyPage()),
  _Route(FontAwesomeIcons.heading, 'Encabezado', const HeadersPage()),
  _Route(FontAwesomeIcons.peopleCarry, 'Cuadro Animado', const CuadradoAnimado()),
  _Route(FontAwesomeIcons.circleNotch, 'Barra de Progreso', const GraficasCircularesPage()),
  _Route(FontAwesomeIcons.pinterest, 'Pinterest Page', const PinterestPage()),
];

class _Route {

  final IconData icon;
  final String title;
  final Widget page;

  _Route(this.icon, this.title, this.page);

  

}