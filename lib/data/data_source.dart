
import 'package:universal_list/data/item_model.dart';

abstract class DataSource {

  String getName();

  Future<List<ItemModel>> getItemsModel();
}

/* =-=-=-=-=-= [Mock] =-=-=-=-=-= */

// class DataSourceMock implements DataSource {
//   @override
//   Future<List<ItemModel>> getItems() {
//
//
//     if(!Random().nextBool()) {
//       throw Exception();
//     }
//
//     return Future.delayed(
//       const Duration(seconds: 2),
//           () => [
//         ItemModel(
//           'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRvFBa3G11OUBYADP7ouSBgwiiRzSYorF4dfg&usqp=CAU',
//             'Title 1',
//             'Description 1'),
//         ItemModel(
//             'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRMIa3vofG7yuK4WzvzseO3mI66DnxhoC5Obw&usqp=CAU',
//             'Title 2',
//             'Description 2'),
//         ItemModel(
//             'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRMIa3vofG7yuK4WzvzseO3mI66DnxhoC5Obw&usqp=CAU',
//             'Title 3',
//             'Description 3'),
//         ItemModel(
//             'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRMIa3vofG7yuK4WzvzseO3mI66DnxhoC5Obw&usqp=CAU',
//             'Title 4',
//             'Description 4'),
//         ItemModel(
//             'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRMIa3vofG7yuK4WzvzseO3mI66DnxhoC5Obw&usqp=CAU',
//             'Title 5',
//             'Description 5'),
//       ],
//     );
//   }
// }

/* =-=-=-=-=-= [Rick & Morty] =-=-=-=-=-= */
