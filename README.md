# AnimatedContent

The `AnimatedContent` package provides a widget for animating the content transitions in a Flutter application. It offers various animation types such as slide, fade, and combinations of both. The widget allows you to animate the child widget's entry and exit with customizable duration and animation styles.

## Installation

Add the following line to your `pubspec.yaml` file:

```yaml
dependencies:
  animated_content: ^1.0.0
```

## Buy Me A Coffee ☕️

<a href="https://www.buymeacoffee.com/altaysakarya" target="_blank"><img src="https://cdn.buymeacoffee.com/buttons/default-orange.png" alt="Buy Me A Coffee" height="41" width="174"></a>

### Features

* The widget supports different animation types: `slideLeftToRight`, `slideRightToLeft`, `slideUpToDown`, `slideDownToUp`, `fadeSlideLeftToRight`, `fadeSlideRightToLeft`, `fadeUpToDown`, `fadeDownToUp`.
* Customizable animation duration.
* Supports a single child widget with animated content.
* You can arrange multiple `AnimatedContent` widgets in a sequence.
* Provides flexibility for automatic or button-triggered animations.

### Usage

Import the package:

```dart
import 'package:animated_content/animated_content.dart';
```

Wrap your content widget with the AnimatedContent widget:

```dart
AnimatedContent(
  child: YourContentWidget(),
  duration: Duration(milliseconds: 500),
  animation: AnimatedContentAnimation.slideLeftToRight,
)
```

The available animation options are:

* `slideLeftToRight`
* `slideRightToLeft`
* `slideUpToDown`
* `slideDownToUp`
* `fadeSlideLeftToRight`
* `fadeSlideRightToLeft`
* `fadeUpToDown`
* `fadeDownToUp`

You can customize the animation duration by providing a `Duration` object to the `duration` parameter.


### Example

<img src="https://github.com/altaysakarya/animated_content/blob/main/example_gif.gif?raw=true" height="400" alt="Example GIF">


```dart
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

```