import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  String _selectedFilter = 'Type'; // Inițial este selectat "Type"

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Icon(Icons.location_on, color: Colors.black),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Donnerville Drive',
              style: TextStyle(color: Colors.black, fontSize: 14),
            ),
            Text(
              '4 Donnerville Hall, Donnerville Drive, Admatson',
              style: TextStyle(color: Colors.black54, fontSize: 12),
            ),
          ],
        ),
        actions: [
          Stack(
            children: [
              Icon(Icons.notifications, color: Colors.black),
            ],
          ),
          SizedBox(width: 16),
        ],
      ),
      body: SingleChildScrollView(
        
  child: Column(
    children: [
      Padding(
        padding: const EdgeInsets.all(25.0),
        child: TextField(
          decoration: InputDecoration(
            hintText: 'Search',
            prefixIcon: Icon(Icons.search),
            suffixIcon: Icon(Icons.mic),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
      ),

      // Titlul secțiunii
      Padding(
        padding: const EdgeInsets.only(left: 25.0, bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Shop wines by',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ],
        ),
      ),

      // Butoanele de filtrare
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildCustomChip('Type'),
          _buildCustomChip('Style'),
          _buildCustomChip('Countries'),
          _buildCustomChip('Grape'),
        ],
      ),

      // Aici se schimbă conținutul în funcție de filtrul selectat
      _buildFilterContent(),

      // Titlul secțiunii "Wine"
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Wine',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Text(
              'view all',
              style: TextStyle(color: Colors.red, fontSize: 16),
            ),
          ],
        ),
      ),

      // Lista de carduri detaliate de vinuri
      _buildWineCardsList(),
    ],
  ),
),

    );
  }

  // Functie pentru a construi butoanele personalizate
  Widget _buildCustomChip(String label) {
    bool isSelected = _selectedFilter == label;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedFilter = label;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? const Color.fromARGB(125, 244, 200, 213) : Colors.white,
          border: Border.all(
            color: isSelected ? Colors.red : Colors.black,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.red : Colors.black,
          ),
        ),
      ),
    );
  }

  // Construieste lista de continut in functie de filtrul selectat
  Widget _buildFilterContent() {
    if (_selectedFilter == 'Type') {
      return _buildWineTypeContent();
    } else if (_selectedFilter == 'Style') {
      return _buildWineStyleContent();
    } else if (_selectedFilter == 'Countries') {
      return _buildWineCountriesContent();
    } else if (_selectedFilter == 'Grape') {
      return _buildWineGrapeContent();
    } else {
      return Container();
    }
  }

  // Conținut pentru filtrul "Type"
  Widget _buildWineTypeContent() {
    return _buildScrollableWineCards([
      _buildWineCard('assets/red_wine.jpg', 'Red wines', '123'),
      _buildWineCard('assets/white_wine.jpg', 'White wines', '123'),
      _buildWineCard('assets/rose_wine.png', 'Rosé wines', '123'),
    ]);
  }
  Widget _buildStyleCard(String title, String count) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      width: 150,
      height: 150,
      child: Card(
        color: Colors.white,
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              '$count varieties',
              style: TextStyle(color: Colors.black54),
            ),
          ],
        ),
      ),
    );
  }

  // Funcție care creează o listă orizontală de carduri pătrate
  Widget _buildScrollableWineCards(List<Widget> cards) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal, // Scroll pe orizontală
      child: Row(
        children: cards,
      ),
    );
  }

    Widget _buildWineStyleContent() {
    return _buildScrollableWineCards([
      _buildStyleCard('Sparkling wines', '85'),
      _buildStyleCard('Dessert wines', '64'),
      _buildStyleCard('Fortified wines', '23'),
    ]);
  }

  Widget _buildWineGrapeContent() {
    return _buildScrollableWineCards([
      _buildWineCard('assets/cabernet.png', 'Cabernet', '95'),
      _buildWineCard('assets/chardonnay.png', 'Chardonnay', '85'),
      _buildWineCard('assets/pinot_noir.png', 'Pinot Noir', '90'),
    ]);
  }


  // Functie care creează cardurile pentru fiecare tip de vin, cu imaginea deasupra și textul jos
  Widget _buildWineCard(String imagePath, String title, String count) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      width: 150,
      height: 150,
      child: Card(
        color: Colors.white, // Fundal alb
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              height: 80,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(
              '$count varieties',
              style: TextStyle(color: Colors.black54),
            ),
          ],
        ),
      ),
    );
    
  }

   
   Widget _buildWineCountriesContent() {
    return _buildScrollableWineCards([
      _buildWineCard('assets/france.png', 'France', '200'),
      _buildWineCard('assets/italy.png', 'Italy', '150'),
      _buildWineCard('assets/spain.png', 'Spain', '130'),
    ]);
  }

  // Functie care creează lista de carduri detaliate de vinuri
  Widget _buildWineCardsList() {
    return Column(
      children: [
        _buildWineCardDetailed(
          'assets/wine_1.jpg',
          'Ocone Bozzovich Beneventano Bianco IGT',
          'Red wine (Green and Flinty)',
          'From Champagne Blanc, France',
          '₹23,256,596',
          'Available',
          'Critics\' Scores: 94 / 100',
        ),
        _buildWineCardDetailed(
          'assets/wine_2.jpg',
          '2021 Petit Chablis - Passy Le Clou',
          'White wine (Green and Flinty)',
          'From Champagne Blanc, France',
          '₹23,256,596',
          'Available',
          'Critics\' Scores: 94 / 100',
        ),
        _buildWineCardDetailed(
          'assets/wine_3.jpg',
          'Philippe Fontaine Champagne Brut Rosé',
          'Sparkling wine (Green and Flinty)',
          'From Champagne Blanc, France',
          '₹23,256,596',
          'Added',
          'Critics\' Scores: 94 / 100',
        ),
        _buildWineCardDetailed(
          'assets/wine_2.jpg',
          '2021 Cicada\'s Song Rosé',
          'Rose wine (Green and Flinty)',
          'From Champagne Blanc, France',
          '₹23,256,596',
          'Available',
          'Critics\' Scores: 94 / 100',
        ),
      ],
    );
  }

  // // Functie care creează cardurile detaliate pentru vinuri
