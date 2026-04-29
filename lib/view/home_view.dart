import 'package:flutter/material.dart';
import 'package:gemma_corrigi/view_models/correction_view_models.dart';

class HomeView extends StatefulWidget {
  final CorrectionViewModels viewModel;
  const HomeView({super.key, required this.viewModel});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: widget.viewModel,
      builder: (context, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("GemmaIA - Corretor"),
            centerTitle: true,
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  TextField(
                    controller: _controller,
                    maxLines: 8,
                    decoration: const InputDecoration(
                      hintText: "Cole seu texto aqui...",
                      border: OutlineInputBorder(),
                      alignLabelWithHint: true,
                    ),
                  ),
                  const SizedBox(height: 20),
                  widget.viewModel.loading
                      ? const CircularProgressIndicator()
                      : ElevatedButton.icon(
                          onPressed: () async {
                            if (_controller.text.isNotEmpty) {
                              await widget.viewModel.corrigir(_controller.text);
                              if (mounted) {
                                Navigator.pushNamed(context, '/result');
                              }
                            }
                          },
                          icon: const Icon(Icons.auto_fix_high),
                          label: const Text("Corrigir Texto"),
                        ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
