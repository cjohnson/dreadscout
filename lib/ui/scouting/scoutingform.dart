import 'package:dreadscout/ui/form/switchformelement.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../form/counterformelement.dart';
import '../form/togglebuttonelement.dart';

class ScoutingForm extends StatefulWidget {
  final int pageNumber;

  ScoutingForm({Key? key, required this.pageNumber}) : super(key: key);

  @override
  State<ScoutingForm> createState() => _ScoutingFormState();
}

class _ScoutingFormState extends State<ScoutingForm> {
  int teamNumber = -1;

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

  void setTeamNumber(int teamNumber) {
    setState(() {
      this.teamNumber = teamNumber;
    });
  }

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
                        // child: ColorFiltered(
                        //   colorFilter: ColorFilter.mode(
                        //       Colors.black.withOpacity(0.2),
                        //       BlendMode.colorBurn),
                        //   child: const Image(
                        //     image: AssetImage('asset/image/dreadbots.jpg'),
                        //     fit: BoxFit.fill,
                        //   ),
                        // ),
                        child: ColoredBox(
                          color: Colors.black,
                          child: Container()
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
                                    builder: (BuildContext context) => _buildSettingsPopupDialog(context, setTeamNumber),
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
              ),
              for (int i = 0; i < scoutingData.length; ++i) scoutingData[i](),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSettingsPopupDialog(BuildContext context, void Function(int teamNumber) setTeamNumber) {
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
            setTeamNumber.call(teamNumber?? -1);
          },
          child: const Text('Done')
        )
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
    if(teamNumber == -1) return '----';
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
          '${_getTeamString()}',
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
