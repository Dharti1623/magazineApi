import 'package:dart_frog/dart_frog.dart';
import 'package:magazine_api/source/user_data_source.dart';

Future<Response> onRequest(RequestContext context,String id) async {
  final dataRepository = context.read<UserDataSource>();
  final request = context.request;
  switch (request.method) {
    case HttpMethod.post:
    case HttpMethod.head:
    case HttpMethod.options:
    case HttpMethod.patch:
      return Response.json(body: {'message': 'Method not found'});
    case HttpMethod.put:
      List values = [];
      final data = await context.request.json();
      data.forEach((key, value) {
        values.add('$key="$value"');
      });
      final result = await dataRepository.updateUser(values,id);
      return Response.json(body: {'message' : result});
    case HttpMethod.delete:
      final result = await dataRepository.deleteUser(id);
      return Response.json(body: {'message': result});
    case HttpMethod.get:
      final result = await dataRepository.getUser(id);
      return Response.json(body: {'data': result});
  }
}
