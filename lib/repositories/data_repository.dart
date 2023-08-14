// ignore_for_file: prefer_final_fields, avoid_print

import 'dart:collection';

import 'package:dailynews/models/category_model.dart';
import 'package:dailynews/models/news_models.dart';
import 'package:dailynews/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class CategoryDataProvider with ChangeNotifier {
  final APIService _apiService = APIService();
  final List<ArticleModel> _articles = [];
  final List<CategoryModel> _categoriesList = [
    CategoryModel(
        imageUrl:
            'https://images.unsplash.com/photo-1522869635100-9f4c5e86aa37?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80',
        categoryName: 'Entertainment'),
    CategoryModel(
        imageUrl:
            "https://images.unsplash.com/39/lIZrwvbeRuuzqOoWJUEn_Photoaday_CSD%20(1%20of%201)-5.jpg?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80",
        categoryName: "Business"),
    CategoryModel(
        imageUrl:
            "https://images.unsplash.com/photo-1495563923587-bdc4282494d0?ixlib=rb-1.2.1&auto=format&fit=crop&w=1500&q=80",
        categoryName: 'Sports'),
    CategoryModel(
        imageUrl:
            'https://images.unsplash.com/photo-1495020689067-958852a7765e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
        categoryName: "General"),
    CategoryModel(
        imageUrl:
            "https://images.unsplash.com/photo-1494390248081-4e521a5940db?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1595&q=80",
        categoryName: "Health"),
    CategoryModel(
        imageUrl:
            "https://images.unsplash.com/photo-1554475901-4538ddfbccc2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1504&q=80",
        categoryName: "Science"),
  ];

  // getter for categories
  UnmodifiableListView<CategoryModel> get categories =>
      UnmodifiableListView(_categoriesList);

  // getter for articles
  List<ArticleModel> get articlesNews => _articles;

  Future<void> getTopHeadlines() async {
    try {
      List<ArticleModel> topArticles = await _apiService.fetchNews();
      _articles.addAll(topArticles);
    } on Response catch (response) {
      print('Error : ${response.statusCode}');
      // rethrow the error on the screen
      rethrow;
    }
  }

  Future<void> initData() async {
    await getTopHeadlines();
  }
}
