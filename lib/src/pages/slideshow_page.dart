import 'package:animaciones/src/widgets/slideshow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SlidesShowPage extends StatelessWidget {
  const SlidesShowPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SlidesShow(
        colorPrimario: const Color(0xffFF5A7E),
        puntosArriba: false,
        slides: [
          SvgPicture.asset('assets/svgs/1.svg'),
          SvgPicture.asset('assets/svgs/2.svg'),
          SvgPicture.asset('assets/svgs/3.svg'),
          SvgPicture.asset('assets/svgs/4.svg'),
          SvgPicture.asset('assets/svgs/5.svg'),
        ],
      ),
    );
  }
}
