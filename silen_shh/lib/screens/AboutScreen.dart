import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutSCreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text("About"),
        ),
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
                  child: Text(
                    "About App",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  child: Text(
                    "Our aim is to develop an android app, which can automatically mute your phone based on timings set by your or based on particular Wifi.",
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  child: Text(
                    "User would be able to set Time-range in which your phone will be automatically muted.",
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  child: Text(
                    " Also, user can choose a particular Wifi, and whenever device will come in range of the Wifi, it will be muted automatically.",
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
                  child: Text(
                    "Developers",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Developer(name: "D1",avatar: "",facebook: "",instagram: "",github: "",linkedn: "",),
                Developer(name: "D2",avatar: "",facebook: "",instagram: "",github: "",linkedn: "",),

              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Developer extends StatelessWidget {
  final String facebook;
  final String instagram;
  final String github;
  final String linkedn;
  final String name;
  final String avatar;

  const Developer(
      {Key key, this.facebook, this.instagram, this.github, this.linkedn, this.name, this.avatar})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blueAccent)
      ),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                child: CircleAvatar(
                  maxRadius: 25,
                  backgroundImage: NetworkImage(avatar),
                ),
                decoration: new BoxDecoration(
                  color: Colors.black, // border color
                  shape: BoxShape.circle,
                ),
              ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(name,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 30
                  ),),
                ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    launch(
                        github);
                  },
                  child: Image.asset(
                    'assets/images/github-logo.png',
                    width: MediaQuery.of(context).size.width / 8,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: GestureDetector(
                    onTap: () {
                      launch(
                          facebook);
                    },
                    child: Image.asset(
                      'assets/images/facebook.png',
                      width: MediaQuery.of(context).size.width / 8,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    launch(
                        linkedn);
                  },
                  child: Image.asset(
                    'assets/images/linkedin.png',
                    height: MediaQuery.of(context).size.height / 16,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    launch(
                        instagram);
                  },
                  child: Image.asset(
                    'assets/images/instagram.png',
                    height: MediaQuery.of(context).size.height / 16,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
