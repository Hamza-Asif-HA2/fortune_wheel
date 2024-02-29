import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fortune_wheel/pages/authorize/auth_user.dart';
import 'package:fortune_wheel/util/setttingButtons.dart';
import 'package:google_fonts/google_fonts.dart';

class settingPage extends StatefulWidget {
  settingPage({super.key});

  @override
  State<settingPage> createState() => _settingPageState();
}

class _settingPageState extends State<settingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.transparent,
        title: Center(
          child: Padding(
            padding: const EdgeInsets.only(right: 25.0),
            child: Text(
              'Settings',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
      backgroundColor: Colors.grey.shade300,
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey.shade300,
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(4, 4),
                        color: Colors.grey.shade500,
                        blurRadius: 8,
                        spreadRadius: 2,
                      ),
                      BoxShadow(
                        offset: Offset(-4, -4),
                        color: Colors.white,
                        blurRadius: 12,
                        spreadRadius: 0,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Icon(
                      Icons.settings,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Settings',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        'Setup your account.',
                        style: GoogleFonts.poppins(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Divider(),
            Row(
              children: [
                Text(
                  'Account',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                settingsButton(
                  SettingName: 'Change password',
                  yourSettingIcon: Icons.password_outlined,
                ),
                settingsButton(
                  SettingName: 'Set username',
                  yourSettingIcon: Icons.supervised_user_circle,
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Divider(),
            Row(
              children: [
                Text(
                  'Privacy and account terms',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                settingsButton(
                  SettingName: 'Privacy policy',
                  yourSettingIcon: Icons.privacy_tip_outlined,
                ),
                settingsButton(
                  SettingName: 'Terms & conditions',
                  yourSettingIcon: Icons.note_alt_outlined,
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                settingsButton(
                  SettingName: 'Frequently AQs',
                  yourSettingIcon: Icons.query_stats,
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Divider(),
            Row(
              children: [
                Text(
                  'Community & Contact Support',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                settingsButton(
                  SettingName: 'Community center',
                  yourSettingIcon: Icons.people,
                ),
                settingsButton(
                  SettingName: 'Contact Support',
                  yourSettingIcon: Icons.contact_mail_outlined,
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Divider(),
            Row(
              children: [
                Text(
                  'Log Out',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () async {
                    // Show a dialog to confirm sign out
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text(
                            "Sign Out",
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          content: Text(
                            "Are you sure you want to sign out?",
                            style: GoogleFonts.poppins(),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context); // Close the dialog
                              },
                              child: Text(
                                "Cancel",
                                style: GoogleFonts.poppins(),
                              ),
                            ),
                            TextButton(
                              onPressed: () async {
                                // Sign out if confirmed
                                await FirebaseAuth.instance.signOut();
                                Navigator.pop(context); // Close the dialog

                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => AuthUser()));
                              },
                              child: Text(
                                "Sign Out",
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: settingsButton(
                    SettingName: 'Sign Out',
                    yourSettingIcon: Icons.logout,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
