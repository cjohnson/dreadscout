import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../data/datastore.dart';
import '../data/scoutingdata.dart';
import '../form/counterformelement.dart';
import '../form/data/scoutingtemplate.dart';
import '../form/switchformelement.dart';
import '../form/togglebuttonelement.dart';

class ScoutingForm extends StatelessWidget {
  final String formName;
  final int teamNumber;
  late final ScoutingData data;

  late final CounterFormElement test;

  ScoutingForm({Key? key, required this.formName, required this.teamNumber})
      : super(key: key) {
    data = ScoutingData();

    test = CounterFormElement(
        id: "test_id", title: "TEST OBJECT", value: 2, lowerBound: 0);
  }

  final List formWidgets = [
    () => CounterFormElementUI(
          formElement: CounterFormElement(
              id: "low_goal", title: "Low Goal", value: 0, lowerBound: 0),
        ),
    // () => CounterFormElement(dataName: "High Goal", value: 0),
    () => SwitchFormElementUI(
          dataName: "Taxi",
          initialValue: false,
        ),
    // () => CounterFormElement(dataName: "Low Goal", value: 0),
    // () => CounterFormElement(dataName: "High Goal", value: 0),
    () => SwitchFormElementUI(
          dataName: "Effective Defense",
          initialValue: false,
        ),
    () => ToggleButtonFormElementUI(
          dataName: "Climb",
          initialToggle: 0,
        ),
    () => SwitchFormElementUI(
          dataName: "Robot Broke?",
          initialValue: false,
        ),
  ];

  void saveData() {
    DataStore().scoutingForms[formName] = data;
    print(data.toJson());
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverList(
          delegate: SliverChildListDelegate(
            [
              _ScoutingFormHeader(
                formName: formName,
                teamNumber: teamNumber,
              ),
              for (int i = 0; i < formWidgets.length; ++i) formWidgets[i](),
            ],
          ),
        ),
      ],
    );
  }
}

class _ScoutingFormHeader extends StatelessWidget {
  final String formName;
  int teamNumber;

  _ScoutingFormHeader({Key? key, required this.formName, this.teamNumber = -1})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 275.0,
      child: Stack(
        children: [
          Positioned.fill(
            child: ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(bottom: Radius.circular(30.0)),
              // child: ColorFiltered(
              //   colorFilter: ColorFilter.mode(
              //       Colors.black.withOpacity(0.2),
              //       BlendMode.colorBurn),
              //   child: const Image(
              //     image: AssetImage('asset/image/dreadbots.jpg'),
              //     fit: BoxFit.fill,
              //   ),
              // ),
              child: ColoredBox(color: Colors.teal, child: Container()),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 48.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back),
                  iconSize: 30.0,
                  color: Colors.white,
                  onPressed: () {},
                ),
                Text(
                  formName,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.nunito(
                      textStyle: Theme.of(context).textTheme.headline1,
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                      fontSize: 25.0,
                      height: 0.5),
                ),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.refresh),
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
                          builder: (BuildContext context) =>
                              _buildSettingsPopupDialog(
                                  context, (newTeamNumber) => teamNumber),
                        );
                      },
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
                teamNumber: teamNumber == -1 ? -1 : teamNumber,
                // teamName: 'Dreadbots',
                // teamLocation: 'Dexter, Michigan, USA',
              ))
        ],
      ),
    );
  }

  Widget _buildSettingsPopupDialog(
      BuildContext context, void Function(int teamNumber) setTeamNumber) {
    TextEditingController _controller = TextEditingController();
    return AlertDialog(
      title: const Text('Match Settings'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Team Number',
            ),
            controller: _controller,
          ),
        ],
      ),
      actions: <Widget>[
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              int? teamNumber = int.tryParse(_controller.text);
              setTeamNumber.call(teamNumber ?? -1);
            },
            child: const Text('Done'))
      ],
    );
  }
}

class _TitleWidget extends StatelessWidget {
  final int teamNumber;
  final String teamName;
  final String teamLocation;

  _TitleWidget(
      {Key? key,
      required this.teamNumber,
      this.teamName = "",
      this.teamLocation = ""})
      : super(key: key);

  String _getTeamString() {
    if (teamNumber == -1) return '----';
    return '$teamNumber';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        Text(
          _getTeamString(),
          style: GoogleFonts.roboto(
              textStyle: Theme.of(context).textTheme.headline1,
              color: Colors.white,
              fontWeight: FontWeight.w800,
              fontSize: 44.0,
              height: 0.5),
        ),
        // if(teamNumber != -1)
        //   Text(
        //     teamName,
        //     style: GoogleFonts.roboto(
        //         textStyle: Theme.of(context).textTheme.headline1,
        //         color: Colors.white,
        //         fontWeight: FontWeight.w700,
        //         fontSize: 32.0),
        //   ),
        // if(teamNumber != -1)
        //   Row(
        //     children: [
        //       const Icon(
        //         FontAwesomeIcons.mapMarkerAlt,
        //         size: 20.0,
        //         color: Colors.white,
        //       ),
        //       const SizedBox(
        //         width: 5.0,
        //       ),
        //       Text(
        //         'From $teamLocation',
        //         style: GoogleFonts.nunito(
        //             textStyle: Theme.of(context).textTheme.subtitle1,
        //             color: Colors.white,
        //             fontWeight: FontWeight.bold,
        //             fontSize: 20.0),
        //       )
        //     ],
        //   )
      ],
    );
  }
}
