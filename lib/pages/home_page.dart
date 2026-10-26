
import 'package:flashlight/services/torch_button.dart';
import 'package:flutter/material.dart';

import '../services/torch_service.dart';

import 'settings_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isTorchOn = false;
  bool isLoading = false;

  // ============================================================
  // FONARNI YOQISH / O'CHIRISH
  // ============================================================

  Future<void> toggleTorch() async {
    if (isLoading) return;

    setState(() {
      isLoading = true;
    });

    try {
      // Telefon fonari mavjudligini tekshiramiz
      final available = await TorchService.isAvailable();

      if (!available) {
        if (!mounted) return;

        setState(() {
          isLoading = false;
        });

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'Bu telefonda fonar mavjud emas.',
            ),
            behavior: SnackBarBehavior.floating,
          ),
        );

        return;
      }

      // Agar fonar yoqilgan bo'lsa — o'chiramiz
      if (isTorchOn) {
        await TorchService.turnOff();

        if (!mounted) return;

        setState(() {
          isTorchOn = false;
          isLoading = false;
        });
      }

      // Agar fonar o'chiq bo'lsa — yoqamiz
      else {
        await TorchService.turnOn();

        if (!mounted) return;

        setState(() {
          isTorchOn = true;
          isLoading = false;
        });
      }
    } catch (e) {
      if (!mounted) return;

      setState(() {
        isLoading = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Fonarni boshqarishda xatolik: $e',
          ),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  // ============================================================
  // UI
  // ============================================================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 22,
          ),
          child: Column(
            children: [
              const SizedBox(height: 20),

              // ==================================================
              // HEADER
              // ==================================================

              Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: const Color(0xFF2563EB),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: const Icon(
                      Icons.flashlight_on,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),

                  const SizedBox(width: 12),

                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Flashlight',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 21,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 3),
                        Text(
                          'Qulay va oddiy chiroq',
                          style: TextStyle(
                            color: Color(0xFF94A3B8),
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),

                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const SettingsPage(),
                        ),
                      );
                    },
                    icon: const Icon(
                      Icons.settings_outlined,
                      color: Colors.white,
                      size: 28,
                    ),
                  ),
                ],
              ),

              // ==================================================
              // BO'SH JOY
              // ==================================================

              const Spacer(),

              // ==================================================
              // KATTA FONAR TUGMASI
              // ==================================================

              TorchButton(
                isOn: isTorchOn,
                isLoading: isLoading,
                onTap: toggleTorch,
              ),

              const SizedBox(height: 30),

              // ==================================================
              // STATUS
              // ==================================================

              AnimatedSwitcher(
                duration: const Duration(
                  milliseconds: 300,
                ),
                child: Column(
                  key: ValueKey(
                    '$isTorchOn-$isLoading',
                  ),
                  children: [
                    Text(
                      isLoading
                          ? 'Yoqilmoqda...'
                          : isTorchOn
                              ? 'Chiroq yoqiq'
                              : 'Chiroq o‘chiq',
                      style: TextStyle(
                        color: isTorchOn
                            ? const Color(0xFFFBBF24)
                            : Colors.white,
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 8),

                    Text(
                      isLoading
                          ? 'Iltimos, kuting'
                          : isTorchOn
                              ? 'Chiroqni o‘chirish uchun tugmani bosing'
                              : 'Chiroqni yoqish uchun tugmani bosing',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Color(0xFF94A3B8),
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),

              // ==================================================
              // BO'SH JOY
              // ==================================================

              const Spacer(),

              // ==================================================
              // MASLAHAT CARD
              // ==================================================

              AnimatedContainer(
                duration: const Duration(
                  milliseconds: 300,
                ),
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: isTorchOn
                      ? const Color(0xFF6B5315)
                      : const Color(0xFF17243B),
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                    color: isTorchOn
                        ? const Color(0xFF9A761B)
                        : const Color(0xFF24344F),
                  ),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.lightbulb_outline,
                      color: isTorchOn
                          ? const Color(0xFFFBBF24)
                          : const Color(0xFFCBD5E1),
                      size: 30,
                    ),

                    const SizedBox(width: 12),

                    const Expanded(
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Maslahat',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),

                          SizedBox(height: 3),

                          Text(
                            'Zarur bo‘lganda chiroqdan foydalaning.',
                            style: TextStyle(
                              color: Color(0xFFCBD5E1),
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),
            ],
          ),
        ),
      ),
    );
  }
}

