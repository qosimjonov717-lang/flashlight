import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F4F6),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF3F4F6),
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Color(0xFF0F172A),
          ),
        ),
        title: const Text(
          'Sozlamalar',
          style: TextStyle(
            color: Color(0xFF0F172A),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const SizedBox(height: 20),

          // APP ICON
          Center(
            child: Container(
              width: 90,
              height: 90,
              decoration: BoxDecoration(
                color: const Color(0xFF2563EB),
                borderRadius: BorderRadius.circular(24),
              ),
              child: const Icon(
                Icons.flashlight_on,
                color: Colors.white,
                size: 52,
              ),
            ),
          ),

          const SizedBox(height: 15),

          const Center(
            child: Text(
              'Flashlight',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Color(0xFF0F172A),
              ),
            ),
          ),

          const SizedBox(height: 5),

          const Center(
            child: Text(
              'v1.0.0',
              style: TextStyle(
                color: Color(0xFF64748B),
              ),
            ),
          ),

          const SizedBox(height: 30),

          _settingItem(
            icon: Icons.light_mode_outlined,
            title: 'Ilova haqida',
            onTap: () {
              showAboutDialog(
                context: context,
                applicationName: 'Flashlight',
                applicationVersion: '1.0.0',
                applicationIcon: const Icon(
                  Icons.flashlight_on,
                  color: Color(0xFF2563EB),
                  size: 40,
                ),
                children: const [
                  Text(
                    'Oddiy va qulay telefon fonari ilovasi.',
                  ),
                ],
              );
            },
          ),

          _settingItem(
            icon: Icons.star_border,
            title: 'Baholash',
            onTap: () {},
          ),

          _settingItem(
            icon: Icons.share_outlined,
            title: 'Ulashish',
            onTap: () {},
          ),

          _settingItem(
            icon: Icons.shield_outlined,
            title: 'Maxfiylik siyosati',
            onTap: () {},
          ),

          const SizedBox(height: 25),

          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: const Color(0xFFE7EEF9),
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Row(
              children: [
                Icon(
                  Icons.favorite,
                  color: Color(0xFF1E426F),
                  size: 28,
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'Siz uchun qulay ilova\nGo‘zallik kichik narsalarda',
                    style: TextStyle(
                      color: Color(0xFF334155),
                      fontSize: 13,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static Widget _settingItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 1),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            color: Color(0xFFE5E7EB),
          ),
        ),
      ),
      child: ListTile(
        onTap: onTap,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        leading: Icon(
          icon,
          color: const Color(0xFF334155),
        ),
        title: Text(
          title,
          style: const TextStyle(
            color: Color(0xFF334155),
            fontSize: 14,
          ),
        ),
        trailing: const Icon(
          Icons.chevron_right,
          color: Color(0xFF64748B),
        ),
      ),
    );
  }
}