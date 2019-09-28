import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class DefaultLayout extends StatelessWidget {
  static final HttpLink httpLink = HttpLink(
    uri: 'http://192.168.4.83:5000/graphql',
  );

  static final token =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI1ZDgwNDZiZDMxYzQ1OWRjYTU5ZjBlZmEiLCJlbWFpbCI6InRlYWNoZXIxQGdtYWlsLmNvbSIsImlhdCI6MTU2OTY1MjA1MSwiZXhwIjoxNTY5NzM4NDUxfQ.TAp74WjlgICs9e6NrjuqQPTDBDPS6FMmNeMYZuWm3yE';

  static final AuthLink authLink = AuthLink(
    getToken: () async => "Bearer $token",
  );

  final Link link = authLink.concat(httpLink);

  final Widget child;
  DefaultLayout({this.child});
  @override
  Widget build(BuildContext context) {
    ValueNotifier<GraphQLClient> client = ValueNotifier(
      GraphQLClient(
        cache: InMemoryCache(),
        link: link,
      ),
    );
    return GraphQLProvider(
        client: client,
        child: Scaffold(
            backgroundColor: Color.fromRGBO(0, 61, 80, 1.0),
            appBar: AppBar(
              title: Text("唯新在线"),
            ),
            // backgroundColor: Color.fromRGBO(0, 61, 80, 1.0),
            body: Container(padding: EdgeInsets.all(10), child: child)));
  }
}
