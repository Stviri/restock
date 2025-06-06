import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

/// Supermarket list
class SupermarketsRecord extends FirestoreRecord {
  SupermarketsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "supermarket_name" field.
  String? _supermarketName;
  String get supermarketName => _supermarketName ?? '';
  bool hasSupermarketName() => _supermarketName != null;

  // "supermarket_banner" field.
  String? _supermarketBanner;
  String get supermarketBanner => _supermarketBanner ?? '';
  bool hasSupermarketBanner() => _supermarketBanner != null;

  // "supermarket_salecount" field.
  int? _supermarketSalecount;
  int get supermarketSalecount => _supermarketSalecount ?? 0;
  bool hasSupermarketSalecount() => _supermarketSalecount != null;

  // "supermarket_hours" field.
  String? _supermarketHours;
  String get supermarketHours => _supermarketHours ?? '';
  bool hasSupermarketHours() => _supermarketHours != null;

  // "supermarket_header" field.
  String? _supermarketHeader;
  String get supermarketHeader => _supermarketHeader ?? '';
  bool hasSupermarketHeader() => _supermarketHeader != null;

  // "supermarket_bg_color" field.
  String? _supermarketBgColor;
  String get supermarketBgColor => _supermarketBgColor ?? '';
  bool hasSupermarketBgColor() => _supermarketBgColor != null;

  void _initializeFields() {
    _supermarketName = snapshotData['supermarket_name'] as String?;
    _supermarketBanner = snapshotData['supermarket_banner'] as String?;
    _supermarketSalecount =
        castToType<int>(snapshotData['supermarket_salecount']);
    _supermarketHours = snapshotData['supermarket_hours'] as String?;
    _supermarketHeader = snapshotData['supermarket_header'] as String?;
    _supermarketBgColor = snapshotData['supermarket_bg_color'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('supermarkets');

  static Stream<SupermarketsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SupermarketsRecord.fromSnapshot(s));

  static Future<SupermarketsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SupermarketsRecord.fromSnapshot(s));

  static SupermarketsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SupermarketsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SupermarketsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SupermarketsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SupermarketsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SupermarketsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSupermarketsRecordData({
  String? supermarketName,
  String? supermarketBanner,
  int? supermarketSalecount,
  String? supermarketHours,
  String? supermarketHeader,
  String? supermarketBgColor,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'supermarket_name': supermarketName,
      'supermarket_banner': supermarketBanner,
      'supermarket_salecount': supermarketSalecount,
      'supermarket_hours': supermarketHours,
      'supermarket_header': supermarketHeader,
      'supermarket_bg_color': supermarketBgColor,
    }.withoutNulls,
  );

  return firestoreData;
}

class SupermarketsRecordDocumentEquality
    implements Equality<SupermarketsRecord> {
  const SupermarketsRecordDocumentEquality();

  @override
  bool equals(SupermarketsRecord? e1, SupermarketsRecord? e2) {
    return e1?.supermarketName == e2?.supermarketName &&
        e1?.supermarketBanner == e2?.supermarketBanner &&
        e1?.supermarketSalecount == e2?.supermarketSalecount &&
        e1?.supermarketHours == e2?.supermarketHours &&
        e1?.supermarketHeader == e2?.supermarketHeader &&
        e1?.supermarketBgColor == e2?.supermarketBgColor;
  }

  @override
  int hash(SupermarketsRecord? e) => const ListEquality().hash([
        e?.supermarketName,
        e?.supermarketBanner,
        e?.supermarketSalecount,
        e?.supermarketHours,
        e?.supermarketHeader,
        e?.supermarketBgColor
      ]);

  @override
  bool isValidKey(Object? o) => o is SupermarketsRecord;
}
