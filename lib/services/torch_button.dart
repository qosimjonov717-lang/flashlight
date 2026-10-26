import 'package:flutter/material.dart';

class TorchButton extends StatelessWidget {
  final bool isOn;
  final bool isLoading;
  final VoidCallback onTap;

  const TorchButton({
    super.key,
    required this.isOn,
    required this.isLoading,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isLoading ? null : onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        width: 190,
        height: 190,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isOn
              ? const Color(0xFFFBBF24)
              : const Color(0xFF64748B),
          boxShadow: [
            BoxShadow(
              color: isOn
                  ? const Color(0xFFFBBF24).withOpacity(0.45)
                  : Colors.black.withOpacity(0.35),
              blurRadius: isOn ? 35 : 20,
              spreadRadius: isOn ? 8 : 3,
            ),
          ],
          border: Border.all(
            color: isOn
                ? const Color(0xFFFFD75A)
                : const Color(0xFF334155),
            width: 8,
          ),
        ),
        child: Center(
          child: isLoading
              ? const SizedBox(
                  width: 45,
                  height: 45,
                  child: CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 4,
                  ),
                )
              : const Icon(
                  Icons.flashlight_on,
                  size: 65,
                  color: Colors.white,
                ),
        ),
      ),
    );
  }
}