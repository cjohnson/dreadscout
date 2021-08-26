import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'DreadScout';

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));

    return MaterialApp(
      title: _title,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          brightness: Brightness.dark
        )
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // appBar: AppBar(title: const Text(_title),),
        body: const FormElement(),
      )
    );
  }
}

class FormPage extends StatelessWidget {
  const FormPage({Key? key, required this.pageNumber}) : super(key: key);

  final int pageNumber;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          expandedHeight: 220.0,
          floating: true,
          pinned: true,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(bottom: Radius.circular(30.0))),
          flexibleSpace: FlexibleSpaceBar(
            collapseMode: CollapseMode.pin,
            centerTitle: true,
            background: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(30.0)),
              ),
              child: Stack(
                children: [
                  Positioned.fill(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30.0),
                      child: ColorFiltered(
                        colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.colorBurn),
                        child: Image(
                          image: AssetImage('asset/image/dreadbots.jpg'),
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 28.0,
                    bottom: 28.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          '3656',
                          style: GoogleFonts.roboto(
                              textStyle: Theme.of(context).textTheme.headline1,
                              color: Colors.white,
                              fontWeight: FontWeight.w800,
                              fontSize: 44.0,
                              height: 0.5
                          ),
                        ),
                        Text(
                          'Dreadbots',
                          style: GoogleFonts.roboto(
                              textStyle: Theme.of(context).textTheme.headline1,
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 32.0
                          ),
                        ),
                        Row(
                          children: [
                            Icon(
                              FontAwesomeIcons.mapMarkerAlt,
                              size: 20.0,
                              color: Colors.white,
                            ),
                            SizedBox(width: 5.0,),
                            Text(
                              'From Dexter, Michigan, USA',
                              style: GoogleFonts.nunito(
                                textStyle: Theme.of(context).textTheme.subtitle1,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0
                              ),
                            )
                          ],
                        )
                      ],
                    )
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}

class FormElement extends StatefulWidget {
  const FormElement({Key? key}) : super(key: key);

  @override
  _FormElementState createState() => _FormElementState();
}

class _FormElementState extends State<FormElement> {
  List<Widget> forms = <Widget>[
    FormPage(pageNumber: 1),
    FormPage(pageNumber: 2),
  ];

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController(initialPage: 0);
    return PageView(
      scrollDirection: Axis.horizontal,
      controller: controller,
      children: forms,
      onPageChanged: _onPageChange,
    );
  }

  void _onPageChange(int index) {
    print('$index');
    if(index + 1 >= forms.length) {
      forms.add(FormPage(pageNumber: index + 2));
      print('Created new page instance this swipe. (index=${index + 2})');
    }
  }
}