Widget _buildWineCardDetailed(
  String imagePath,
  String wineTitle,
  String wineType,
  String region,
  String price,
  String availability,
  String criticsScore,
) {
  bool isFavorite = false; // Variabilă pentru starea butonului de favorite

  return StatefulBuilder(
    builder: (context, setState) {
      return Container(
        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 3,
              blurRadius: 5,
            ),
          ],
        ),
        child: Row(
          children: [
            // Imaginea vinului
            Container(
              width: 80,
              height: 150,
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
              ),
            ),

            SizedBox(width: 16),

            // Detalii despre vin
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    wineTitle,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(wineType, style: TextStyle(color: Colors.grey[700])),
                  SizedBox(height: 4),
                  Text(region, style: TextStyle(color: Colors.grey[500])),
                  SizedBox(height: 12),
                  Row(
                    children: [
                      if (availability == 'Available')
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.greenAccent,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            availability,
                            style: TextStyle(color: Colors.green[800]),
                          ),
                        )
                      else if (availability == 'Added')
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.pink[200],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            availability,
                            style: TextStyle(color: Colors.redAccent),
                          ),
                        ),
                      Spacer(),
                      Text(
                        price,
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Text(
                    criticsScore,
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ],
              ),
            ),

            // Buton de favorit
            IconButton(
              icon: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                color: isFavorite ? Colors.red : Colors.black,
              ),
              onPressed: () {
                setState(() {
                  isFavorite = !isFavorite; // Inversează starea butonului
                });
              },
            ),
          ],
        ),
      );
    },
  );
}

}



// import 'package:flutter/material.dart';

// class MainPage extends StatefulWidget {
//   const MainPage({super.key});

//   @override
//   _MainPageState createState() => _MainPageState();
// }

// class _MainPageState extends State<MainPage> {
//   String _selectedFilter = 'Type'; // Inițial este selectat "Type"

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         leading: Icon(Icons.location_on, color: Colors.black),
//         title: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'Donnerville Drive',
//               style: TextStyle(color: Colors.black, fontSize: 14),
//             ),
//             Text(
//               '4 Donnerville Hall, Donnerville Drive, Admatson',
//               style: TextStyle(color: Colors.black54, fontSize: 12),
//             ),
//           ],
//         ),
//         actions: [
//           Stack(
//             children: [
//               Icon(Icons.notifications, color: Colors.black),
//             ],
//           ),
//           SizedBox(width: 16),
//         ],
//       ),
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(25.0),
//             child: TextField(
//               decoration: InputDecoration(
//                 hintText: 'Search',
//                 prefixIcon: Icon(Icons.search),
//                 suffixIcon: Icon(Icons.mic),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(15),
//                 ),
//               ),
//             ),
//           ),

//           // Titlul secțiunii
//           Padding(
//             padding: const EdgeInsets.only(left: 25.0, bottom: 10),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 Text(
//                   'Shop wines by',
//                   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
//                 ),
//               ],
//             ),
//           ),

//           // Butoanele de filtrare
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               _buildCustomChip('Type'),
//               _buildCustomChip('Style'),
//               _buildCustomChip('Countries'),
//               _buildCustomChip('Grape'),
//             ],
//           ),

