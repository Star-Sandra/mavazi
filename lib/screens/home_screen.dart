import 'package:flutter/material.dart';
import 'package:mavazi/models/product.dart';
import 'package:mavazi/screens/product_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  String _tabTitle = "Home";

  final List<Widget> _tabs = [_HomeTab(), _OrdersTab(), _ShoppingCartTab(), _ProfileTab()];
  final List<String> _titles = ['Home', 'Orders', 'Cart','Profile'];

  void _onClickTab(int index) {
    setState(() {
      _selectedIndex = index;
      _tabTitle = _titles[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_tabTitle),),
      body: IndexedStack(index: _selectedIndex, children: _tabs),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onClickTab, 
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.red,       
        items:[ 
        BottomNavigationBarItem(icon: Icon(Icons.home_outlined),
        activeIcon: Icon(Icons.home),
        label: 'Home',
        
        ),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_bag_outlined),
        activeIcon: Icon(Icons.shopping_bag),
        label: 'Orders',
        ),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_checkout_outlined),
        activeIcon: Icon(Icons.shopping_cart),
        label: 'Cart',
        ),
        BottomNavigationBarItem(icon: Icon(Icons.person_2_outlined),
        activeIcon: Icon(Icons.person_2),
        label: 'Profile',
        ),],),
    );

  }
    
}

class _HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return ListView.builder(
      itemCount: dummyProducts.length,
      itemBuilder: (context, index) {
        var product = dummyProducts[index];
        return ProductCard(product: product);
      },
    );
  }
}
  // final List<Map<String, String>> clothesCatalog = [
  //   {"name": "Floral Dress", "price": "KES 1500", "image": "assets/images/cocktaildress.jpg"},
  //   {"name": "Summer Dress", "price": "KES 1000", "image": "assets/images/summer.jpg"},
  //   {"name": "Casual Gown", "price": "KES 15000", "image": "assets/images/casualgown.jpg"},
  //   {"name": "Evening Wear", "price": "KES 20000", "image": "assets/images/eveningwear.jpg"},
  //   {"name": "Sun Dress", "price": "KES 1550", "image": "assets/images/sundress.jpg"},
  //   {"name": "Cocktail Dress", "price": "KES 1700", "image": "assets/images/cocktail.jpg"},
  //   {"name": "Maxi Dress", "price": "KES 950", "image": "assets/images/maxi.jpg"},
  //   {"name": "Party Dress", "price": "KES 950", "image": "assets/images/partydress.jpg"},
  // ];

//   @override 
//   Widget build(BuildContext context) {
//     return GridView.count(
//       crossAxisCount: 2,
//       padding: const EdgeInsets.all(10),
//       crossAxisSpacing: 10,
//       mainAxisSpacing: 10,
//       childAspectRatio: 0.8,
//       children: List.generate(clothesCatalog.length, (index) {
//         final item = clothesCatalog[index];

//         return ClipRRect(
//           borderRadius: BorderRadius.circular(12),
//           child: Stack(
//             fit: StackFit.expand,
//             children: [
             
//               Image.asset(
//                 item["image"]!, 
//                 fit: BoxFit.cover,
//                 errorBuilder: (context, error, stackTrace) {
//                   return Container(
//                     color:  Colors.grey.shade300,
//                     child: const Icon(Icons.broken_image, color: Colors.grey, size: 40),
//                   );
//                 },
//               ),
              
              
//               Positioned(
//                 bottom: 0,
//                 left: 0,
//                 right: 0,
//                 child: Container(
//                   padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
//                   color: Colors.pinkAccent.withValues(alpha: 0.65), 
//                   child: Row(
//                     children: [
                      
//                       Expanded(
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             Text(
//                               item["name"]!, 
//                               style: const TextStyle(
//                                 color: Colors.white, 
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 13,
//                               ),
//                               maxLines: 1,
//                               overflow: TextOverflow.ellipsis,
//                             ),
//                             const SizedBox(height: 2),
//                             Text(
//                               item["price"]!, 
//                               style: const TextStyle(
//                                 color: Colors.greenAccent, 
//                                 fontWeight: FontWeight.w600,
//                                 fontSize: 12,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
                      
                    
//                       Material(
//                         color: Colors.transparent,
//                         child: InkWell(
//                           borderRadius: BorderRadius.circular(20),
//                           onTap: () {
                          
//                           },
//                           child: const Padding(
//                             padding: EdgeInsets.all(6.0),
//                             child: Icon(
//                               Icons.add_shopping_cart, 
//                               color: Colors.white, 
//                               size: 18,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         );
//       }),
//     );
//   }
// }


  
class _OrdersTab extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Orders"));
  }
}

class _ShoppingCartTab extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Cart"));
  }
}
class _ProfileTab extends StatelessWidget {
  @override 
  Widget build(BuildContext context) {
    return Center(child: Text("Profile"));
  }
}