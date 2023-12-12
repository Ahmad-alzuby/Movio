  class GenreModel {
  int id ;
  String genreName;
  GenreModel({required this.genreName , required this.id});
 factory GenreModel.fromJson(Map <String , dynamic> genre){
    return  GenreModel(genreName: genre['name'] , id: genre['id']);
  }
}