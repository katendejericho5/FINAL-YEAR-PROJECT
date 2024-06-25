import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Settings'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: [
          const SizedBox(height: 16),
          ListTile(
            leading: Icon(Icons.dark_mode),
            trailing: Switch(
              value: _isDarkMode,
              onChanged: (value) {
                setState(() {
                  _isDarkMode = value;
                  // TODO: Implement theme change logic
                });
              },
            ),
            title: const Text('Change Theme'),
            onTap: () {
              // TODO: Implement rating logic (open store page for rating)
            },
          ),
          const SizedBox(height: 10),
          ListTile(
            leading: Icon(Icons.star),
            title: const Text('Rate this App'),
            onTap: () {
              // TODO: Implement rating logic (open store page for rating)
            },
          ),
          const SizedBox(height: 10),
          ListTile(
            leading: Icon(Icons.feedback),
            title: const Text('Send Feedback'),
            onTap: () {
              // TODO: Implement feedback logic (open feedback form or email)
            },
          ),
          const SizedBox(height: 10),
          ListTile(
            leading: Icon(Icons.info),
            title: const Text('Credits'),
            onTap: () {
              // TODO: Implement credits page navigation
            },
          ),
          const SizedBox(height: 10),
          ListTile(
            leading: Icon(Icons.description),
            title: const Text('Terms and Conditions'),
            onTap: () {
              // TODO: Implement terms and conditions page navigation
            },
          ),
        ],
      ),
    );
  }
}
