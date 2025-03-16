import 'package:flutter/material.dart';
import 'package:flutter_shopping_app/features/products/presentation/screens/home_screen/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

/// Splash screen widget with animations
class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller; // Controls the animation
  late Animation<double> _animation; // Represents the animated value

  @override
  void initState() {
    super.initState();
    // Initialize the AnimationController
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    // Define a curved animation for smooth transition
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );

    // Start the animation
    _controller.forward();

    // Navigate to the DashboardScreen after a delay
    Future.delayed(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => HomeScreen()),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose the controller to free resources
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.primaryColor,
      body: Center(
        child: ScaleTransition(
          scale: _animation, // Use the animation for scaling effect
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset("assets/icons/shopping_icon.png"),
              const SizedBox(height: 20),
              Text(
                'Shopping App',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: theme.cardColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
