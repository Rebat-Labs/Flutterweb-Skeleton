import 'package:base/src/components/snippets.dart';
import 'package:base/src/res/any_utility.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';
import '../../../components/nav_bubble.dart';
import '../../../models/bar_item.dart';

class EcosystemHandler extends StatefulWidget {
  final Color background;
  // most likely pass the client ID too for the admin page

  const EcosystemHandler(this.background, {Key? key}) : super(key: key);

  @override
  State<EcosystemHandler> createState() => _EcosystemHandlerState();
}

class _EcosystemHandlerState extends State<EcosystemHandler> {
  // getter that computes the current index from the current location,
  // using the helper method below
  int get index => _locationToTabIndex(GoRouter.of(context).location);

  List<BottomNavBarItem> tabs = [];


  int _locationToTabIndex(String location) {
    final index =
    tabs.indexWhere((t) => location.startsWith(t.initialLocation));
    // if index not found (-1), return 0
    return index < 0 ? 0 : index;
  }

  // callback used to navigate to the desired tab
  void _onItemTapped(BuildContext context, int tabIndex) {
    if (tabIndex != index) {
      // go to the initial location of the selected tab (by index)
      context.go(tabs[tabIndex].initialLocation);
      setState(() {});
    }
  }

  @override
  void initState() {
    tabs = items(
        widget.background, inactiveColor: darken(Colors.white, 10)
    );
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    //final int index = ref.watch(homeNavigatorIndex);
    return Container(
      width: 8.w,
      height: 100.h,
      padding: EdgeInsets.only(top: 1.2.h, bottom: 1.2.h),
      decoration: BoxDecoration(
          color: widget.background
        //color: Theme.of(context).bottomAppBarColor
      ),
      child: Stack(
        //fit: StackFit.expand,
        children: [
          // leading icon
          // for brand logo and client logo mix
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              width: 6.w,
              padding: const EdgeInsets.only(left: 16, right: 16,),
              constraints: BoxConstraints(
                maxHeight: 16.h,
              ),
              child: SvgContainer(
                asset: 'assets/icons/buka.svg',
                height: 2.6.h, // todo edit this to be responsive to mobile view.,
                color: Colors.white,
              ),
            ),
          ),

          // todo fix this after you fork the repo for buka.direct
          // core tab items [views]
          Positioned(
            //alignment: Alignment.topCenter,
            top: 14.h,
            child: Padding(
              padding: const EdgeInsets.only(left: 16, right: 16,),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  for(int i = 0; i < tabs.length; i++)
                    Flexible(
                      flex: 4,
                      child: Padding(
                        padding: EdgeInsets.only(top: 2.2.h),
                        child: NavBubbleHandler(
                          onSelected: tabs[i].onPressed != null ? tabs[i].onPressed! :
                              () => _onItemTapped(context, i),
                          item: tabs[i],
                          bgk: index == tabs[i].index ? Colors.white :widget.background,
                          active: index == tabs[i].index,
                        ),
                      ),
                    )
                ],
              ),
            ),
          )


          // utility items [sign-out, help, settings, account]
        ],
      ),
    );
  }
}

List<BottomNavBarItem> items(Color background,
    {Color inactiveColor = Colors.grey}){
  return [
    BottomNavBarItem(
      0,
      initialLocation: '/a',
      activeColor: background,
      inactiveColor: inactiveColor,
      title: 'Schedule',
      svgFile: 'assets/icons/calendar.svg',
    ),
    BottomNavBarItem(
      1,
      initialLocation: '/b',
      activeColor: background,
      inactiveColor: inactiveColor,
      title: 'Content',
      svgFile: 'assets/icons/content.svg',
    ),
  ];
}
