import 'package:gql/ast.dart';
import 'package:gql/language.dart';

const _getCustomerQuery = r'''
query getCustomer{
  getCostumers {
    edges {
      _id
      firstName
      lastName
      dni
      address
      totalVisits
      created
      updated
    }
    pageInfo {
      page
      pages
      shown
      total
      overall
      split
    }
  }
}
''';

DocumentNode getCustomers = parseString(_getCustomerQuery);
