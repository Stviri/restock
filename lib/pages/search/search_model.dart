import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'search_widget.dart' show SearchWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';

class SearchModel extends FlutterFlowModel<SearchWidget> {
  ///  Local state fields for this page.

  bool searchactive = true;

  ///  State fields for stateful widgets in this page.

  // State field(s) for searchQuery widget.
  FocusNode? searchQueryFocusNode;
  TextEditingController? searchQueryTextController;
  String? Function(BuildContext, String?)? searchQueryTextControllerValidator;
  List<ProductDiscountsRecord> simpleSearchResults = [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    searchQueryFocusNode?.dispose();
    searchQueryTextController?.dispose();
  }
}
