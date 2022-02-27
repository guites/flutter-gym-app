import 'package:flutter/material.dart';

class FadingScroller extends StatefulWidget {
  final ScrollController? scrollController;

  final Widget Function(BuildContext context, ScrollController scrollController)
      builder;

  const FadingScroller({Key? key, required this.builder, this.scrollController})
      : super(key: key);

  @override
  _FadingScrollerState createState() => _FadingScrollerState();
}

class _FadingScrollerState extends State<FadingScroller> {
  late final ScrollController _scrollController;

  bool _overlayIsVisible = true;

  @override
  void initState() {
    super.initState();
    _scrollController = widget.scrollController ?? ScrollController();
    _scrollController.addListener(_handleScrollUpdate);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _handleScrollUpdate() {
    if (_scrollController.position.extentAfter <= 0) {
      setState(() {
        _overlayIsVisible = false;
      });
    } else {
      setState(() {
        _overlayIsVisible = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget.builder(context, _scrollController),
        IgnorePointer(
          child: AnimatedOpacity(
              opacity: _overlayIsVisible ? 1 : 0,
              duration: const Duration(milliseconds: 300),
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0x0fffffff), Color(0xFFFFFFFF)],
                    stops: [0.8, 1],
                  ),
                ),
              )),
        )
      ],
    );
  }
}
