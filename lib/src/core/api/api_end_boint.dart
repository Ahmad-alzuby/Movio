abstract class ApiEndBoint {
  static String baseUrl = 'https://api.themoviedb.org/3/';

  static String keyApi = '86adb317601a330d430adead4e089dbf';
  static int pages = 10;
  static int idMovie = 0;
 static String genres = "https://api.themoviedb.org/3/genre/movie/list?api_key=$keyApi";
  static String similarEndBoiunt({required int page, required String id}) {
    return "https://api.themoviedb.org/3/movie/$id/similar?api_key=$keyApi&language=en-US&page=$page";
  }

  static String moreMoviesEndBouint({required int page, required String id}) {
    return "https://api.themoviedb.org/3/movie/$id/similar?api_key=$keyApi&language=en-US&page=$page";
  }
  
  static String topArtists({required int page, }) {
    return "https://api.themoviedb.org/3/search/person?query=top&api_key=$keyApi&include_adult=false&language=en-US=10&page=$page";
  } static String genreMovies({required int id, }) {
    return "https://api.themoviedb.org/3/discover/movie?api_key=$keyApi&with_genres=$id";
  }

  static String trendEndBoint =
      'https://api.themoviedb.org/3/trending/movie/day?api_key=$keyApi&page=$pages';
  static String searchEndBoint =
      'https://api.themoviedb.org/3/trending/movie/day?api_key=$keyApi&page=';

  static String topRated =
      'https://api.themoviedb.org/3/movie/top_rated?api_key=$keyApi&page=$pages';
  
}