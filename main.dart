
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(const MinhaApp());

const green = Color(0xFF087F3E);
const darkGreen = Color(0xFF045B2D);
const gold = Color(0xFFFFC107);
const whatsapp = '923336245021';

class Product {
  final String name, category, price, emoji, subtitle;
  const Product(this.name, this.category, this.price, this.emoji, this.subtitle);
}

const products = [
  Product('Chicken Biryani', 'Food', '450', '🍛', 'Spicy • Fresh • 1 plate'),
  Product('Chicken Karahi', 'Food', '480', '🍲', 'Desi taste • Full plate'),
  Product('Burger', 'Food', '250', '🍔', 'Crispy chicken burger'),
  Product('Pizza', 'Food', '650', '🍕', 'Large • Fresh cheese'),
  Product('Basmati Rice 5kg', 'Grocery', '2,000', '🍚', 'Premium quality'),
  Product('Cooking Oil 5L', 'Grocery', '3,450', '🫗', 'Fresh cooking oil'),
  Product('Sugar 1kg', 'Grocery', '180', '🧂', 'Fine quality'),
  Product('Tea 250g', 'Grocery', '450', '🫖', 'Strong tea'),
  Product('Tomato 1kg', 'Vegetables', '80', '🍅', 'Fresh today'),
  Product('Onion 1kg', 'Vegetables', '70', '🧅', 'Fresh & clean'),
  Product('Potato 1kg', 'Vegetables', '60', '🥔', 'Farm fresh'),
  Product('Green Chili 250g', 'Vegetables', '120', '🌶️', 'Fresh & spicy'),
  Product('Paracetamol 500mg', 'Medicine', '120', '💊', 'For adults'),
  Product('Amoxicillin 500mg', 'Medicine', '230', '💊', 'Pharmacy item'),
  Product('Vitamin C', 'Medicine', '180', '🍊', 'Daily supplement'),
  Product('ORS Sachet', 'Medicine', '60', '🧃', 'Rehydration'),
  Product('Home Essentials', 'Other', '300', '🏠', 'Daily home needs'),
];

