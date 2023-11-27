import 'package:flutter/material.dart';

class SlidingContainer extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final Curve curve;
  final Offset beginOffset;
  final Offset endOffset;

  const SlidingContainer({
    Key? key,
    required this.child,
    this.duration = const Duration(seconds: 1),
    this.curve = Curves.easeInOut,
    this.beginOffset = const Offset(0.0, 1.0),
    this.endOffset = Offset.zero,
  }) : super(key: key);

  @override
  _SlidingContainerState createState() => _SlidingContainerState();
}

class _SlidingContainerState extends State<SlidingContainer>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();

    // Set up animation controller
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    // Set up animation
    _offsetAnimation = Tween<Offset>(
      begin: widget.beginOffset,
      end: widget.endOffset,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: widget.curve,
      ),
    );

    // Start the animation when the widget is created
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _offsetAnimation,
      child: widget.child,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Dynamic Sliding Container Page'),
        ),
        body: Center(
          child: SlidingContainer(
            duration: Duration(seconds: 2),
            beginOffset: Offset(0.0, 1.0),
            endOffset: Offset.zero,
            child: Container(
              width: 200.0,
              height: 200.0,
              color: Colors.blue,
              child: Center(
                child: Text(
                  'Dynamic Sliding Container',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
