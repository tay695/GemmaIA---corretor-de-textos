import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:gemma_corrigi/sevices/ai_service.dart';
import 'package:gemma_corrigi/view/SplashView.dart';
import 'package:gemma_corrigi/view/home_view.dart';
import 'package:gemma_corrigi/view/result_view.dart';
import 'package:gemma_corrigi/view_models/correction_view_models.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // 2. Carrega as variáveis do arquivo .env
  await dotenv.load(fileName: ".env");

  final apiKey = dotenv.env['api_key'] ?? "";

  // 4. Instancia as camadas do MVVM
  final aiService = AiService(apiKey);
  final viewModel = CorrectionViewModels(aiService);

  runApp(MyApp(viewModel: viewModel));
}

class MyApp extends StatelessWidget {
  final CorrectionViewModels viewModel;
  const MyApp({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gemma Corretor',
      theme: ThemeData(primarySwatch: Colors.deepPurple, useMaterial3: true),
      // Definimos a rota inicial
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashView(),
        '/home': (context) => HomeView(viewModel: viewModel),
        '/result': (context) => ResultView(viewModel: viewModel),
      },
    );
  }
}
