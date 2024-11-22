import 'package:flutter/material.dart';
import 'package:navigasi_flutter/controllers/movie_controller.dart';
import 'package:navigasi_flutter/models/movie.dart';
import 'package:navigasi_flutter/widget/bottom_nav.dart';
import 'package:navigasi_flutter/widget/modal.dart';

class MovieView extends StatefulWidget {
  MovieView({super.key});

  @override
  State<MovieView> createState() => _MovieViewState();
}

class _MovieViewState extends State<MovieView> {
  MovieController movieController = MovieController();
  TextEditingController titleInput = TextEditingController();
  TextEditingController gambarInput = TextEditingController();
  TextEditingController voteAverage = TextEditingController();
  TextEditingController writerInput = TextEditingController();
  TextEditingController sinopsisInput = TextEditingController(); 
  TextEditingController penerbitInput = TextEditingController();
  TextEditingController tahunInput = TextEditingController();
  TextEditingController StockInput = TextEditingController();
  TextEditingController pinjamInput = TextEditingController();
  TextEditingController beliInput = TextEditingController();
  TextEditingController searchController = TextEditingController(); 
  final formKey = GlobalKey<FormState>();
  ModalWidget modal = ModalWidget();

  List<String> listAct = ["Ubah", "Hapus"];
  List<Movie>? film;
  List<Movie>? filteredFilm; 

  @override
  void initState() {
    super.initState();
    getFilm();
    searchController.addListener(() {
      filterSearchResults(searchController.text);
    });
  }

  getFilm() {
    setState(() {
      film = movieController.movies;
      filteredFilm = film; 
    });
  }

  void filterSearchResults(String query) {
    List<Movie>? dummySearchList = film;
    if (query.isNotEmpty) {
      List<Movie> dummyListData = dummySearchList!.where((item) {
        return item.title.toLowerCase().contains(query.toLowerCase());
      }).toList();
      setState(() {
        filteredFilm = dummyListData;
      });
    } else {
      setState(() {
        filteredFilm = film;
      });
    }
  }