class MinhaApp extends StatelessWidget {
  const MinhaApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Minha Food Delivery',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: green),
        scaffoldBackgroundColor: const Color(0xFFF7FBF5),
        useMaterial3: true,
        fontFamily: 'Roboto',
      ),
      home: const SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override State<SplashScreen> createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const WelcomeScreen()));
    });
  }
  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: darkGreen,
    body: SafeArea(child: Center(child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 190, height: 190,
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(42),
            boxShadow: [BoxShadow(color: Colors.black.withOpacity(.22), blurRadius: 24, offset: const Offset(0, 10))]),
          child: ClipRRect(borderRadius: BorderRadius.circular(30), child: Image.asset('assets/minha_logo.png', fit: BoxFit.cover)),
        ),
        const SizedBox(height: 22),
        const Text('Minha Food Delivery', style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold)),
        const SizedBox(height: 5),
        const Text('Mian Channu', style: TextStyle(color: gold, fontSize: 19, fontWeight: FontWeight.w600)),
        const SizedBox(height: 28),
        const Text('Your Needs • Our Priority', style: TextStyle(color: Colors.white70, fontSize: 16, fontStyle: FontStyle.italic)),
      ],
    ))),
  );
}

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(
    body: SafeArea(child: Padding(
      padding: const EdgeInsets.all(22),
      child: Column(children: [
        const Spacer(),
        Container(
          height: 300, width: double.infinity,
          decoration: BoxDecoration(
            gradient: const LinearGradient(colors: [darkGreen, green]),
            borderRadius: BorderRadius.circular(30),
            boxShadow: [BoxShadow(color: green.withOpacity(.28), blurRadius: 24, offset: const Offset(0, 12))],
          ),
          child: Stack(children: [
            Positioned(top: 18, right: 18, child: Icon(Icons.delivery_dining, color: gold, size: 74)),
            Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(width: 120, height: 120, padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(28)),
                child: ClipRRect(borderRadius: BorderRadius.circular(20), child: Image.asset('assets/minha_logo.png', fit: BoxFit.cover))),
              const SizedBox(height: 16),
              const Text('Welcome to Minha', style: TextStyle(color: Colors.white, fontSize: 27, fontWeight: FontWeight.bold)),
              const Text('Fast • Safe • Reliable', style: TextStyle(color: gold, fontSize: 17)),
            ])),
          ]),
        ),
        const SizedBox(height: 22),
        const Text('آپ کے گھر کی ہر ضرورت، اب چند منٹوں میں!', textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        const Text('Fresh food, groceries, vegetables, medicine & more — صرف میان چنوں میں',
          textAlign: TextAlign.center, style: TextStyle(color: Colors.black54, fontSize: 15)),
        const Spacer(),
        SizedBox(width: double.infinity, height: 54, child: FilledButton.icon(
          icon: const Icon(Icons.shopping_bag_outlined), label: const Text('Start Shopping', style: TextStyle(fontSize: 18)),
          onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const HomeScreen())),
        )),
        const SizedBox(height: 12),
        const Text('🚚 Delivery Rs. 100   •   💵 Cash on Delivery', style: TextStyle(fontWeight: FontWeight.w600)),
        const SizedBox(height: 18),
      ]),
    )),
  );
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  int tab = 0;
  final cart = <Product, int>{};

  int get count => cart.values.fold(0, (a, b) => a + b);

  void add(Product p) => setState(() => cart[p] = (cart[p] ?? 0) + 1);

  void openCategory(String category) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => CategoryScreen(category: category, cart: cart, onAdd: add)));
  }

  @override
  Widget build(BuildContext context) {
    final pages = [
      _homeBody(),
      CategoryGrid(onTap: openCategory),
      OrdersScreen(),
      ProfileScreen(cart: cart, count: count),
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: green, foregroundColor: Colors.white,
        title: const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('Minha Food Delivery', style: TextStyle(fontWeight: FontWeight.bold)),
          Text('Mian Channu', style: TextStyle(fontSize: 13, color: Colors.white70)),
        ]),
        actions: [IconButton(onPressed: () => _openCart(), icon: Badge(label: Text('$count'), isLabelVisible: count > 0, child: const Icon(Icons.shopping_cart_outlined)))],
      ),
      body: pages[tab],
      bottomNavigationBar: NavigationBar(
        selectedIndex: tab, onDestinationSelected: (i) => setState(() => tab = i),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_outlined), selectedIcon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.grid_view_outlined), selectedIcon: Icon(Icons.grid_view), label: 'Categories'),
          NavigationDestination(icon: Icon(Icons.receipt_long_outlined), selectedIcon: Icon(Icons.receipt_long), label: 'Orders'),
          NavigationDestination(icon: Icon(Icons.person_outline), selectedIcon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }

  Widget _homeBody() => SingleChildScrollView(
    padding: const EdgeInsets.fromLTRB(18, 16, 18, 24),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      TextField(
        decoration: InputDecoration(
          hintText: 'Search food, grocery, medicine...',
          prefixIcon: const Icon(Icons.search), filled: true, fillColor: Colors.white,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(18), borderSide: const BorderSide(color: Colors.black26)),
        ),
      ),
      const SizedBox(height: 16),
      Container(
        height: 180, width: double.infinity,
        decoration: BoxDecoration(gradient: const LinearGradient(colors: [green, Color(0xFF19A95D)]),
          borderRadius: BorderRadius.circular(26)),
        child: Stack(children: [
          Positioned(right: 15, top: 15, child: Icon(Icons.delivery_dining, color: Colors.white.withOpacity(.25), size: 120)),
          Padding(padding: const EdgeInsets.all(22), child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.center, children: [
            const Text('Fresh Food', style: TextStyle(color: Colors.white, fontSize: 29, fontWeight: FontWeight.bold)),
            const Text('Fast Delivery', style: TextStyle(color: gold, fontSize: 22, fontWeight: FontWeight.w700)),
            const SizedBox(height: 10),
            FilledButton.tonal(onPressed: () => openCategory('Food'), child: const Text('Order Now')),
          ])),
        ]),
      ),
      const SizedBox(height: 12),
      Container(width: double.infinity, padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 13),
        decoration: BoxDecoration(color: const Color(0xFFE8F6EC), borderRadius: BorderRadius.circular(18)),
        child: const Text('📍 صرف میان چنوں میں   •   🛵 Delivery Rs. 100   •   💵 Cash on Delivery',
          style: TextStyle(fontWeight: FontWeight.w700))),
      const SizedBox(height: 22),
      const Text('Categories', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
      const SizedBox(height: 12),
      SizedBox(height: 118, child: ListView(scrollDirection: Axis.horizontal, children: [
        _cat('🍔', 'Food', () => openCategory('Food')),
        _cat('🛒', 'Grocery', () => openCategory('Grocery')),
        _cat('🥬', 'Vegetables', () => openCategory('Vegetables')),
        _cat('💊', 'Medicine', () => openCategory('Medicine')),
        _cat('📦', 'Other', () => openCategory('Other')),
      ])),
      const SizedBox(height: 22),
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        const Text('Popular Items', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        TextButton(onPressed: () => openCategory('Food'), child: const Text('See All')),
      ]),
      const SizedBox(height: 8),
      ...products.take(4).map((p) => ProductTile(product: p, onAdd: () => add(p))),
    ]),
  );

  Widget _cat(String icon, String title, VoidCallback onTap) => Padding(
    padding: const EdgeInsets.only(right: 12),
    child: InkWell(onTap: onTap, borderRadius: BorderRadius.circular(20), child: Container(width: 105,
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.black12), boxShadow: const [BoxShadow(blurRadius: 7, color: Colors.black12)]),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(icon, style: const TextStyle(fontSize: 34)), const SizedBox(height: 6),
        Text(title, style: const TextStyle(fontWeight: FontWeight.w700)),
      ]))),
  );

  void _openCart() => Navigator.push(context, MaterialPageRoute(builder: (_) => CartScreen(cart: cart)));
}

