import 'dart:io';
import '../lib/product_manager.dart';

void main() {
  ProductManager manager = ProductManager();

  while (true) {
    print('\n--- eCommerce App ---');
    print('1. Add Product');
    print('2. View All Products');
    print('3. View Product');
    print('4. Edit Product');
    print('5. Delete Product');
    print('6. Exit');
    stdout.write('Choose an option: ');

    String? choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        // Add product
        stdout.write('Enter product name: ');
        String name = stdin.readLineSync()!;
        stdout.write('Enter product description: ');
        String description = stdin.readLineSync()!;

        double price;
        while (true) {
          stdout.write('Enter product price (e.g., 600.99): ');
          String priceInput = stdin.readLineSync()!;
          priceInput = priceInput.replaceAll(RegExp(r'[^0-9.]'), '');

          try {
            price = double.parse(priceInput);
            break; // Exit the loop if price is valid
          } catch (e) {
            print('Invalid input! Please enter a valid number for the price.');
          }
        }

        manager.addProduct(name, description, price);
        break;

      case '2':
        manager.viewProducts();
        break;

      case '3':
        stdout.write('Enter product ID: ');
        int id = int.parse(stdin.readLineSync()!);
        manager.viewProduct(id);
        break;

      case '4':
        stdout.write('Enter product ID to edit: ');
        int editId = int.parse(stdin.readLineSync()!);
        stdout.write('Enter new product name: ');
        String newName = stdin.readLineSync()!;
        stdout.write('Enter new description: ');
        String newDescription = stdin.readLineSync()!;

        double newPrice;
        while (true) {
          stdout.write('Enter new price: ');
          String newPriceInput = stdin.readLineSync()!;
          newPriceInput = newPriceInput.replaceAll(RegExp(r'[^0-9.]'), '');

          try {
            newPrice = double.parse(newPriceInput);
            break; // Exit the loop if price is valid
          } catch (e) {
            print('Invalid input! Please enter a valid number for the price.');
          }
        }

        manager.editProduct(editId, newName, newDescription, newPrice);
        break;

      case '5':
        stdout.write('Enter product ID to delete: ');
        int deleteId = int.parse(stdin.readLineSync()!);
        manager.deleteProduct(deleteId);
        break;

      case '6':
        print('Exiting...');
        return;

      default:
        print('Invalid option! Try again.');
    }
  }
}
