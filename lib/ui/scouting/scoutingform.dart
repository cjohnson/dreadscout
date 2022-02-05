import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class ScoutingForm extends StatelessWidget {
  final int pageNumber;

  final List scoutingData = [
    () => CounterFormElement(
          dataName: "Power Cells",
          initialValue: 0,
        ),
    () => CounterFormElement(
          dataName: "Hatch Panels",
          initialValue: 9,
        ),
  ];

  ScoutingForm({Key? key, required this.pageNumber}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverList(
          delegate: SliverChildListDelegate(
            [
              SizedBox(
                height: 275.0,
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: ClipRRect(
                        borderRadius: BorderRadius.vertical(
                            bottom: Radius.circular(30.0)),
                        child: ColorFiltered(
                          colorFilter: ColorFilter.mode(
                              Colors.black.withOpacity(0.2),
                              BlendMode.colorBurn),
                          child: Image(
                            image: AssetImage('asset/image/dreadbots.jpg'),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 48.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            icon: Icon(Icons.arrow_back),
                            iconSize: 30.0,
                            color: Colors.white,
                            onPressed: () {},
                          ),
                          Row(
                            children: [
                              IconButton(
                                icon: Icon(Icons.account_box_rounded),
                                iconSize: 30.0,
                                color: Colors.white,
                                onPressed: () {},
                              ),
                              IconButton(
                                icon: Icon(FontAwesomeIcons.cog),
                                iconSize: 23.0,
                                color: Colors.white,
                                onPressed: () {},
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Positioned(
                        left: 20.0,
                        bottom: 28.0,
                        child: _TitleWidget(
                          teamNumber: 3656,
                          teamName: 'Dreadbots',
                          teamLocation: 'Dexter, Michigan, USA',
                        ))
                  ],
                ),
              ),
              for (int i = 0; i < scoutingData.length; ++i) scoutingData[i](),
            ],
          ),
        ),
      ],
    );
  }
}

class CounterFormElement extends StatefulWidget {
  final String dataName;
  int initialValue;

  CounterFormElement({
    Key? key,
    required this.dataName,
    this.initialValue = 0,
  }) : super(key: key);

  @override
  _CounterFormElementState createState() =>
      _CounterFormElementState(counterState: initialValue);
}

class _CounterFormElementState extends State<CounterFormElement> {
  int counterState;

  _CounterFormElementState({
    required this.counterState,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.dataName,
            style: GoogleFonts.roboto(
                textStyle: Theme.of(context).textTheme.headline1,
                color: Colors.black,
                fontWeight: FontWeight.normal,
                fontSize: 16.0,
                height: 1),
          ),
          ElevatedButton(
            onPressed: () => setState(() {
              counterState--;
            }),
            child: Container(
              padding: EdgeInsets.all(10),
              child: Icon(
                FontAwesomeIcons.minus,
                size: 20,
              ),
            ),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
            ),
          ),
          Text(
            '$counterState',
            style: GoogleFonts.roboto(
                textStyle: Theme.of(context).textTheme.headline1,
                color: Colors.black,
                fontWeight: FontWeight.normal,
                fontSize: 18.0,
                height: 1),
          ),
          ElevatedButton(
            onPressed: () => setState(() {
              counterState++;
            }),
            child: Container(
              padding: EdgeInsets.all(10),
              child: Icon(
                FontAwesomeIcons.plus,
                size: 20,
              ),
            ),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}

class _TitleWidget extends StatelessWidget {
  final int teamNumber;
  final String teamName;
  final String teamLocation;

  const _TitleWidget(
      {Key? key,
      required this.teamNumber,
      required this.teamName,
      required this.teamLocation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        Text(
          '$teamNumber',
          style: GoogleFonts.roboto(
              textStyle: Theme.of(context).textTheme.headline1,
              color: Colors.white,
              fontWeight: FontWeight.w800,
              fontSize: 44.0,
              height: 0.5),
        ),
        Text(
          teamName,
          style: GoogleFonts.roboto(
              textStyle: Theme.of(context).textTheme.headline1,
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 32.0),
        ),
        Row(
          children: [
            Icon(
              FontAwesomeIcons.mapMarkerAlt,
              size: 20.0,
              color: Colors.white,
            ),
            SizedBox(
              width: 5.0,
            ),
            Text(
              'From $teamLocation',
              style: GoogleFonts.nunito(
                  textStyle: Theme.of(context).textTheme.subtitle1,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0),
            )
          ],
        )
      ],
    );
  }
}