class CategoryGrid extends StatelessWidget {
  final void Function(String) onTap;
  const CategoryGrid({super.key, required this.onTap});
  @override Widget build(BuildContext context) => GridView.count(
    padding: const EdgeInsets.all(18), crossAxisCount: 2, mainAxisSpacing: 14, crossAxisSpacing: 14,
    children: [
      _c('🍔','Food'), _c('🛒','Grocery'), _c('🥬','Vegetables'), _c('💊','Medicine'), _c('📦','Other'),
    ],
  );
  Widget _c(String icon, String name) => InkWell(onTap: () => onTap(name), borderRadius: BorderRadius.circular(22),
    child: Card(elevation: 1, child: Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text(icon, style: const TextStyle(fontSize: 50)), const SizedBox(height: 10), Text(name, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
    ]))));
}

class CategoryScreen extends StatelessWidget {
  final String category; final Map<Product,int> cart; final void Function(Product) onAdd;
  const CategoryScreen({super.key, required this.category, required this.cart, required this.onAdd});
  @override Widget build(BuildContext context) {
    final list = products.where((p) => p.category == category).toList();
    return Scaffold(
      appBar: AppBar(title: Text(category), backgroundColor: green, foregroundColor: Colors.white),
      body: ListView.builder(padding: const EdgeInsets.all(14), itemCount: list.length,
        itemBuilder: (_, i) => ProductTile(product: list[i], onAdd: () => onAdd(list[i]))),
    );
  }
}

class ProductTile extends StatelessWidget {
  final Product product; final VoidCallback onAdd;
  const ProductTile({super.key, required this.product, required this.onAdd});
  @override Widget build(BuildContext context) => Card(
    margin: const EdgeInsets.only(bottom: 12), elevation: 1,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
    child: Padding(padding: const EdgeInsets.all(12), child: Row(children: [
      Container(width: 76, height: 76, decoration: BoxDecoration(color: const Color(0xFFEAF7EE), borderRadius: BorderRadius.circular(16)),
        child: Center(child: Text(product.emoji, style: const TextStyle(fontSize: 42)))),
      const SizedBox(width: 13),
      Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(product.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
        const SizedBox(height: 4), Text(product.subtitle, style: const TextStyle(color: Colors.black54, fontSize: 12)),
        const SizedBox(height: 6), Text('Rs. ${product.price}', style: const TextStyle(color: green, fontWeight: FontWeight.w800, fontSize: 16)),
      ])),
      FilledButton(onPressed: onAdd, child: const Text('Add')),
    ])),
  );
}

