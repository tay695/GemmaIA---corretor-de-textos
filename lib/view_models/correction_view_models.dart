import 'package:flutter/material.dart';
import 'package:gemma_corrigi/sevices/ai_service.dart';

class CorrectionViewModels extends ChangeNotifier {
  final AiService _aiService;
  CorrectionViewModels(this._aiService);
  String textoCorrigido = "";
  bool loading = false;
  List<String> historico = [];
  Future<void> corrigir(String input) async {
    if (input.isEmpty) return;
    loading = true;
    notifyListeners();
    try {
      textoCorrigido = await _aiService.corrigirTexto(input);
      historico.add(textoCorrigido);
    } catch (e) {
      textoCorrigido = "Erro ao se conectar: $e";
    } finally {
      loading = false;
      notifyListeners();
    }
  }
}
