import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(onPressed: (){
          Navigator.pop(context);
        }, child: Text("Kembali"),),
        ElevatedButton(onPressed: (){
          Navigator.pushReplacementNamed(context, '/profile');
        }, child: Text("Profile"),),
        ElevatedButton(onPressed: (){
          Navigator.pushNamed(context, '/transaksi',arguments: [{
            "id":1,
            "nama_produk":"Meja",
            "Harga":10000,
        },
        {
          "id":2,
          "nama_produk":"Lemari",
          "Harga":5000,
        }]);
        }, child: Text("Tranksaksi"),),
      ],
    );
      Navigator.pop(context);
    }
  }