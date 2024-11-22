class Movie {
  int id;
  String title;
  double? voteAverage;
  String posterPath;
  String writer;
  String synopsis; 
  String Penerbit;
  String Tahun;
  String Pinjam;
  String Beli;
  String Stock;

  Movie({
    required this.id,
    required this.title,
    this.voteAverage,
    required this.posterPath,
    required this.writer,  
    required this.synopsis, 
    required this.Penerbit,
    required this.Tahun,
    required this.Pinjam,
    required this.Beli,
    required this.Stock,
  });
}