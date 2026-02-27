import 'package:flutter/material.dart';
import 'package:crm_dashboard/screens/deals_pipeline_screen.dart'; // untuk enum DealStage

// Helper untuk mendapatkan warna background berdasarkan stage (khusus Other)
Color? getBackgroundColorForStage(DealStage stage) {
  switch (stage) {
    case DealStage.payment:
      return const Color(0xFFFFF3E0); // orange muda
    case DealStage.won:
      return const Color(0xFFE3F2FD); // biru muda
    case DealStage.lose:
      return const Color(0xFFFFEBEE); // merah muda
    default:
      return null; // tidak ada warna khusus
  }
}

// Helper untuk mendapatkan nama stage dalam Bahasa Indonesia
String getStageName(DealStage stage) {
  switch (stage) {
    case DealStage.newDeal:
      return 'New';
    case DealStage.qualified:
      return 'Qualified';
    case DealStage.advanced:
      return 'Advanced';
    case DealStage.payment:
      return 'Payment';
    case DealStage.won:
      return 'Won';
    case DealStage.lose:
      return 'Lost';
  }
}

// Helper untuk mendapatkan warna stage
Color getStageColor(DealStage stage) {
  switch (stage) {
    case DealStage.newDeal:
      return Colors.blue.shade400;
    case DealStage.qualified:
      return Colors.yellow.shade600;
    case DealStage.advanced:
      return Colors.green.shade400;
    case DealStage.payment:
      return Colors.deepOrange;
    case DealStage.won:
      return Colors.blue;
    case DealStage.lose:
      return Colors.red;
  }
}
