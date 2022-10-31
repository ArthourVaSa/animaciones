// ignore_for_file: unnecessary_this, unused_element
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//TODO: BORRAR
import 'package:flutter_svg/svg.dart';

class SlidesShow extends StatelessWidget {
  final List<Widget>? slides;
  final bool? puntosArriba;
  final Color? colorPrimario;
  final Color? colorSecundario;
  final double? bulletPrimario;
  final double? bulletSecundario;

  const SlidesShow({
    Key? key,
    required this.slides,
    this.puntosArriba = false,
    this.colorPrimario = Colors.pink,
    this.colorSecundario = Colors.grey,
    this.bulletPrimario = 15,
    this.bulletSecundario = 12,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _SlidesShowModel(),
      child: SafeArea(
        child: Center(
          child: Builder(
            builder: (BuildContext context) {
              Provider.of<_SlidesShowModel>(context).colorPrimario =
                  this.colorPrimario!;
              Provider.of<_SlidesShowModel>(context).colorSecundario =
                  this.colorSecundario!;
              Provider.of<_SlidesShowModel>(context).bulletPrimario =
                  this.bulletPrimario!;
              Provider.of<_SlidesShowModel>(context).bulletSecundario =
                  this.bulletSecundario!;

              return _CrearEstructuraSlideShow(
                  puntosArriba: puntosArriba, slides: slides);
            },
          ),
        ),
      ),
    );
  }
}

class _CrearEstructuraSlideShow extends StatelessWidget {
  const _CrearEstructuraSlideShow({
    Key? key,
    required this.puntosArriba,
    required this.slides,
  }) : super(key: key);

  final bool? puntosArriba;
  final List<Widget>? slides;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (this.puntosArriba!)
          _Dots(
            this.slides!.length,
          ),
        Expanded(
          child: _Slides(this.slides),
        ),
        if (!this.puntosArriba!)
          _Dots(
            this.slides!.length,
          ),
      ],
    );
  }
}

class _Dots extends StatelessWidget {
  final int totalSlides;

  const _Dots(
    this.totalSlides,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          this.totalSlides,
          (index) => _Dot(
            index: index,
          ),
        ),
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  final int? index;

  const _Dot({
    Key? key,
    this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final slideShowModel = Provider.of<_SlidesShowModel>(context);
    double tamano = 0;
    Color color;

    if (slideShowModel.currentPage >= index! - 0.5 &&
        slideShowModel.currentPage < index! + 0.5) {
      tamano = slideShowModel.bulletPrimario;
      color = slideShowModel.colorPrimario;
    } else {
      tamano = slideShowModel.bulletSecundario;
      color = slideShowModel.colorSecundario;
    }

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: tamano,
      height: tamano,
      margin: const EdgeInsets.symmetric(horizontal: 5.0),
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }
}

class _Slides extends StatefulWidget {
  final List<Widget>? slides;

  const _Slides(this.slides);

  @override
  State<_Slides> createState() => _SlidesState();
}

class _SlidesState extends State<_Slides> {
  final pageViewController = PageController();

  @override
  void initState() {
    pageViewController.addListener(() {
      Provider.of<_SlidesShowModel>(context, listen: false).currentPage =
          pageViewController.page!;
    });

    super.initState();
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView(
        controller: pageViewController,
        children: widget.slides!
            .map((slide) => _Slide(
                  slide: slide,
                ))
            .toList(),
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final Widget? slide;

  const _Slide({
    Key? key,
    this.slide,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.all(30),
      child: slide,
    );
  }
}

class _SlidesShowModel with ChangeNotifier {
  late double _currentPage = 0;
  late Color _colorPrimario = Colors.pink;
  late Color _colorSecundario = Colors.grey;
  late double _bulletPrimario = 12;
  late double _bulletSecundario = 12;

  double get currentPage => this._currentPage;

  set currentPage(double currentPage) {
    this._currentPage = currentPage;
    notifyListeners();
  }

  Color get colorPrimario => this._colorPrimario;
  set colorPrimario(Color color) {
    this._colorPrimario = color;
  }

  Color get colorSecundario => this._colorSecundario;
  set colorSecundario(Color color) {
    this._colorSecundario = color;
  }

  double get bulletPrimario => this._bulletPrimario;
  set bulletPrimario(double bullet) {
    this._bulletPrimario = bullet;
  }

  double get bulletSecundario => this._bulletSecundario;
  set bulletSecundario(double bullet) {
    this._bulletSecundario = bullet;
  }
}
