import 'product.dart';

class ProductManager {
  List<Product> _products = [];

  void addProduct(String name, String description, double price) {
    _products.add(Product(name, description, price));
    print('Product "$name" added successfully!');
  }

  void viewProducts() {
    if (_products.isEmpty) {
      print('No products available.');
    } else {
      for (int i = 0; i < _products.length; i++) {
        print('\nProduct ID: $i');
        print(_products[i]);
      }
    }
  }

  void viewProduct(int id) {
    if (id >= 0 && id < _products.length) {
      print(_products[id]);
    } else {
      print('Product not found!');
    }
  }

  void editProduct(int id, String name, String description, double price) {
    if (id >= 0 && id < _products.length) {
      _products[id].name = name;
      _products[id].description = description;
      _products[id].price = price;
      print('Product updated successfully!');
    } else {
      print('Invalid product ID!');
    }
  }

  void deleteProduct(int id) {
    if (id >= 0 && id < _products.length) {
      print('Product "${_products[id].name}" deleted successfully!');
      _products.removeAt(id);
    } else {
      print('Invalid product ID!');
    }
  }
}
