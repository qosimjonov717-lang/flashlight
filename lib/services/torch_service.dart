import 'package:torch_light/torch_light.dart';

class TorchService {
  // Telefon fonari mavjudligini tekshiradi
  static Future<bool> isAvailable() async {
    try {
      return await TorchLight.isTorchAvailable();
    } catch (e) {
      return false;
    }
  }

  // Fonarni yoqadi
  static Future<void> turnOn() async {
    await TorchLight.enableTorch();
  }

  // Fonarni o‘chiradi
  static Future<void> turnOff() async {
    await TorchLight.disableTorch();
  }
}