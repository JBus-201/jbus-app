import 'package:flutter/material.dart';

class BottomSearchSheet extends StatefulWidget {
  const BottomSearchSheet({super.key});

  @override
  State<BottomSearchSheet> createState() => _BottomSearchSheetState();
}

class _BottomSearchSheetState extends State<BottomSearchSheet>
    with TickerProviderStateMixin {
  ////////////////////////////////////////
  final double min = 0.2;
  final double max = 0.8;

  double _dragSheetPosition = 0.21;

  void _handleDragUpdate(DragUpdateDetails details) {
    setState(() {
      _dragSheetPosition -=
          details.primaryDelta! / MediaQuery.of(context).size.height;
      _dragSheetPosition = _dragSheetPosition.clamp(min, max);
    });
  }

  void _handleDragEnd(DragEndDetails details) {
    setState(() {
      _dragSheetPosition =
          (_dragSheetPosition - max).abs() <= (_dragSheetPosition - min).abs()
              ? max
              : min;
    });
  }

  ////////////////////////////////////////
  final DraggableScrollableController _draggableScrollableController =
      DraggableScrollableController();
  // final TextEditingController _textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Call the API and assign the data to allRoutes when the widget initializes
  }

  List allRoutes = [];
  List sRoutes = [];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onVerticalDragUpdate: _handleDragUpdate,
        onVerticalDragEnd: _handleDragEnd,
        child: DraggableScrollableSheet(
          initialChildSize: _dragSheetPosition,
          minChildSize: min,
          maxChildSize: max,
          builder: (BuildContext context, ScrollController scrollController) {
            return Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(0), topRight: Radius.circular(0)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 4,
                    offset: const Offset(4, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 32,
                    height: 4,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: const Color(0xff79747e),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: expand,
                    child: const ListTile(
                      title: TextField(
                        decoration: InputDecoration(
                          hintText: "search",
                          contentPadding: EdgeInsets.all(12.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                          ),
                          prefixIcon: Icon(Icons.search),
                        ),
                        // controller: _textEditingController,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: ListView.builder(
                      controller: scrollController,
                      itemCount: 20,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          title: Text('Item $index'),
                        );
                      },
                    ),
                  )
                ],
              ),
            );
          },
        ));
  }

  void expand() {
    _draggableScrollableController.animateTo(max,
        duration: const Duration(milliseconds: 10), curve: Curves.linear);
  }
}
