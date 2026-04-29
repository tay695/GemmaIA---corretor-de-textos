import 'package:google_generative_ai/google_generative_ai.dart';

class AiService {
  final GenerativeModel _model;
  AiService(String apiKey)
    : _model = GenerativeModel(model: 'gemma-3-27b-it', apiKey: apiKey);

  Future<String> corrigirTexto(String texto) async {
    final prompt = [
      Content.text(
        "De acordo com as normas de lingua portuguesa. Corrija o texto a seguir, pontuando coerencia, normas de acentuação, pontuação e melhoria de escrita: $texto",
      ),
    ];
    final response = await _model.generateContent(prompt as Iterable<Content>);
    return response.text ?? "Não foi possivel corrigir este texto";
  }
}
