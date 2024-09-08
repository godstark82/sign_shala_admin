import 'package:admin_sign_shala/features/courses/presentation/pages/courses.dart';
import 'package:admin_sign_shala/features/home/presentation/bloc/home_bloc.dart';
import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import 'package:admin_sign_shala/features/home/presentation/pages/dashboard.dart';
import 'package:admin_sign_shala/features/home/presentation/widgets/side_menu_indicator.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  SideMenuController sideMenu = SideMenuController();
  PageController pageController = PageController(initialPage: 0);
  int currentPage = 0;

  final List<Widget> screens = [
    DashboardPage(),
    CoursesPage(),
  ];

  @override
  void initState() {
    context.read<HomeBloc>().add(HomeLoadEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          SideMenu(
            controller: sideMenu,
            showToggle: true,
            title: context.width > 750
                ? SizedBox(
                    height: context.height * 0.15,
                    child: Center(
                      child: Text(
                        'Sign Shala',
                        style: TextStyle(
                            fontSize: 42, fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                : SizedBox(),
            style: SideMenuStyle(
              // showHamburger: true,
              showTooltip: true,
              compactSideMenuWidth: 40,
              selectedColor: Colors.transparent,
              unselectedTitleTextStyle: TextStyle(color: Colors.black),
              unselectedIconColor: Colors.black,
            ),
            items: [
              SideMenuItem(builder: (context, displayMode) {
                return CustomSideMenuItem(
                  isSelected: currentPage == 0,
                  iconData: Icons.home_outlined,
                  title: 'Dashboard',
                  onTap: () {
                    pageController.animateToPage(0,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.decelerate);
                    currentPage = 0;
                    setState(() {});
                  },
                );
              }),
              SideMenuItem(
                builder: (context, displayMode) {
                  return CustomSideMenuItem(
                    isSelected: currentPage == 1,
                    iconData: Icons.book_outlined,
                    title: 'Courses',
                    onTap: () {
                      pageController.animateToPage(1,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.decelerate);
                      currentPage = 1;
                      setState(() {});
                    },
                  );
                },
              ),
            ],
          ),
          Expanded(
              child: PageView(
                  physics: NeverScrollableScrollPhysics(),
                  controller: pageController,
                  children: screens))
        ],
      ),
    );
  }
}
