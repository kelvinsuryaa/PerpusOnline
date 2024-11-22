import 'package:navigasi_flutter/models/movie.dart';

class MovieController {
  final List<Movie> movies = [
    Movie(
      id: 1,
      title: "Bulan",
      voteAverage: 7,
      posterPath: 'assets/Novel_Bulan.jpg',
      writer: 'Tere Liye', 
      synopsis: 'Novel Bulan menceritakan tentang kehidupan sehari-hari seorang anak perempuan bernama Seli yang berusia 15 tahun. Novel ini juga merupakan bagian dari serial Bumi karya Tere Liye yang menceritakan petualangan Raib, Ali, dan Seli ke dunia paralel.', 
      Penerbit: 'Gramedia Pustaka Utama', 
      Tahun: '2015', 
      Pinjam: 'Rp50.000',
      Beli: 'Rp100.000', 
      Stock: '10', 
    ),
    Movie(
      id: 2,
      title: "Bumi",
      voteAverage: 7,
      posterPath: 'assets/Novel_Bumi.jpeg',
      writer: 'Tere Liye', 
      synopsis: 'Novel Bumi bercerita tentang petualangan tiga remaja, yaitu Raib, Seli, dan Ali, yang berasal dari klan berbeda. Ketiganya memiliki kemampuan khusus dan ditakdirkan untuk menyelamatkan Bumi dari ancaman klan-klan jahat pimpinan Tamus.', 
      Penerbit: 'Gramedia Pustaka Utama', 
      Tahun: '2014', 
      Pinjam: 'Rp50.000',
      Beli: 'Rp100.000', 
      Stock: '10', 
    ),
    Movie(
      id: 3,
      title: "Matahari",
      voteAverage: 7,
      posterPath: 'assets/Novel_Matahari.jpeg',
      writer: 'Tere Liye', 
      synopsis: 'Novel Matahari menceritakan tentang petualangan Raib, Ali, dan Seli di dunia Klan Matahari. Mereka bertiga bertemu dengan tokoh baru yang mengantarkan pada misi menyenangkan sekaligus berbahaya', 
      Penerbit: 'Gramedia Pustaka Utama', 
      Tahun: '2018', 
      Pinjam: 'Rp50.000',
      Beli: 'Rp100.000', 
      Stock: '10', 
    )
  ];
}