import 'package:animaciones/src/theme/theme.dart';
import 'package:animaciones/src/widgets/slideshow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class SlidesShowPage extends StatelessWidget {
  const SlidesShowPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeChanger appTheme = Provider.of<ThemeChanger>(context, listen: false);
    return SlidesShow(
      colorPrimario: appTheme.darkTheme ? appTheme.currentTheme.accentColor : Colors.red,
      puntosArriba: false,
      slides: [
        SvgPicture.asset('assets/svgs/1.svg'),
        SvgPicture.asset('assets/svgs/2.svg'),
        SvgPicture.asset('assets/svgs/3.svg'),
        SvgPicture.asset('assets/svgs/4.svg'),
        SvgPicture.asset('assets/svgs/5.svg'),
      ],
    );
  }
}