class CartScreen extends StatefulWidget {
  final Map<Product,int> cart;
  const CartScreen({super.key, required this.cart});
  @override State<CartScreen> createState() => _CartScreenState();
}
class _CartScreenState extends State<CartScreen> {
  int get subtotal => widget.cart.entries.fold(0, (s,e) => s + int.parse(e.key.price.replaceAll(',','')) * e.value);
  int get total => subtotal + 100;
  @override Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Your Cart'), backgroundColor: green, foregroundColor: Colors.white),
    body: widget.cart.isEmpty ? const Center(child: Text('Cart is empty', style: TextStyle(fontSize: 20))) :
    Column(children: [
      Expanded(child: ListView(padding: const EdgeInsets.all(14), children: widget.cart.entries.map((e) => ListTile(
        leading: Text(e.key.emoji, style: const TextStyle(fontSize: 32)),
        title: Text(e.key.name), subtitle: Text('Rs. ${e.key.price} × ${e.value}'),
        trailing: IconButton(icon: const Icon(Icons.remove_circle_outline), onPressed: () => setState(() {
          if (e.value <= 1) widget.cart.remove(e.key); else widget.cart[e.key] = e.value - 1;
        })),
      )).toList())),
      Container(padding: const EdgeInsets.all(18), decoration: const BoxDecoration(color: Colors.white, boxShadow: [BoxShadow(blurRadius: 12, color: Colors.black12)]),
        child: Column(children: [
          _row('Subtotal', 'Rs. $subtotal'), _row('Delivery', 'Rs. 100'),
          const Divider(), _row('Total', 'Rs. $total', bold: true),
          const SizedBox(height: 12), SizedBox(width: double.infinity, height: 52, child: FilledButton.icon(
            icon: const Icon(Icons.check_circle_outline), label: const Text('Checkout', style: TextStyle(fontSize: 17)),
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => CheckoutScreen(total: total))),
          )),
        ]),
      )
    ]),
  );
  Widget _row(String a,String b,{bool bold=false}) => Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
    Text(a, style: TextStyle(fontWeight: bold ? FontWeight.bold : FontWeight.normal, fontSize: bold ? 18 : 15)),
    Text(b, style: TextStyle(fontWeight: bold ? FontWeight.bold : FontWeight.w600, color: bold ? green : null, fontSize: bold ? 18 : 15)),
  ]);
}

class CheckoutScreen extends StatefulWidget {
  final int total; const CheckoutScreen({super.key, required this.total});
  @override State<CheckoutScreen> createState() => _CheckoutScreenState();
}
class _CheckoutScreenState extends State<CheckoutScreen> {
  final name = TextEditingController(), address = TextEditingController(), phone = TextEditingController();
  @override Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Checkout'), backgroundColor: green, foregroundColor: Colors.white),
    body: ListView(padding: const EdgeInsets.all(18), children: [
      const Text('Delivery Address', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
      const SizedBox(height: 12),
      TextField(controller: name, decoration: const InputDecoration(labelText: 'Full Name', prefixIcon: Icon(Icons.person_outline), border: OutlineInputBorder())),
      const SizedBox(height: 12),
      TextField(controller: phone, keyboardType: TextInputType.phone, decoration: const InputDecoration(labelText: 'Phone Number', prefixIcon: Icon(Icons.phone_outlined), border: OutlineInputBorder())),
      const SizedBox(height: 12),
      TextField(controller: address, maxLines: 3, decoration: const InputDecoration(labelText: 'Address in Mian Channu', prefixIcon: Icon(Icons.location_on_outlined), border: OutlineInputBorder())),
      const SizedBox(height: 18),
      Card(child: ListTile(leading: const Icon(Icons.payments_outlined, color: green), title: const Text('Cash on Delivery'), subtitle: const Text('Pay when your order arrives'))),
      const SizedBox(height: 18),
      Text('Total: Rs. ${widget.total}', style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: green)),
      const SizedBox(height: 14),
      SizedBox(height: 54, child: FilledButton(onPressed: _place, child: const Text('Place Order', style: TextStyle(fontSize: 18)))),
    ]),
  );
  Future<void> _place() async {
    if (name.text.trim().isEmpty || phone.text.trim().isEmpty || address.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Please fill name, phone and address')));
      return;
    }
    final msg = 'Minha Food Delivery Order%0A%0AName: ${Uri.encodeComponent(name.text)}%0APhone: ${Uri.encodeComponent(phone.text)}%0AAddress: ${Uri.encodeComponent(address.text)}%0ATotal: Rs. ${widget.total}%0APayment: Cash on Delivery';
    await launchUrl(Uri.parse('https://wa.me/$whatsapp?text=$msg'), mode: LaunchMode.externalApplication);
    if (mounted) Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => OrderDoneScreen(total: widget.total)));
  }
}

