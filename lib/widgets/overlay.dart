import 'package:delilahbrao/homepage.dart';
import 'package:flutter/material.dart';

class OverlayWidget extends StatefulWidget {
  const OverlayWidget(
      {Key? key,
      required this.parentWidget,
      required this.horizontalOffset,
      required this.verticalOffset,
      required this.mediaQuery})
      : super(key: key);
  final GlobalKey<HomePageState> parentWidget;
  final double horizontalOffset;
  final double verticalOffset;
  final MediaQueryData mediaQuery;

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
            // TODO: my guess is that this would be the child
            Positioned(
              left: parentPosition.dx +
                  parentSize.width -
                  clickableArea -
                  widget.horizontalOffset,
              top: parentPosition.dy +
                  parentSize.height -
                  clickableArea -
                  widget.verticalOffset,
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    // widget.parentWidget.currentState!.incrementCounter();
                  },
                  child: Container(
                    color: Colors.blue.withAlpha(200),
                    width: clickableArea,
                    height: clickableArea,
                    child: Text(
                      'InkWell (Overlay)',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
