// memasukan paket paket ke main.dart
import 'package:english_words/english_words.dart'; // paket bahasa inggris
import 'package:flutter/material.dart'; // paket tampilan ui
import 'package:provider/provider.dart'; // paket interaksi

void main() {
  runApp(
    MyApp(

    )
  );
}

// membuat class abstract dari class StatelessWidget untuk tujuan aplikasi
class MyApp extends StatelessWidget {
  // unnable change value from variable
  const MyApp({super.key});

  @override // mulai ganti kolom kode yang lama yang sudah ada di original ckass dengan kode yang baru
  Widget build(BuildContext context) {
    // mengatur ui, posisi widget

    // change notifier profider untuk mendeteksi interaksi di apliksi
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp( // menggunakan class MaterialApp()
        title: 'Namer App', // informasi judul aplikasi
        theme: ThemeData( // informasi tema
          useMaterial3: true, // menggunakan useMaterial3
          colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 255, 0, 0)), // menggunakan warnaschema oren
        ),
        home: MyHomePage(), // list widget
      ),
    );
  }
}


class MyAppState extends ChangeNotifier {
  // mengisi variable current dengan 2 nilai random 
  var current = WordPair.random();
  void getNext() {
    current = WordPair.random();
    notifyListeners();
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>(); /// menggunakan state myappstate
    // di bawah ini adalah kode program untuk menyusun layout
    var pair = appState.current; // menyimpan kata yang sedang aktif

    return Scaffold( // base layout
      body: Column(
        children: [
          Text('hello test:'),
          BigCards(pair: pair),
          ElevatedButton( // create button
            onPressed: () { // bila di tekan tombolnya maka akan exekusi function shadow dengan value print hello world
              appState.getNext();
            },
            child: Text("klik"), // ini adalah teks dari button
          )
        ],
      ),
    );
  }
}

class BigCards extends StatelessWidget {
  const BigCards({
    super.key,
    required this.pair,
  });

  final WordPair pair;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = theme.textTheme.displayMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
    );
    return Card(
      color: theme.colorScheme.primary,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Text(pair.asLowerCase, style: style),
      ),
    );
  }
}
