import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tasks/domain/model/to_do_model.dart';
import 'package:tasks/presentation/home/home_page.dart';
import 'package:tasks/presentation/detail/detail_page.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(title: '태윤`s Tasks'),

      routes: [
        GoRoute(
          path: 'detail', 
          builder: (context, state) {
            final toDo = state.extra as ToDoModel;
            return ToDoDetailPage(toDo: toDo, onToggleFavorite: () {});
          },
        ),
      ],
    ),
  ],
  errorBuilder: (context, state) =>
      Scaffold(body: Center(child: Text('페이지를 찾을 수 없습니다.'))),
);
