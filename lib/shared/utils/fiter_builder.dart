import 'dart:convert';

class FilterBuilder {
  List query = [];

  /// Add Condition with conjunction AND
  FilterBuilder where(data) {
    if (query.isNotEmpty) {
      query.add("AND");
    }
    query.add(data);
    return this;
  }

  /// Add Condition with conjunction OR
  FilterBuilder orWhere(data) {
    if (query.isNotEmpty) {
      query.add("OR");
    }
    query.add(data);
    return this;
  }

  String build() {
    List params = [];
    for (var item in query) {
      if (item is FilterData) {
        params.add(item());
        continue;
      }

      if (item is FilterGroup) {
        params.add(item());
        continue;
      }

      if (item is String) {
        params.add(item);
        continue;
      }

      throw Exception("Bad Params On Filter");
    }
    return jsonEncode(params);
  }
}

class FilterData {
  String key;
  String conjunction;
  dynamic value;

  FilterData(
    this.key,
    this.value, {
    this.conjunction = "=",
  });

  List call() => [key, conjunction, value];
}

class FilterGroup {
  List filters;
  String conjunction;

  FilterGroup(this.filters, this.conjunction);

  factory FilterGroup.and(List<FilterData> data) => FilterGroup(data, "AND");
  factory FilterGroup.or(List<FilterData> data) => FilterGroup(data, "or");

  List call() {
    List builds = [];
    for (var item in filters) {
      if (builds.isNotEmpty) {
        builds.add(conjunction);
      }
      builds.add(item());
    }

    return builds;
  }
}
