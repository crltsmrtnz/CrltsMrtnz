import 'package:flutter/material.dart';
import 'package:porfolio/pages/home.dart';
import 'package:porfolio/pages/about.dart';
import 'package:porfolio/pages/porfolio/app.dart';
import 'package:porfolio/pages/porfolio/email_templates.dart';
import 'package:porfolio/pages/porfolio/web.dart';
import 'package:porfolio/pages/user_page.dart';
import 'package:flutter_social_button/flutter_social_button.dart';
import 'package:url_launcher/url_launcher.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) => Drawer(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              buildHeader(context),
              buildSocials(context),
              buildMenuItems(context)
            ],
          ),
        ),
      );
  Widget buildHeader(BuildContext context) => Material(
        color: Colors.blue.shade800,
        child: InkWell(
          onTap: () {
            // Navigator.pop(context); // Close navigations
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const AvatarDetail(),
              ),
            );
          },
          child: Container(
            padding: EdgeInsets.only(
              top: 24 + MediaQuery.of(context).padding.top,
              bottom: 24,
            ),
            child: const Column(
              children: [
                CircleAvatar(
                  radius: 52,
                  backgroundImage: AssetImage('assets/img/CrltsMrtnz.png'),
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  "Carlos Martínez",
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
                Text(
                  "Front-End Developer \n Technical CRM Specialist",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 12, color: Colors.white),
                )
              ],
            ),
          ),
        ),
      );

  Widget buildMenuItems(BuildContext context) => Container(
        padding: const EdgeInsets.all(15),
        child: Wrap(
          runSpacing: 16, //vertical Spacing
          children: [
            ListTile(
              leading: const Icon(Icons.home_outlined),
              title: const Text("Home"),
              onTap: () => Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const Home(),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person_outline),
              title: const Text("About me"),
              onTap: () {
                // close navigations menu
                Navigator.pop(context);
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const About(),
                ));
              },
            ),

            ExpansionTile(
              leading: const Icon(Icons.work_history_outlined),
              title: const Text(
                "Porfolio",
              ),
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        ListTile(
                          leading: const Icon(Icons.desktop_mac_outlined),
                          title: const Text(
                            "Web",
                          ),
                          onTap: () {
                            // close navigations menu
                            Navigator.pop(context);
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => const Web(),
                              ),
                            );
                          },
                        ),
                        ListTile(
                          leading: const Icon(Icons.smartphone_outlined),
                          title: const Text(
                            "App",
                          ),
                          onTap: () {
                            // close navigations menu
                            Navigator.pop(context);
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => const App(),
                              ),
                            );
                          },
                        ),
                        ListTile(
                          leading: const Icon(Icons.code_outlined),
                          title: const Text(
                            "Email templates",
                          ),
                          onTap: () {
                            // close navigations menu
                            Navigator.pop(context);
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => const EmailTemplates(),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            // ListView(children: getList())
          ],
        ),
      );

  Widget buildSocials(BuildContext context) => Material(
        color: Colors.blue.shade800,
        child: Container(
          padding: EdgeInsets.only(
            top: 24 + MediaQuery.of(context).padding.top,
            bottom: 24,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FlutterSocialButton(
                onTap: () {},
                mini: true,
              ),
              FlutterSocialButton(
                onTap: () {
                  _makePhoneCall(phoneNumber);
                },
                mini: true,
                buttonType: ButtonType.facebook,
              ),
              // +595972264992
              FlutterSocialButton(
                onTap: () {
                  callBtn();
                },
                mini: true,
                buttonType: ButtonType.google,
              ),
            ],
          ),
        ),
      );
  getList() {
    [
      basicTiles.map(buildTile).toList(),
    ];
  }
}

Widget callBtn() {
  const number = '+595972264992';

  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      padding: const EdgeInsets.all(50),
      textStyle: const TextStyle(fontSize: 24),
    ),
    child: const Text('Call'),
    onPressed: () async {
      launch("tel://$number");
      await FlutterPhoneDirectCaller.callNumber(number);
    },
  );
}

const phoneNumber = '+595972264992';
void _makePhoneCall(String phoneNumber) async {
  final url = 'tel:$phoneNumber';
  if (await canLaunchUrl(url as Uri)) {
    await launchUrl(url as Uri);
  } else {
    throw 'Could not make the phone call.';
  }
}

class FlutterPhoneDirectCaller {
  static callNumber(String number) {}
}

// Sub item to porfolio section
class BasicTile {
  final String? title;
  final List<BasicTile>? tiles;

  const BasicTile({
    required this.title,
    this.tiles = const [],
  });
}

final basicTiles = <BasicTile>[
  const BasicTile(
    title: 'Previuos Works',
    tiles: [
      BasicTile(title: 'Email'),
      BasicTile(title: 'Web'),
      BasicTile(title: 'App'),
    ],
  ),
  const BasicTile(
    title: 'Continent',
    tiles: [
      BasicTile(
        title: 'Asia',
        tiles: [
          BasicTile(title: '1'),
          BasicTile(title: '2'),
          BasicTile(title: '3'),
        ],
      ),
      BasicTile(
        title: 'Europa',
        tiles: [
          BasicTile(title: '1'),
          BasicTile(title: '2'),
          BasicTile(title: '3'),
        ],
      ),
    ],
  ),
];

Widget buildTile(BasicTile tile, {double leftPadding = 16}) {
  if (tile.tiles!.isEmpty) {
    return ListTile(
      contentPadding: EdgeInsets.only(left: leftPadding),
      title: Text(tile.title!),
      // onTap: () => Navigator.push(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) => DetailsPage(tile: tile),
      //   ),
      // ),
    );
  } else {
    return ExpansionTile(
      tilePadding: EdgeInsets.only(left: leftPadding), //
      trailing: const SizedBox.shrink(),
      leading: const Icon(Icons.keyboard_arrow_right_outlined),

      ///

      title: Text(tile.title!),
      children: tile.tiles!
          .map((tile) => buildTile(tile, leftPadding: 16 + leftPadding))
          .toList(),
    );
  }
}
