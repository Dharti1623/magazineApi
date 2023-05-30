// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, implicit_dynamic_list_literal

import 'dart:io';

import 'package:dart_frog/dart_frog.dart';


import '../routes/index.dart' as index;
import '../routes/wishlist/index.dart' as wishlist_index;
import '../routes/wishlist/[id].dart' as wishlist_$id;
import '../routes/users/index.dart' as users_index;
import '../routes/users/[id].dart' as users_$id;
import '../routes/magazine/index.dart' as magazine_index;
import '../routes/magazine/[id].dart' as magazine_$id;

import '../routes/wishlist/_middleware.dart' as wishlist_middleware;
import '../routes/users/_middleware.dart' as users_middleware;
import '../routes/magazine/_middleware.dart' as magazine_middleware;

void main() async {
  final address = InternetAddress.anyIPv6;
  final port = int.parse(Platform.environment['PORT'] ?? '8080');
  hotReload(() => createServer(address, port));
}

Future<HttpServer> createServer(InternetAddress address, int port) {
  final handler = Cascade().add(buildRootHandler()).handler;
  return serve(handler, address, port);
}

Handler buildRootHandler() {
  final pipeline = const Pipeline();
  final router = Router()
    ..mount('/magazine', (context) => buildMagazineHandler()(context))
    ..mount('/users', (context) => buildUsersHandler()(context))
    ..mount('/wishlist', (context) => buildWishlistHandler()(context))
    ..mount('/', (context) => buildHandler()(context));
  return pipeline.addHandler(router);
}

Handler buildMagazineHandler() {
  final pipeline = const Pipeline().addMiddleware(magazine_middleware.middleware);
  final router = Router()
    ..all('/', (context) => magazine_index.onRequest(context,))..all('/<id>', (context,id,) => magazine_$id.onRequest(context,id,));
  return pipeline.addHandler(router);
}

Handler buildUsersHandler() {
  final pipeline = const Pipeline().addMiddleware(users_middleware.middleware);
  final router = Router()
    ..all('/', (context) => users_index.onRequest(context,))..all('/<id>', (context,id,) => users_$id.onRequest(context,id,));
  return pipeline.addHandler(router);
}

Handler buildWishlistHandler() {
  final pipeline = const Pipeline().addMiddleware(wishlist_middleware.middleware);
  final router = Router()
    ..all('/', (context) => wishlist_index.onRequest(context,))..all('/<id>', (context,id,) => wishlist_$id.onRequest(context,id,));
  return pipeline.addHandler(router);
}

Handler buildHandler() {
  final pipeline = const Pipeline();
  final router = Router()
    ..all('/', (context) => index.onRequest(context,));
  return pipeline.addHandler(router);
}
