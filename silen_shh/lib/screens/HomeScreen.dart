// This code shows basic implementation of sound modes
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share/share.dart';
import 'package:sound_mode/permission_handler.dart';
import 'package:sound_mode/sound_mode.dart';
import 'package:sound_mode/utils/sound_profiles.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<HomeScreen> {
  String _soundMode = 'Unknown';
  String _permissionStatus;

  @override
  void initState() {
    super.initState();
    getCurrentSoundMode();
    getPermissionStatus();
  }

  Future<void> getCurrentSoundMode() async {
    String ringerStatus;

    if (!mounted) return;

    setState(() {
      _soundMode = ringerStatus;
    });
  }

  Future<void> getPermissionStatus() async {
    bool permissionStatus = false;
    try {
      permissionStatus = await PermissionHandler.permissionsGranted;
      print(permissionStatus);
    } catch (err) {
      print(err);
    }

    setState(() {
      _permissionStatus =
          permissionStatus ? "Permissions Enabled" : "Permissions not granted";
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Silent-Shh'),
          actions: [
            PopupMenuButton<String>(
              icon: Icon(Icons.more_vert),
              onSelected: (String choice) {
                _handleMenuItemClick(choice);
              },
              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                PopupMenuItem<String>(
                  value: 'Settings',
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.settings, color: Colors.blue),
                      Text('Settings')
                    ],
                  ),
                ),
                PopupMenuItem<String>(
                  value: 'Feedback',
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.mail, color: Colors.blue),
                      Text('Feedback')
                    ],
                  ),
                ),
                PopupMenuItem<String>(
                  value: 'Share',
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.share, color: Colors.blue),
                      Text('Share')
                    ],
                  ),
                ),
                PopupMenuItem<String>(
                  value: 'About',
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.info_outline, color: Colors.blue),
                      Text('About')
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                  child: Text(
                'Give do not disturb access to app in Open Do not Disturb access settings',
                textAlign: TextAlign.center,
              )),
              RaisedButton(
                onPressed: () => setNormalMode(),
                child: Text('Set Normal mode'),
              ),
              RaisedButton(
                onPressed: () => setSilentMode(),
                child: Text('Set Silent mode'),
              ),
              RaisedButton(
                onPressed: () => setVibrateMode(),
                child: Text('Set Vibrate mode'),
              ),
              RaisedButton(
                onPressed: () => openDoNotDisturbSettings(),
                child: Text('Open Do Not Access Settings'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> setSilentMode() async {
    String message;

    try {
      message = await SoundMode.setSoundMode(Profiles.SILENT);

      setState(() {
        _soundMode = message;
      });
    } on PlatformException {
      print('Do Not Disturb access permissions required!');
    }
  }

  Future<void> setNormalMode() async {
    String message;

    try {
      message = await SoundMode.setSoundMode(Profiles.NORMAL);
      setState(() {
        _soundMode = message;
      });
    } on PlatformException {
      print('Do Not Disturb access permissions required!');
    }
  }

  Future<void> setVibrateMode() async {
    String message;

    try {
      message = await SoundMode.setSoundMode(Profiles.VIBRATE);

      setState(() {
        _soundMode = message;
      });
    } on PlatformException {
      print('Do Not Disturb access permissions required!');
    }
  }

  Future<void> openDoNotDisturbSettings() async {
    await PermissionHandler.openDoNotDisturbSetting();
  }

  String getUrl(
      String scheme, String path, Map<String, String> queryParameters) {
    String url = '$scheme:$path?';

    queryParameters.forEach((String k, String v) {
      url += '$k=$v&';
    });

    return url;
  }

  void _handleMenuItemClick(String choice) {
    switch (choice) {
      case "Share":
        Share.share(
            "Mute your phone and be indistractable.\nhttps://github.com/Cybertron-Avneesh/Silen-Shh");
        break;
      case "Feedback":
        var _scheme = 'mailto';
        var _path = 'email1234@email.com';
        var _queryParameters = {'subject': 'Feedback of the app silen_shh'};
        launch(getUrl(_scheme, _path, _queryParameters));
        break;
      default:
    }
  }
}
