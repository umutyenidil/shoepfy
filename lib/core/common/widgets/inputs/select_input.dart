import 'package:flutter/material.dart';
import '../../../extensions/widget_ext.dart';
import '../../../resources/color_res.dart';

class SelectInput extends StatefulWidget {
  final TextEditingController? controller;
  final List<String> items;
  final String? hint;
  final bool isRequired;
  final Function(String? value)? validator;
  final Color? backgroundColor;

  const SelectInput({
    super.key,
    this.controller,
    this.hint,
    this.isRequired = true,
    this.validator,
    this.backgroundColor,
    required this.items,
  });

  @override
  State<SelectInput> createState() => _SelectInputState();
}

class _SelectInputState extends State<SelectInput> {
  final TextEditingController _inputController = TextEditingController();
  late List<String> _filteredItems;
  final GlobalKey _key = GlobalKey();
  final FocusNode _node = FocusNode();
  Size? _renderSize;
  final OverlayPortalController _overlayPortalController = OverlayPortalController();
  final LayerLink _link = LayerLink();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _renderSize = getRenderSize(_key.currentContext!);
      });
    });
    _filteredItems = widget.items;

    if (widget.controller != null) {
      _inputController.text = widget.controller!.text;
    }

    super.initState();

    _node.addListener(() {
      if (!_node.hasFocus) {
        _overlayPortalController.hide();
      }
    });

    _inputController.addListener(() {
      final input = _inputController.text.trim().toLowerCase();

      if (_filteredItems.contains(input)) {
        setState(() {
          _filteredItems = widget.items;
        });

        return;
      }

      setState(() {
        _filteredItems = widget.items.where((item) {
          if (item.toLowerCase().contains(input)) {
            return true;
          }
          return false;
        }).toList();
      });
      if (widget.controller != null) {
        if (_filteredItems.contains(input)) {
          widget.controller!.text = input;
        } else {
          widget.controller!.clear();
        }
      }
    });
  }

  @override
  void dispose() {
    _inputController.dispose();

    super.dispose();
  }

  Size getRenderSize(BuildContext context) {
    final box = context.findRenderObject() as RenderBox;
    return box.size;
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _link,
      child: OverlayPortal(
        controller: _overlayPortalController,
        overlayChildBuilder: (context) {
          return CompositedTransformFollower(
            link: _link,
            targetAnchor: Alignment.bottomLeft,
            child: Align(
              alignment: AlignmentDirectional.topStart,
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minWidth: _renderSize?.width ?? 0,
                  maxWidth: _renderSize?.width ?? 0,
                  maxHeight: 160,
                ),
                child: DecoratedBox(
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                      side: BorderSide(
                        width: 2.0,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      right: 2,
                      top: 1,
                      bottom: 1,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16.0),
                      child: _filteredItems.isEmpty
                          ? const Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Text("No items"),
                            )
                          : RawScrollbar(
                              thumbColor: Colors.red,
                              child: ListView.separated(
                                shrinkWrap: true,
                                physics: const ClampingScrollPhysics(),
                                itemBuilder: (context, index) {
                                  final item = _filteredItems[index];
                                  return ElevatedButton(
                                    onPressed: () {
                                      _inputController.text = item;
                                      if (widget.controller != null) widget.controller!.text = item;
                                      _overlayPortalController.hide();
                                    },
                                    style: ElevatedButton.styleFrom(
                                      shape: const ContinuousRectangleBorder(),
                                      overlayColor: ColorRes.SLATE900,
                                      shadowColor: Colors.transparent,
                                      backgroundColor: Colors.transparent,
                                      minimumSize: const Size(double.infinity, 0),
                                      padding: const EdgeInsets.all(16.0),
                                      elevation: 0,
                                    ),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        item,
                                      ),
                                    ),
                                  );
                                },
                                separatorBuilder: (context, index) {
                                  return const SizedBox(
                                    height: 1,
                                    child: DecoratedBox(
                                      decoration: ShapeDecoration(
                                        color: Colors.black12,
                                        shape: ContinuousRectangleBorder(),
                                      ),
                                    ),
                                  );
                                },
                                itemCount: _filteredItems.length,
                              ),
                            ),
                    ),
                  ),
                ),
              ).padding(top: 2.0),
            ),
          );
        },
        child: TextFormField(
          focusNode: _node,
          key: _key,
          onTap: () {
            _overlayPortalController.show();
          },
          controller: _inputController,
          validator: (value) {
            if (widget.isRequired) {
              if (value == null || value.isEmpty) {
                return 'This field cannot be empty';
              } else if (widget.controller != null) {
                if (widget.controller!.text.isEmpty) {
                  return 'This field cannot be empty';
                }
              }
            }

            return widget.validator?.call(value);
          },
          maxLines: 1,
          decoration: InputDecoration(
            filled: widget.backgroundColor != null,
            fillColor: widget.backgroundColor,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            hintText: widget.hint,
          ),
        ),
      ),
    );
  }
}
