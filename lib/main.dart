import 'package:flutter/material.dart';

import 'Product.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Product> product = [
    Product('Apple Mobile', 300000.00, 0),
    Product('Radmi Mobile', 20000.00, 0),
    Product('Laptop', 250000.00, 0),
    Product('Mac Book', 3000000.00, 0),
    Product('Samsung Mobile', 300000.00, 0),
    Product('Apple Mobile', 300000.00, 0),
    Product('Radmi Mobile', 20000.00, 0),
    Product('Laptop', 250000.00, 0),
    Product('Mac Book', 3000000.00, 0),
    Product('Samsung Mobile', 300000.00, 0),
  ];

  void _showCongratulationsDialog(Product product) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Congratulations!'),
            content: Text(
                "You've bought ${product.quainty} ${product.productName}!"),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('OK'))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Product List',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => CartPage(product)));
          },
          child: Icon(
            Icons.shopping_cart,
            color: Colors.white,
          ),
          backgroundColor: Colors.blue,
        ),
        body: ListView.builder(
          itemCount: product.length,
          itemBuilder: (context, index) {
            var products = product[index];
            return ListTile(
              title: Text('${products.productName}'),
              subtitle: Text('${products.productPrince}'),
              trailing: Column(
                children: [
                  Text('Quantty ${products.quainty}'),
                  GestureDetector(
                    onTap: () {
                      products.quainty++;
                      if (5 <= products.quainty) {
                        _showCongratulationsDialog(products);
                      }
                      setState(() {});
                    },
                    child: Container(
                      width: 80,
                      height: 40,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                          child: Text(
                        'Buy Now',
                        style: TextStyle(fontSize: 14, color: Colors.white),
                      )),
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class CartPage extends StatelessWidget {
  final List<Product> cartProducts;

  CartPage(this.cartProducts);

  int getTotalQuantity() {
    int total = 0;
    for (Product product in cartProducts) {
      total += product.quainty;
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Total Quantity: ${getTotalQuantity()}",
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
