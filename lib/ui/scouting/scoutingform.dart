import 'package:dreadscout/ui/form/switchformelement.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../form/counterformelement.dart';
import '../form/togglebuttonelement.dart';

class ScoutingForm extends StatelessWidget {
  final int pageNumber;

  final List scoutingData = [
    () => CounterFormElement(
          dataName: "Low Goal",
          initialValue: 0,
        ),
    () => CounterFormElement(
          dataName: "High Goal",
          initialValue: 0,
        ),
    () => SwitchFormElement(
          dataName: "Taxi",
          initialValue: false,
        ),
    () => CounterFormElement(
          dataName: "Low Goal",
          initialValue: 0,
        ),
    () => CounterFormElement(
          dataName: "High Goal",
          initialValue: 0,
        ),
    () => SwitchFormElement(
          dataName: "Effective Defense",
          initialValue: false,
        ),
    () => ToggleButtonFormElement(
          dataName: "Climb",
          initialToggle: 0,
        ),
    () => SwitchFormElement(
          dataName: "Robot Broke?",
          initialValue: false,
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
                        borderRadius: const BorderRadius.vertical(
                            bottom: Radius.circular(30.0)),
                        child: ColorFiltered(
                          colorFilter: ColorFilter.mode(
                              Colors.black.withOpacity(0.2),
                              BlendMode.colorBurn),
                          child: const Image(
                            image: AssetImage('asset/image/dreadbots.jpg'),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 48.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.arrow_back),
                            iconSize: 30.0,
                            color: Colors.white,
                            onPressed: () {},
                          ),
                          Row(
                            children: [
                              IconButton(
                                icon: const Icon(Icons.account_box_rounded),
                                iconSize: 30.0,
                                color: Colors.white,
                                onPressed: () {},
                              ),
                              IconButton(
                                icon: const Icon(FontAwesomeIcons.cog),
                                iconSize: 23.0,
                                color: Colors.white,
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) => _buildSettingsPopupDialog(context),
                                  );
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    const Positioned(
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

  Widget _buildSettingsPopupDialog(BuildContext context) {
    return AlertDialog(
      title: const Text('Match Settings'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const <Widget>[
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Team Number'
            ),
          ),
        ],
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Close')
        )
      ],
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
            const Icon(
              FontAwesomeIcons.mapMarkerAlt,
              size: 20.0,
              color: Colors.white,
            ),
            const SizedBox(
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
