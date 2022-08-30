import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:super_toys/widgets/secondary_button.dart';

class DropdownItem {
  dynamic value;
  Widget child;
  DropdownItem({required this.value, required this.child});
}

class Dropdown extends StatefulWidget {
  final dynamic value;
  final List<DropdownItem> items;
  final Function(dynamic)? onChanged;
  const Dropdown({super.key, required this.items, this.value, this.onChanged});

  @override
  State<Dropdown> createState() => _DropdownState();
}

class _DropdownState extends State<Dropdown> {
  final controller = ScrollController();
  late OverlayEntry sticky;
  GlobalKey stickyKey = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    closeDropdown();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final selected = widget.items.firstWhere(
        (item) => item.value == widget.value,
        orElse: () => DropdownItem(child: const SizedBox(), value: null));
    return SizedBox(
      height: 32,
      key: stickyKey,
      child: SecondaryButton(
        onPressed: () {
          openDropdown();
        },
        trailing: const Icon(CupertinoIcons.chevron_down, size: 16),
        child: selected.child,
      ),
    );
  }

  void openDropdown() {
    sticky = OverlayEntry(
      builder: (context) => stickyBuilder(context),
    );
    SchedulerBinding.instance.addPostFrameCallback((_) {
      Overlay.of(context)?.insert(sticky);
    });
  }

  void closeDropdown() {
    sticky.remove();
  }

  void onTapItem(DropdownItem item) {
    widget.onChanged?.call(item.value);
    closeDropdown();
  }

  Widget stickyBuilder(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (_, Widget? child) {
        final keyContext = stickyKey.currentContext;
        if (keyContext != null) {
          final box = keyContext.findRenderObject() as RenderBox;
          final pos = box.localToGlobal(Offset.zero);
          return Stack(
            children: [
              Positioned(child: GestureDetector(
                onTap: () {
                  closeDropdown();
                },
              )),
              Positioned(
                bottom: MediaQuery.of(context).size.height - pos.dy + 8,
                left: pos.dx,
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      borderRadius: BorderRadius.circular(4),
                      boxShadow: [
                        BoxShadow(
                          color: Brightness.dark == Theme.of(context).brightness
                              ? Colors.black.withOpacity(0.2)
                              : Colors.grey.withOpacity(0.2),
                          blurRadius: 8,
                          offset:
                              const Offset(0, 4), // changes position of shadow
                        ),
                      ]),
                  child: Material(
                    color: Colors.transparent,
                    child: Column(
                      children: widget.items
                          .map(
                            (item) => Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 4),
                              child: InkWell(
                                borderRadius: BorderRadius.circular(4),
                                onTap: () => onTapItem(item),
                                hoverColor: Theme.of(context).hoverColor,
                                child: Container(
                                  width: box.size.width,
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 8, horizontal: 12),
                                  child: item.child,
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ),
              )
            ],
          );
        }
        return Container();
      },
    );
  }
}
