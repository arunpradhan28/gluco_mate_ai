import 'package:flutter/material.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  late PageController pageController;
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final pages = [
      _IntroPage(
        title: "Welcome to GlucoMate AI",
        subtitle: "Your AI-powered diabetes companion.",
        image: "assets/images/intro1.png",
      ),
      _IntroPage(
        title: "Smart Tracking. Smarter Advice.",
        subtitle: "Get personalized AI suggestions based on sugar logs.",
        image: "assets/images/intro2.png",
      ),
      _IntroPage(
        title: "Your journey to better health starts here!",
        subtitle: "",
        image: "assets/images/intro1.png",
        showButton: true,
        onButtonPressed: () {
          Navigator.of(context).pushReplacementNamed('/home');
        },
      ),
    ];

    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: pageController,
            onPageChanged: (index) {
              setState(() => currentPage = index);
            },
            children: pages,
          ),
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(pages.length, (index) {
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 6),
                  height: 8,
                  width: currentPage == index ? 24 : 8,
                  decoration: BoxDecoration(
                    color: currentPage == index
                        ? Theme.of(context).primaryColor
                        : Colors.grey,
                    borderRadius: BorderRadius.circular(12),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}

class _IntroPage extends StatelessWidget {
  final String title;
  final String subtitle;
  final String image;
  final bool showButton;
  final VoidCallback? onButtonPressed;

  const _IntroPage({
    required this.title,
    required this.subtitle,
    required this.image,
    this.showButton = false,
    this.onButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(image, height: 250),
          const SizedBox(height: 48),
          Text(
            title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 16),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 40),
          if (showButton)
            ElevatedButton(
              onPressed: onButtonPressed,
              child: const Text("Get Started"),
            ),
        ],
      ),
    );
  }
}
