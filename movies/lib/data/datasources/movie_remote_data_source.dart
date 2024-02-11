import 'dart:convert';
import 'dart:io';

import 'package:movies/data/models/movie_detail_model.dart';
import 'package:movies/data/models/movie_model.dart';
import 'package:movies/data/models/movie_response.dart';
import 'package:movies/utils/exception.dart';
import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';
import 'package:flutter/services.dart';

abstract class MovieRemoteDataSource {
  Future<List<MovieModel>> getNowPlayingMovies();
  Future<List<MovieModel>> getPopularMovies();
  Future<List<MovieModel>> getTopRatedMovies();
  Future<MovieDetailModel> getMovieDetail(int id);
  Future<List<MovieModel>> getMovieRecommendations(int id);
  Future<List<MovieModel>> searchMovies(String query);
}

class MovieRemoteDataSourceImpl implements MovieRemoteDataSource {
  static const API_KEY = 'api_key=2174d146bb9c0eab47529b2e77d6b526';
  static const BASE_URL = 'https://api.themoviedb.org/3';

  // final http.Client client;
  final IOClient client;

  MovieRemoteDataSourceImpl({required this.client});

  // Future<SecurityContext> get globalContext async {
  //   final sslCert = await rootBundle.load('certificates/certificate.pem');
  //   SecurityContext securityContext = SecurityContext(withTrustedRoots: false);
  //   securityContext.setTrustedCertificatesBytes(sslCert.buffer.asInt8List());
  //   return securityContext;
  // }

  @override
  Future<List<MovieModel>> getNowPlayingMovies() async {
    // HttpClient client = HttpClient(context: await globalContext);
    // client.badCertificateCallback =
    //     (X509Certificate cert, String host, int port) => false;
    // IOClient client = IOClient(client);
    final response =
        await client.get(Uri.parse('$BASE_URL/movie/now_playing?$API_KEY'));
    // client.close();

    if (response.statusCode == 200) {
      return MovieResponse.fromJson(json.decode(response.body)).movieList;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<MovieDetailModel> getMovieDetail(int id) async {
    // HttpClient client = HttpClient(context: await globalContext);
    // client.badCertificateCallback =
    //     (X509Certificate cert, String host, int port) => false;
    // IOClient client = IOClient(client);
    final response =
        await client.get(Uri.parse('$BASE_URL/movie/$id?$API_KEY'));
    // client.close();

    if (response.statusCode == 200) {
      return MovieDetailModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<MovieModel>> getMovieRecommendations(int id) async {
    // HttpClient client = HttpClient(context: await globalContext);
    // client.badCertificateCallback =
    //     (X509Certificate cert, String host, int port) => false;
    // IOClient client = IOClient(client);
    final response = await client
        .get(Uri.parse('$BASE_URL/movie/$id/recommendations?$API_KEY'));
    // client.close();

    if (response.statusCode == 200) {
      return MovieResponse.fromJson(json.decode(response.body)).movieList;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    // HttpClient client = HttpClient(context: await globalContext);
    // client.badCertificateCallback =
    //     (X509Certificate cert, String host, int port) => false;
    // IOClient client = IOClient(client);
    final response =
        await client.get(Uri.parse('$BASE_URL/movie/popular?$API_KEY'));
    // client.close();

    if (response.statusCode == 200) {
      return MovieResponse.fromJson(json.decode(response.body)).movieList;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies() async {
    // HttpClient client = HttpClient(context: await globalContext);
    // client.badCertificateCallback =
    //     (X509Certificate cert, String host, int port) => false;
    // IOClient client = IOClient(client);
    final response =
        await client.get(Uri.parse('$BASE_URL/movie/top_rated?$API_KEY'));
    // client.close();

    if (response.statusCode == 200) {
      return MovieResponse.fromJson(json.decode(response.body)).movieList;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<MovieModel>> searchMovies(String query) async {
    // HttpClient client = HttpClient(context: await globalContext);
    // client.badCertificateCallback =
    //     (X509Certificate cert, String host, int port) => false;
    // IOClient client = IOClient(client);
    final response = await client
        .get(Uri.parse('$BASE_URL/search/movie?$API_KEY&query=$query'));
    // client.close();

    if (response.statusCode == 200) {
      return MovieResponse.fromJson(json.decode(response.body)).movieList;
    } else {
      throw ServerException();
    }
  }
}