class OrderDoneScreen extends StatelessWidget {
  final int total; const OrderDoneScreen({super.key, required this.total});
  @override Widget build(BuildContext context) => Scaffold(
    body: Center(child: Padding(padding: const EdgeInsets.all(25), child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Container(width: 105, height: 105, decoration: const BoxDecoration(color: Color(0xFFE4F6E8), shape: BoxShape.circle), child: const Icon(Icons.check, size: 65, color: green)),
      const SizedBox(height: 22), const Text('Order Placed!', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
      const SizedBox(height: 8), const Text('Your order has been sent on WhatsApp.', textAlign: TextAlign.center),
      const SizedBox(height: 18), Text('Total: Rs. $total', style: const TextStyle(fontSize: 22, color: green, fontWeight: FontWeight.bold)),
      const SizedBox(height: 25), FilledButton.icon(onPressed: () => Navigator.popUntil(context, (r) => r.isFirst), icon: const Icon(Icons.home), label: const Text('Back to Home')),
    ]))),
  );
}

class OrdersScreen extends StatelessWidget {
  OrdersScreen({super.key});
  @override Widget build(BuildContext context) => ListView(padding: const EdgeInsets.all(18), children: [
    const Text('My Orders', style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
    const SizedBox(height: 15),
    Card(child: ListTile(leading: const Icon(Icons.receipt_long, color: green), title: const Text('No recent orders'), subtitle: const Text('Your completed orders will appear here.'))),
    const SizedBox(height: 22),
    _panel('Rider Panel', Icons.delivery_dining, 'Demo rider dashboard'),
    _panel('Admin Panel', Icons.admin_panel_settings, 'Demo admin dashboard'),
  ]);
  Widget _panel(String t, IconData i, String s) => Card(
    child: ListTile(leading: CircleAvatar(backgroundColor: green, child: Icon(i, color: Colors.white)), title: Text(t, style: const TextStyle(fontWeight: FontWeight.bold)), subtitle: Text(s)),
  );
}

class ProfileScreen extends StatelessWidget {
  final Map<Product,int> cart; final int count;
  const ProfileScreen({super.key, required this.cart, required this.count});
  @override Widget build(BuildContext context) => ListView(padding: const EdgeInsets.all(18), children: [
    Center(child: Container(width: 110, height: 110, padding: const EdgeInsets.all(7), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(28), boxShadow: const [BoxShadow(blurRadius: 10, color: Colors.black12)]), child: ClipRRect(borderRadius: BorderRadius.circular(21), child: Image.asset('assets/minha_logo.png', fit: BoxFit.cover)))),
    const SizedBox(height: 15), const Center(child: Text('Minha Customer', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold))),
    const SizedBox(height: 20),
    _tile(context, Icons.shopping_cart_outlined, 'Cart', '$count items', () => Navigator.push(context, MaterialPageRoute(builder: (_) => CartScreen(cart: cart)))),
    _tile(context, Icons.location_on_outlined, 'Delivery Area', 'Mian Channu only', null),
    _tile(context, Icons.payments_outlined, 'Payment', 'Cash on Delivery', null),
    _tile(context, Icons.support_agent, 'WhatsApp Support', '0333 6245021', () => launchUrl(Uri.parse('https://wa.me/$whatsapp'), mode: LaunchMode.externalApplication)),
  ]);
  Widget _tile(BuildContext c, IconData i, String t, String s, VoidCallback? onTap) => Card(child: ListTile(onTap: onTap, leading: Icon(i, color: green), title: Text(t, style: const TextStyle(fontWeight: FontWeight.w700)), subtitle: Text(s), trailing: onTap != null ? const Icon(Icons.chevron_right) : null));
}
