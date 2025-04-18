extension ColonSplitter on List<String> {
  List<Map<String, String>> toMapList({String splitter = ':'}) {
    return map((item) {
      final parts = item.split(splitter);
      if (parts.length >= 2) {
        final title = parts[0].trim();
        final description = parts[1].trim();
        return {
          'title': title,
          'description': description,
        };
      } else {
        return {
          'title': item,
          'description': '',
        };
      }
    }).toList();
  }
}
