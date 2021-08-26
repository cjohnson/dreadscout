import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ScoutingForm extends StatelessWidget {
  const ScoutingForm({Key? key, required this.pageNumber}) : super(key: key);

  final int pageNumber;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          expandedHeight: 220.0,
          floating: true,
          pinned: true,
          shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.vertical(bottom: Radius.circular(30.0))),
          flexibleSpace: FlexibleSpaceBar(
            collapseMode: CollapseMode.pin,
            centerTitle: true,
            background: Container(
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(30.0)),
              ),
              child: Stack(
                children: [
                  Positioned.fill(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30.0),
                      child: ColorFiltered(
                        colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.2), BlendMode.colorBurn),
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
                                textStyle:
                                    Theme.of(context).textTheme.headline1,
                                color: Colors.white,
                                fontWeight: FontWeight.w800,
                                fontSize: 44.0,
                                height: 0.5),
                          ),
                          Text(
                            'Dreadbots',
                            style: GoogleFonts.roboto(
                                textStyle:
                                    Theme.of(context).textTheme.headline1,
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
                                'From Dexter, Michigan, USA',
                                style: GoogleFonts.nunito(
                                    textStyle:
                                        Theme.of(context).textTheme.subtitle1,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0),
                              )
                            ],
                          )
                        ],
                      ))
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
