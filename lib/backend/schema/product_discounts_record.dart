import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

/// Discounted Products
class ProductDiscountsRecord extends FirestoreRecord {
  ProductDiscountsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  bool hasPrice() => _price != null;

  // "sale_price" field.
  double? _salePrice;
  double get salePrice => _salePrice ?? 0.0;
  bool hasSalePrice() => _salePrice != null;

  // "img_url" field.
  String? _imgUrl;
  String get imgUrl => _imgUrl ?? '';
  bool hasImgUrl() => _imgUrl != null;

  // "supermarket" field.
  String? _supermarket;
  String get supermarket => _supermarket ?? '';
  bool hasSupermarket() => _supermarket != null;

  // "supermarket_img_url" field.
  String? _supermarketImgUrl;
  String get supermarketImgUrl => _supermarketImgUrl ?? '';
  bool hasSupermarketImgUrl() => _supermarketImgUrl != null;

  // "discount_percentage" field.
  double? _discountPercentage;
  double get discountPercentage => _discountPercentage ?? 0.0;
  bool hasDiscountPercentage() => _discountPercentage != null;

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  bool hasCategory() => _category != null;

  // "product_category" field.
  String? _productCategory;
  String get productCategory => _productCategory ?? '';
  bool hasProductCategory() => _productCategory != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _price = castToType<double>(snapshotData['price']);
    _salePrice = castToType<double>(snapshotData['sale_price']);
    _imgUrl = snapshotData['img_url'] as String?;
    _supermarket = snapshotData['supermarket'] as String?;
    _supermarketImgUrl = snapshotData['supermarket_img_url'] as String?;
    _discountPercentage =
        castToType<double>(snapshotData['discount_percentage']);
    _category = snapshotData['category'] as String?;
    _productCategory = snapshotData['product_category'] as String?;
    _description = snapshotData['description'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('product_discounts');

  static Stream<ProductDiscountsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ProductDiscountsRecord.fromSnapshot(s));

  static Future<ProductDiscountsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => ProductDiscountsRecord.fromSnapshot(s));

  static ProductDiscountsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ProductDiscountsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ProductDiscountsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ProductDiscountsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ProductDiscountsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ProductDiscountsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createProductDiscountsRecordData({
  String? name,
  double? price,
  double? salePrice,
  String? imgUrl,
  String? supermarket,
  String? supermarketImgUrl,
  double? discountPercentage,
  String? category,
  String? productCategory,
  String? description,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'price': price,
      'sale_price': salePrice,
      'img_url': imgUrl,
      'supermarket': supermarket,
      'supermarket_img_url': supermarketImgUrl,
      'discount_percentage': discountPercentage,
      'category': category,
      'product_category': productCategory,
      'description': description,
    }.withoutNulls,
  );

  return firestoreData;
}

class ProductDiscountsRecordDocumentEquality
    implements Equality<ProductDiscountsRecord> {
  const ProductDiscountsRecordDocumentEquality();

  @override
  bool equals(ProductDiscountsRecord? e1, ProductDiscountsRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.price == e2?.price &&
        e1?.salePrice == e2?.salePrice &&
        e1?.imgUrl == e2?.imgUrl &&
        e1?.supermarket == e2?.supermarket &&
        e1?.supermarketImgUrl == e2?.supermarketImgUrl &&
        e1?.discountPercentage == e2?.discountPercentage &&
        e1?.category == e2?.category &&
        e1?.productCategory == e2?.productCategory &&
        e1?.description == e2?.description;
  }

  @override
  int hash(ProductDiscountsRecord? e) => const ListEquality().hash([
        e?.name,
        e?.price,
        e?.salePrice,
        e?.imgUrl,
        e?.supermarket,
        e?.supermarketImgUrl,
        e?.discountPercentage,
        e?.category,
        e?.productCategory,
        e?.description
      ]);

  @override
  bool isValidKey(Object? o) => o is ProductDiscountsRecord;
}
