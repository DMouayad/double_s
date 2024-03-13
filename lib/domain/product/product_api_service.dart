import 'package:double_s/common/models/paginated_response.dart';

import 'product.dart';

///
abstract interface class BaseProductApiService {
  FuturePaginatedResponse<Product> fetchAll({
    int page = 1,
    int perPage = PaginatedResponse.perPageDefault,
    List<String> sortedBy = const [],
  });
}
