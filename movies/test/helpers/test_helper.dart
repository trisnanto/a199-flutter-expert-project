import 'package:movies/data/datasources/db/movies_database_helper.dart';
import 'package:movies/data/datasources/movie_local_data_source.dart';
import 'package:movies/data/datasources/movie_remote_data_source.dart';
import 'package:movies/domain/repositories/movie_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';

@GenerateMocks([
  MovieRepository,
  MovieRemoteDataSource,
  MovieLocalDataSource,
  MoviesDatabaseHelper,
], customMocks: [
  // MockSpec<http.Client>(as: #MockHttpClient)
  MockSpec<IOClient>(as: #MockHttpClient)
])
void main() {}