  addFilm(Movie data) {
    setState(() {
      film!.add(data);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Perpus"),
        backgroundColor: const Color.fromARGB(255, 161, 112, 73),
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                titleInput.clear();
                gambarInput.clear();
                voteAverage.clear();
                writerInput.clear();
                sinopsisInput.clear(); 
                penerbitInput.clear();
                tahunInput.clear();
                StockInput.clear();
                pinjamInput.clear();
                beliInput.clear();
              });
              modal.showFullModal(context, fromTambah(null));
            },
            icon: Icon(Icons.add_sharp, size: 40),
          )
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(60.0), 
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: 'Cari Buku/Novel...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
        ),
      ),
      body: filteredFilm != null && filteredFilm!.isNotEmpty
          ? ListView.builder(
              padding: EdgeInsets.all(12),
              itemCount: filteredFilm!.length,
              itemBuilder: (context, index) {
                int? vote = int.parse(filteredFilm![index].voteAverage.toString());
                return Card(
                  child: ListTile(
                    leading: Image(
                      image: AssetImage(filteredFilm![index].posterPath),
                    ),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(filteredFilm![index].title),
                        Row(
                          children: [
                            if (filteredFilm![index].voteAverage != null)
                              for (var i = 0; i < vote; i++) Icon(Icons.star_border, color: Colors.yellow[600]),
                          ],
                        )
                      ],
                    ),
                    trailing: PopupMenuButton<String>(
                      icon: const Icon(
                        Icons.more_vert,
                        color: Color.fromARGB(255, 0, 0, 0),
                        size: 30.0,
                      ),
                      itemBuilder: (BuildContext context) {
                        return listAct.map((String choice) {
                          return PopupMenuItem<String>(
                            value: choice,
                            child: Text(choice),
                            onTap: () {
                              if (choice == "Ubah") {
                                setState(() {
                                  titleInput.text = filteredFilm![index].title;
                                  gambarInput.text = filteredFilm![index].posterPath;
                                  voteAverage.text = filteredFilm![index]
                                      .voteAverage
                                      .toString();
                                  writerInput.text = filteredFilm![index].writer;
                                  sinopsisInput.text = filteredFilm![index].synopsis;
                                  penerbitInput.text = filteredFilm![index].Penerbit;
                                  tahunInput.text = filteredFilm![index].Tahun;
                                  StockInput.text = filteredFilm![index].Stock;
                                  pinjamInput.text = filteredFilm![index].Pinjam;
                                  beliInput.text = filteredFilm![index].Beli;
                                  modal.showFullModal(context, fromTambah(index));
                                });
                              } else if (choice == "Hapus") {
                                setState(() {
                                  filteredFilm!.removeAt(index);
                                });
                              }
                            },
                          );
                        }).toList();
                      },
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              MovieDetailView(movie: filteredFilm![index]),
                        ),
                      );
                    },
                  ),
                );
              })
          : Center(child: Text("Not Found")),
      bottomNavigationBar: BottomNav(2),
    );
  }

  Widget fromTambah(index) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          Text("Tambah Data"),
          TextFormField(
            controller: titleInput,
            decoration: InputDecoration(label: Text("Title")),
            validator: (value) {
              if (value!.isEmpty) {
                return 'harus diisi';
              } else {
                return null;
              }
            },
          ),
          TextFormField(
            controller: gambarInput,
            decoration: InputDecoration(label: Text("Gambar")),
            validator: (value) {
              if (value!.isEmpty) {
                return 'harus diisi';
              } else {
                return null;
              }
            },
          ),
          TextFormField(
            controller: voteAverage,
            decoration: InputDecoration(label: Text("Vote Average")),
            validator: (value) {
              if (value!.isEmpty) {
                return 'harus diisi';
              } else {
                return null;
              }
            },
          ),
          TextFormField(
            controller: writerInput,
            decoration: InputDecoration(label: Text("Writer")),
            validator: (value) {
              if (value!.isEmpty) {
                return 'harus diisi';
              } else {
                return null;
              }
            },
          ),
          TextFormField(
            controller: sinopsisInput,
            decoration: InputDecoration(label: Text("Sinopsis")),
            validator: (value) {
              if (value!.isEmpty) {
                return 'harus diisi';
              } else {
                return null;
              }
            },
          ),
          TextFormField(
            controller: penerbitInput,
            decoration: InputDecoration(label: Text("Penerbit")),
            validator: (value) {
              if (value!.isEmpty) {
                return 'harus diisi';
              } else {
                return null;
              }
            },
          ),
          TextFormField(
            controller: tahunInput,
            decoration: InputDecoration(label: Text("Tahun Terbit")),
            validator: (value) {
              if (value!.isEmpty) {
                return 'harus diisi';
              } else {
                return null;
              }
            },
          ),
           TextFormField(
            controller: StockInput,
            decoration: InputDecoration(label: Text("Stock")),
            validator: (value) {
              if (value!.isEmpty) {
                return 'harus diisi';
              } else {
                return null;
              }
            },
          ),
          TextFormField(
            controller: pinjamInput,
            decoration: InputDecoration(label: Text("Pinjam")),
          ),
          TextFormField(
            controller: beliInput,
            decoration: InputDecoration(label: Text("Beli")),
          ),
          ElevatedButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                if (index != null) {
                  setState(() {
                    filteredFilm![index].title = titleInput.text;
                    filteredFilm![index].posterPath = gambarInput.text;
                    filteredFilm![index].voteAverage =
                        double.parse(voteAverage.text);
                    filteredFilm![index].writer = writerInput.text;
                    filteredFilm![index].synopsis = sinopsisInput.text;
                    filteredFilm![index].Penerbit = penerbitInput.text;
                    filteredFilm![index].Tahun = tahunInput.text;
                     filteredFilm![index].Stock = StockInput.text;
                    filteredFilm![index].Pinjam = pinjamInput.text;
                    filteredFilm![index].Beli = beliInput.text;
                  });
                } else {
                  Movie newMovie = Movie(
                    id: filteredFilm!.length + 1,
                    title: titleInput.text,
                    posterPath: gambarInput.text,
                    voteAverage: double.parse(voteAverage.text),
                    writer: writerInput.text,
                    synopsis: sinopsisInput.text,
                    Penerbit: penerbitInput.text,
                    Tahun: tahunInput.text,
                    Stock: StockInput.text,
                    Pinjam: pinjamInput.text,
                    Beli: beliInput.text, 
                  );
                  addFilm(newMovie);
                }
                Navigator.pop(context);
              }
            },
            child: Text("Simpan"),
          ),
        ],
      ),
    );
  }
}

class MovieDetailView extends StatelessWidget {
  final Movie movie;

  MovieDetailView({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(movie.posterPath), 
            SizedBox(height: 10),
            Card(
              child: ListTile(
                title: Text('Judul: ${movie.title}'),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Penulis: ${movie.writer}'),
                    Text('Penerbit: ${movie.Penerbit}'),
                    Text('Tahun Terbit: ${movie.Tahun}'),
                     Text('Stock: ${movie.Stock}'),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Sinopsis: ${movie.synopsis}', 
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                  child: Text('Pinjam : ${movie.Pinjam}', style: TextStyle(color: Colors.black),),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Logika untuk beli
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                  child: Text('Beli : ${movie.Beli}', style: TextStyle(color: Colors.black),),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}