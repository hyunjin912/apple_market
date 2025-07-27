import 'dart:convert';
import 'package:apple_market/data/data_sources/product_data_source.dart';
import 'package:apple_market/data/dtos/product_dto.dart';
import 'package:flutter/services.dart';

class ProductDataSourceImpl implements ProductDataSource {
  @override
  Future<List<ProductDto>> fetchProducts() async {
    try {
      final csv = await rootBundle.loadString('assets/data.csv');
      // csv내에서 줄바꿈을 기준으로 리스트 변환 및 상품 정보만 잘라내기
      final lines = LineSplitter().convert(csv).sublist(2);

      return lines.map((e) {
        final list = _splitByComma(e);

        return ProductDto.fromJson({
          'id': list[0],
          'imageName': list[1],
          'productName': list[2],
          'productContent': list[3],
          'seller': list[4],
          'price': list[5],
          'address': list[6],
          'favorite': int.parse(list[7]),
          'chat': int.parse(list[8]),
        });
      }).toList();
    } catch (e) {
      throw Exception('데이터를 불러 올 수 없습니다.\n다시 시작해주세요.');
    }
  }

  @override
  Future<void> updateFavorite(String id) async {}

  /// 큰 따옴표 외부에 있는 쉼표를 기준으로 split
  List<String> _splitByComma(String line) {
    List<String> result = [];
    StringBuffer text = StringBuffer();
    // true는 큰 따옴표 시작, false는 큰 따옴표 끝
    bool inDoubleQuote = false;

    for (int i = 0; i < line.length; i++) {
      String char = line[i];

      if (char == '"') {
        inDoubleQuote = !inDoubleQuote;
      } else if (char == ',' && inDoubleQuote == false) {
        // 큰 따옴표 밖에 있는 쉼표일 경우 저장된 텍스트를 리스트에 추가
        result.add(
          text
              .toString()
              .replaceAll(RegExp(r'\\n\s*\+\s*'), '\n') // "\n + " → 줄바꿈
              .replaceAll(RegExp(r'\s*\+\s*'), '') // " + " → 제거
              .replaceAll('\\n', '\n') // "\n" → 실제 줄바꿈
              .trim(),
        );

        text.clear();
      } else {
        text.write(char);
      }
    }

    // 마지막 문자까지 쉼표가 없을 경우, 저장된 텍스트를 리스트에 추가
    result.add(
      text
          .toString()
          .replaceAll(RegExp(r'\\n\s*\+\s*'), '\n') // "\n + " 형태를 줄바꿈 \n으로 대체
          .replaceAll(RegExp(r'\s*\+\s*'), '') // " + " 형태를 제거
          .replaceAll('\\n', '\n') // 문자\n을 줄바꿈\n으로 대체
          .trim(),
    );
    return result;
  }
}