//           // Cardurile de vinuri imediat sub butoanele de filtrare
//           Padding(
//             padding: const EdgeInsets.only(top: 10.0), // Margine de sus pentru carduri
//             child: _buildFilterContent(), // Acesta este locul unde se afișează cardurile
//           ),
//         ],
//       ),
//     );
//   }

//   // Funcție pentru a construi butoanele personalizate
//   Widget _buildCustomChip(String label) {
//     bool isSelected = _selectedFilter == label;

//     return GestureDetector(
//       onTap: () {
//         setState(() {
//           _selectedFilter = label;
//         });
//       },
//       child: Container(
//         padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//         decoration: BoxDecoration(
//           color: isSelected ? const Color.fromARGB(125, 244, 200, 213) : Colors.white,
//           border: Border.all(
//             color: isSelected ? Colors.red : Colors.black,
//           ),
//           borderRadius: BorderRadius.circular(20),
//         ),
//         child: Text(
//           label,
//           style: TextStyle(
//             color: isSelected ? Colors.red : Colors.black,
//           ),
//         ),
//       ),
//     );
//   }

//   // Conținut în funcție de filtrul selectat
//   Widget _buildFilterContent() {
//     if (_selectedFilter == 'Type') {
//       return _buildWineTypeContent();
//     } else if (_selectedFilter == 'Style') {
//       return _buildWineStyleContent();
//     } else if (_selectedFilter == 'Countries') {
//       return _buildWineCountriesContent();
//     } else if (_selectedFilter == 'Grape') {
//       return _buildWineGrapeContent();
//     } else {
//       return Container();
//     }
//   }

//   // Conținut pentru filtrul "Type"
//   Widget _buildWineTypeContent() {
//     return _buildScrollableWineCards([
//       _buildWineCard('assets/red_wine.jpg', 'Red wines', '123'),
//       _buildWineCard('assets/white_wine.jpg', 'White wines', '123'),
//       _buildWineCard('assets/rose_wine.png', 'Rosé wines', '123'),
//     ]);
//   }

//   // Conținut pentru filtrul "Style" - fără imagini
//   Widget _buildWineStyleContent() {
//     return _buildScrollableWineCards([
//       _buildStyleCard('Sparkling wines', '85'),
//       _buildStyleCard('Dessert wines', '64'),
//       _buildStyleCard('Fortified wines', '23'),
//     ]);
//   }

//   // Conținut pentru filtrul "Countries"
//   Widget _buildWineCountriesContent() {
//     return _buildScrollableWineCards([
//       _buildWineCard('assets/france.png', 'France', '200'),
//       _buildWineCard('assets/italy.png', 'Italy', '150'),
//       _buildWineCard('assets/spain.png', 'Spain', '130'),
//     ]);
//   }

//   // Conținut pentru filtrul "Grape"
//   Widget _buildWineGrapeContent() {
//     return _buildScrollableWineCards([
//       _buildWineCard('assets/cabernet.png', 'Cabernet', '95'),
//       _buildWineCard('assets/chardonnay.png', 'Chardonnay', '85'),
//       _buildWineCard('assets/pinot_noir.png', 'Pinot Noir', '90'),
//     ]);
//   }

//   // Funcție care creează o listă orizontală de carduri
//   Widget _buildScrollableWineCards(List<Widget> cards) {
//     return SingleChildScrollView(
//       scrollDirection: Axis.horizontal,
//       child: Row(
//         children: cards,
//       ),
//     );
//   }

//   // Funcție care creează cardurile pentru fiecare tip de vin, cu imaginea deasupra și textul jos
//   Widget _buildWineCard(String imagePath, String title, String count) {
//     return Container(
//       margin: EdgeInsets.symmetric(horizontal: 8),
//       width: 150,
//       height: 150,
//       child: Card(
//         color: Colors.white,
//         elevation: 2,
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Image.asset(
//               imagePath,
//               height: 80,
//               fit: BoxFit.cover,
//             ),
//             SizedBox(height: 8),
//             Text(
//               title,
//               style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//             ),
//             Text(
//               '$count varieties',
//               style: TextStyle(color: Colors.black54),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   // Funcție care creează carduri doar cu text pentru secțiunea "Style" (fără imagini)
//   Widget _buildStyleCard(String title, String count) {
//     return Container(
//       margin: EdgeInsets.symmetric(horizontal: 8),
//       width: 150,
//       height: 150,
//       child: Card(
//         color: Colors.white,
//         elevation: 2,
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               title,
//               style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 8),
//             Text(
//               '$count varieties',
//               style: TextStyle(color: Colors.black54),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
