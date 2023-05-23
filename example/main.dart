import 'package:animated_content/animated_content.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const AnimatedContentExample());
}

class AnimatedContentExample extends StatelessWidget {
  const AnimatedContentExample({super.key});

  @override
  Widget build(BuildContext context) {
    String loremText =
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("AnimatedContentExample")),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const AnimatedContent(
                animation: AnimatedContentAnimation.fadeDownToUp,
                child: Text(
                  "Lorem ipsum dolor",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 10),
              AnimatedContent(
                animation: AnimatedContentAnimation.fadeDownToUp,
                duration: const Duration(
                  milliseconds: 1000,
                ),
                child: Text(loremText, style: const TextStyle(fontSize: 16)),
              ),
              const SizedBox(height: 10),
              AnimatedContent(
                animation: AnimatedContentAnimation.fadeDownToUp,
                duration: const Duration(
                  milliseconds: 1500,
                ),
                child: Text(loremText, style: const TextStyle(fontSize: 16)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
