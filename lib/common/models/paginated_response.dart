import 'package:equatable/equatable.dart';

typedef FuturePaginatedResponse<T extends Object>
    = Future<PaginatedResponse<T>>;

class PaginatedResponse<T extends Object> extends Equatable {
  static const perPageDefault = 25;
  final List<T> items;
  final PaginationInfo paginationInfo;
  final PaginationLinks paginationLinks;

  const PaginatedResponse({
    required this.items,
    required this.paginationInfo,
    required this.paginationLinks,
  });

  PaginatedResponse<T> copyWith({
    List<T>? items,
    PaginationInfo? paginationInfo,
    PaginationLinks? paginationLinks,
  }) {
    return PaginatedResponse(
      items: items ?? this.items,
      paginationInfo: paginationInfo ?? this.paginationInfo,
      paginationLinks: paginationLinks ?? this.paginationLinks,
    );
  }

  @override
  List<Object?> get props => [items, paginationInfo, paginationLinks];
}

class PaginationInfo extends Equatable {
  final int currentPage, from, lastPage;
  final List<CurrentPageLinks> links;
  final String path;
  final int perPage, to, total;

  const PaginationInfo({
    required this.currentPage,
    required this.from,
    required this.lastPage,
    required this.links,
    required this.path,
    required this.perPage,
    required this.to,
    required this.total,
  });

  factory PaginationInfo.fromMap(Map<String, dynamic> map) {
    return PaginationInfo(
      currentPage: map['current_page'] as int,
      from: map['from'] as int,
      lastPage: map['last_page'] as int,
      links: (map['links'] as List)
          .map((e) => CurrentPageLinks.fromMap(e))
          .toList(),
      path: map['path'] as String,
      perPage: map['per_page'] as int,
      to: map['to'] as int,
      total: map['total'] as int,
    );
  }
  bool get isAtLastPage => currentPage == lastPage;
  @override
  String toString() {
    return 'PaginationInfo{currentPage: $currentPage, from: $from, lastPage: $lastPage, links: $links, path: $path, perPage: $perPage, to: $to, total: $total}';
  }

  @override
  List<Object?> get props =>
      [currentPage, from, to, lastPage, links, path, perPage, total];

  PaginationInfo copyWith({
    int? currentPage,
    int? from,
    int? lastPage,
    List<CurrentPageLinks>? links,
    String? path,
    int? perPage,
    int? to,
    int? total,
  }) {
    return PaginationInfo(
      currentPage: currentPage ?? this.currentPage,
      from: from ?? this.from,
      lastPage: lastPage ?? this.lastPage,
      links: links ?? this.links,
      path: path ?? this.path,
      perPage: perPage ?? this.perPage,
      to: to ?? this.to,
      total: total ?? this.total,
    );
  }
}

class CurrentPageLinks extends Equatable {
  final String? url;
  final String label;
  final bool active;

  const CurrentPageLinks({
    this.url,
    required this.label,
    required this.active,
  });

  factory CurrentPageLinks.fromMap(Map<String, dynamic> map) {
    return CurrentPageLinks(
      url: map['url'] as String?,
      label: map['label'] as String,
      active: map['active'] as bool,
    );
  }

  @override
  List<Object?> get props => [url, label, active];
}

class PaginationLinks extends Equatable {
  final String first, last;
  final String? next, previous;

  const PaginationLinks(
      {required this.first, required this.last, this.next, this.previous});

  factory PaginationLinks.fromMap(Map<String, dynamic> map) {
    return PaginationLinks(
      first: map['first'],
      last: map['last'],
      previous: map['prev'],
      next: map['next'],
    );
  }

  @override
  List<Object?> get props => [first, last, previous, next];

  PaginationLinks copyWith({
    String? first,
    String? last,
    String? next,
    String? previous,
  }) {
    return PaginationLinks(
      first: first ?? this.first,
      last: last ?? this.last,
      next: next ?? this.next,
      previous: previous ?? this.previous,
    );
  }
}
