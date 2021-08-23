import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'DreadScout';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
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
    var rng = new Random();
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          expandedHeight: 200.0,
          stretch: true,
          flexibleSpace: FlexibleSpaceBar(
            title: Text(
              '3656 Dreadbots',
              style: GoogleFonts.roboto(
                textStyle: Theme.of(context).textTheme.headline1,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20
              ),
            ),
            background: Image(
              image: AssetImage('asset/image/dreadbots.jpg'),
              fit: BoxFit.fill,
            ),
          ),
        )
      ],
    );
    //);
    // return Column(
    //   children: [
    //     Column(
    //       children: [
    //         Text(
    //           'Qualification $pageNumber',
    //           style: GoogleFonts.roboto(
    //             textStyle: Theme.of(context).textTheme.headline4,
    //             fontWeight: FontWeight.bold
    //           ),
    //         ),
    //         Text(
    //           'Team #${rng.nextInt(10000)}',
    //           style: GoogleFonts.roboto(
    //             textStyle: Theme.of(context).textTheme.headline6,
    //             fontWeight: FontWeight.normal
    //           ),
    //         )
    //       ],
    //     )
    //   ]
    // );
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