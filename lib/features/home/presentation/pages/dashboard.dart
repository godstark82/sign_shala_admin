// ignore_for_file: prefer_const_constructors

import 'package:admin_sign_shala/core/constants/colors.dart';
import 'package:admin_sign_shala/features/home/presentation/bloc/home_bloc.dart';
import 'package:admin_sign_shala/features/home/presentation/widgets/professors_widget.dart';
import 'package:admin_sign_shala/features/home/presentation/widgets/rank_widget.dart';
import 'package:admin_sign_shala/features/home/presentation/widgets/dash_widget_1.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    // context.read<HomeBloc>().add(HomeLoadEvent());
    //! Dashboard Widgets For Responsive UI
    List<DashBoardWidget1> dashWidgets = [
      DashBoardWidget1(
        heading: 'Total Courses',
        data: 12,
        desc: '80% Increase in 20 Days',
        valueColor: Colors.red,
      ),
      DashBoardWidget1(
        heading: 'Total Students',
        data: 657,
        desc: '55% Increase in 20 Days',
        valueColor: Colors.green,
        value: 0.55,
      ),
    ];

    //! Ranking Widget

    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        leadingWidth: 100,
      ),
      backgroundColor: bgColor,
      body: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {
          if (state is HomeLoadingState) {
            // context.read<HomeBloc>().add(HomeLoadEvent());
          }
          if (state is HomeLoadedState) {
            dashWidgets = [
              DashBoardWidget1(
                heading: 'Total Courses',
                data: state.totalCourses ?? 0,
                desc: '80% Increase in 20 Days',
                valueColor: Colors.red,
              ),
              DashBoardWidget1(
                heading: 'Total Students',
                data: state.totalStudents ?? 0,
                desc: '55% Increase in 20 Days',
                valueColor: Colors.green,
                value: 0.55,
              ),
            ];
          }
        },
        builder: (context, state) {
          if (state is HomeLoadingState) {
            return Center(child: CircularProgressIndicator.adaptive());
          }
          if (state is HomeErrorState) {
            return Center(child: Text(state.error));
          }
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  (context.width > 750)
                      ? Wrap(
                          children: dashWidgets,
                        )
                      : Column(
                          children: dashWidgets,
                        ),
                  Wrap(
                    children: [
                      ProfessorsWidget(),
                      RankWidget(),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
