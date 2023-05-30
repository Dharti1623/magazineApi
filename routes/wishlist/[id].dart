import 'package:dart_frog/dart_frog.dart';
import 'package:magazine_api/source/wishlist_data_source.dart';

Future<Response> onRequest(RequestContext context,String id) async {
  final dataRepository = context.read<WishlistDataSource>();
  final request = context.request;
  switch (request.method) {
    case HttpMethod.post:
    case HttpMethod.head:
    case HttpMethod.options:
    case HttpMethod.patch:
    case HttpMethod.put:
      return Response.json(body: {'message': 'Method not found'});
    case HttpMethod.delete:
      final result = await dataRepository.deleteWishlist(id);
      return Response.json(body: {'message': result});
    case HttpMethod.get:
      final result = await dataRepository.getWishlistByUser(id);
      return Response.json(body: {'data': result});
  }
}
