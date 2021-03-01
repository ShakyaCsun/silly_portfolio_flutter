import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:silly_portfolio/utils/custom_curve.dart';

/// A draggable widget that moves back to [alignment] when it's
/// released.
/// [Cookbook](https://flutter.dev/docs/cookbook/animation/physics-simulation)
class DraggableCard extends StatefulWidget {
  const DraggableCard({
    Key? key,
    required this.child,
    this.onDragEnd,
    this.duration = const Duration(milliseconds: 500),
    this.alignment = Alignment.topCenter,
  }) : super(key: key);
  final Widget child;

  /// Custom Optional callback for when the user stops dragging the Widget
  final VoidCallback? onDragEnd;
  final Alignment alignment;
  final Duration duration;

  @override
  _DraggableCardState createState() => _DraggableCardState();
}

class _DraggableCardState extends State<DraggableCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  /// The alignment of the card as it is dragged or being animated.
  ///
  /// While the card is being dragged, this value is set to the values computed
  /// in the GestureDetector onPanUpdate callback. If the animation is running,
  /// this value is set to the value of the [_animation].
  late Alignment _dragAlignment;

  Animation<Alignment>? _animation;

  /// Calculates and runs a [SpringSimulation].
  void _runAnimation(Alignment currentAlignment) {
    _controller.reset();
    _animation = _controller.drive(
      AlignmentTween(
        begin: currentAlignment,
        end: widget.alignment,
      ).chain(
        CurveTween(curve: const CustomSpringCurve()),
      ),
    );

    _controller.forward();
  }

  @override
  void initState() {
    super.initState();
    _dragAlignment = widget.alignment;
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    );

    _controller.addListener(() {
      final newAlignment = _animation?.value;
      if (newAlignment != null) {
        setState(() {
          _dragAlignment = newAlignment;
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return GestureDetector(
          onPanDown: (_) {
            _controller.stop();
          },
          onPanUpdate: (details) {
            setState(() {
              _dragAlignment += Alignment(
                details.delta.dx / (constraints.maxWidth / 2),
                details.delta.dy / (constraints.maxHeight / 2),
              );
              if (_dragAlignment.y < -1.0) {
                _dragAlignment = Alignment(_dragAlignment.x, -1.0);
              }
            });
          },
          onPanEnd: (_) {
            widget.onDragEnd?.call();
            _runAnimation(_dragAlignment);
          },
          child: Align(
            alignment: _dragAlignment,
            child: widget.child,
          ),
        );
      },
    );
  }
}
