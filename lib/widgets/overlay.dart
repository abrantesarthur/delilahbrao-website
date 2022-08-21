import 'package:delilahbrao/homepage.dart';
import 'package:delilahbrao/widgets/nav_bar.dart';
import 'package:flutter/material.dart';

class OverlayWidget extends StatefulWidget {
  const OverlayWidget({
    Key? key,
    required this.child,
    this.horizontalOffset = 0,
    this.verticalOffset = 0,
    required this.onHover,
  }) : super(key: key);
  final double horizontalOffset;
  final double verticalOffset;
  final Widget child;
  final ValueChanged<bool>? onHover;

  @override
  State<OverlayWidget> createState() => _OverlayWidgetState();
}

class _OverlayWidgetState extends State<OverlayWidget> {
  OverlayEntry? overlay;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    removeOverlay();
  }

  @override
  void dispose() {
    super.dispose();
    removeOverlay();
  }

  @override
  Widget build(BuildContext context) {
    Future(addOverlay);
    return Container();
  }

  void addOverlay() {
    removeOverlay();
    RenderBox? renderBox = context.findAncestorRenderObjectOfType<RenderBox>();

    var parentSize = renderBox!.size;
    var parentPosition = renderBox.localToGlobal(Offset.zero);

    overlay = _overlayEntryBuilder(parentPosition, parentSize);
    Overlay.of(context)!.insert(overlay!);
  }

  void removeOverlay() {
    overlay?.remove();
  }

  OverlayEntry _overlayEntryBuilder(Offset parentPosition, Size parentSize) {
    const clickableArea = 100.0;

    return OverlayEntry(
      maintainState: true,
      builder: (context) {
        return Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              left: parentPosition.dx +
                  widget.horizontalOffset +
                  parentSize.width -
                  clickableArea,
              top: parentPosition.dy +
                  widget.verticalOffset +
                  parentSize.height -
                  clickableArea,
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {},
                  onHover: widget.onHover,
                  child: widget.child,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
