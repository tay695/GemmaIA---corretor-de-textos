import 'package:flutter/material.dart';
import 'package:gemma_corrigi/view_models/correction_view_models.dart';

class ResultView extends StatelessWidget {
  final CorrectionViewModels viewModel;

  const ResultView({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Texto Corrigido"), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.deepPurple.shade100),
                ),
                child: SingleChildScrollView(
                  child: Text(
                    viewModel.textoCorrigido,
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Voltar e Editar"),
            ),
          ],
        ),
      ),
    );
  }
}
