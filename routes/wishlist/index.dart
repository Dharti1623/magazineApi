import 'package:dart_frog/dart_frog.dart';
import 'package:magazine_api/source/wishlist_data_source.dart';

Future<Response> onRequest(RequestContext context) async {
  final dataRepository = context.read<WishlistDataSource>();
  final request = context.request;
  switch (request.method) {
    case HttpMethod.put:
    case HttpMethod.delete:
    case HttpMethod.head:
    case HttpMethod.options:
    case HttpMethod.patch:
      return Response.json(body: {'message': 'Method not found'});
    case HttpMethod.post:
      List keys = [];
      List values = [];
      final data = await context.request.json();
      data.forEach((key, value) {
        keys.add(key);
        values.add(value);
      });
      final result = await dataRepository.insertWishlist(keys,values);
      return Response.json(body: {'message' : result});
    case HttpMethod.get:
      final result = await dataRepository.getWishlists();
      return Response.json(body: {'data': result});
  }
}
