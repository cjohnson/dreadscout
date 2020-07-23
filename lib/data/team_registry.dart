/*
The MIT License (MIT)

Copyright (c) 2020 Collin Johnson/FRC Team 3656

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
 */

/// Represents the Team Registry Object, which stores all known teams on the device.
class TeamRegistry {
  /// List of Team Registers.
  List<TeamRegister> teamRegister;

  /// Default Optional Args Constructor.
  TeamRegistry({this.teamRegister});

  /// Custom Named Constructor to convert JSON Map Formatting to an instance of [TeamRegistry]
  TeamRegistry.fromJson(Map<String, dynamic> json) {
    if (json['teamRegister'] != null) {
      teamRegister = new List<TeamRegister>();
      json['teamRegister'].forEach((v) {
        teamRegister.add(new TeamRegister.fromJson(v));
      });
    }
  }

  /// Method to convert instance of [TeamRegistry] to JSON Map Formatting.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.teamRegister != null) {
      data['teamRegister'] = this.teamRegister.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

/// Represents a [TeamRegister] Object.
class TeamRegister {
  /// FIRST Robotics Competition Team Number
  int teamNum;

  /// Default Optional Args Constructor
  TeamRegister({this.teamNum});

  /// Custom Named Constructor to convert JSON Map Formatting to an instance of [TeamRegister]
  TeamRegister.fromJson(Map<String, dynamic> json) {
    teamNum = json['teamNum'];
  }

  /// Method to convert instance of [TeamRegister] to JSON Map Formatting.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['teamNum'] = this.teamNum;
    return data;
  }
}