import 'package:flutter/material.dart';
import '../widget/bottom_nav.dart';

class TransaksiView extends StatelessWidget {
  const TransaksiView({super.key});

  @override
  Widget build(BuildContext context) {
    final arg = ModalRoute.of(context)!.settings.arguments as List;
    return Scaffold(
      body: Column(
        children: [
      Text("Halaman Transaksi"),
      Text("ID : "+arg[0]["id"].toString()),
      Text("Krisbow : ${arg[0]["nama_produk"]}"),
      Text("Harga : ${arg[0]["Harga"]}"),
        ],
      ),
      bottomNavigationBar: BottomNav(2),
    );
  }
}