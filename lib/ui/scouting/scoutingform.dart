
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../model/scoutingform.dart';
import '../../model/data/datastore.dart';

class ScoutingFormUI extends StatelessWidget {
  final ScoutingForm data;

  const ScoutingFormUI({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverList(
          delegate: SliverChildListDelegate(
            [
              _ScoutingFormHeader(
                formName: data.formId!,
                teamNumber: data.teamNumber!,
                onRead: () {
                  DataStore().readFromDisk();
                }
              ),
              for (int i = 0; i < data.elements!.length; ++i)
                data.elements![i].wrap(),
            ],
          ),
        ),
      ],
    );
  }
}

class _ScoutingFormHeader extends StatefulWidget {
  final String formName;
  final void Function() onRead;
  int teamNumber;

  _ScoutingFormHeader({Key? key, required this.formName, this.teamNumber = -1, required this.onRead})
      : super(key: key);

  @override
  State<_ScoutingFormHeader> createState() => _ScoutingFormHeaderState();
}

class _ScoutingFormHeaderState extends State<_ScoutingFormHeader> {
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
              child: ColoredBox(color: Colors.teal, child: Container()),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 48.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.find_in_page),
                  iconSize: 30.0,
                  color: Colors.white,
                  onPressed: widget.onRead,
                ),
                Text(
                  widget.formName,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.nunito(
                    textStyle: Theme.of(context).textTheme.headline1,
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    fontSize: 28.0,
                    //height: 0.5,
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.manage_accounts),
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
                                  context,
                                  (newTeamNumber) => setState(
                                      () => widget.teamNumber = newTeamNumber)),
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
                teamNumber: widget.teamNumber == -1 ? -1 : widget.teamNumber,
              ))
        ],
      ),
    );
  }

  Widget _buildSettingsPopupDialog(
      BuildContext context, void Function(int teamNumber) setTeamNumber) {
    TextEditingController _controller = TextEditingController();
    return AlertDialog(
      title: const Text('Settings'),
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
        if (teamNumber != -1 && teamName.isNotEmpty)
          Text(
            teamName,
            style: GoogleFonts.roboto(
                textStyle: Theme.of(context).textTheme.headline1,
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 32.0),
          ),
        if (teamNumber != -1 && teamLocation.isNotEmpty)
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
