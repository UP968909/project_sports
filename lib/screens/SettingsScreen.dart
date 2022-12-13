import 'package:babstrap_settings_screen/babstrap_settings_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sport_test/src/login.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  void _showAction(BuildContext context, int index) {
    showDialog<void>(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: const Text('are .you sure ?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const HomePage())),
              child: const Text('Accept'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    bool isSwitched = false;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Settings'),
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: ListView(
          children: [
            // You can add a settings title
            SettingsGroup(
              settingsGroupTitle: "Account",
              items: [
                SettingsItem(
                  icons: CupertinoIcons.person,
                  iconStyle: IconStyle(
                      backgroundColor: Colors.purple,
                      withBackground: true,
                      iconsColor: Colors.white),
                  onTap: () {},
                  title: 'Member Info',
                  subtitle: 'manage your membership',
                ),
                SettingsItem(
                  onTap: () {},
                  icons: Icons.exit_to_app_outlined,
                  iconStyle: IconStyle(
                      backgroundColor: Colors.purple,
                      withBackground: true,
                      iconsColor: Colors.white),
                  title: "Sign Out",
                ),
              ],
            ),
            SettingsGroup(
              settingsGroupTitle: 'App preferences',
              items: [
                SettingsItem(
                  onTap: () {},
                  icons: Icons.edit,
                  iconStyle: IconStyle(
                      iconsColor: Colors.white,
                      withBackground: true,
                      backgroundColor: Colors.purple),
                  title: 'Appearance',
                  subtitle: "Make the App yours",
                ),
                SettingsItem(
                  onTap: () {},
                  icons: CupertinoIcons.lock_shield_fill,
                  iconStyle: IconStyle(
                    iconsColor: Colors.white,
                    withBackground: true,
                    backgroundColor: Colors.purple,
                  ),
                  title: 'Privacy',
                ),
                SettingsItem(
                  onTap: () {},
                  icons: Icons.dark_mode_rounded,
                  iconStyle: IconStyle(
                    iconsColor: Colors.white,
                    withBackground: true,
                    backgroundColor: Colors.purple,
                  ),
                  title: 'Dark mode',
                  subtitle: "Automatic",
                  trailing: Switch.adaptive(
                    value: false,
                    onChanged: (value) {
                      setState() {
                        isSwitched = true;
                      }
                    },
                  ),
                ),
              ],
            ),
            SettingsGroup(
              settingsGroupTitle: 'Privacy',
              items: [
                SettingsItem(
                  onTap: () {},
                  icons: Icons.info_rounded,
                  iconStyle: IconStyle(
                    backgroundColor: Colors.purple,
                  ),
                  title: 'About',
                  subtitle: "Learn more about the App",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
