import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {

  // get collections of orders
   final CollectionReference orders =
       FirebaseFirestore.instance.collection("Orders");

  // store orders to database
   Future<void>saveOredrToDatabase (String receipt) async {
     await orders.add ({
       'date': DateTime.now(),
       'orders': receipt,

     // add ore fields as necessary

     });
   }
}