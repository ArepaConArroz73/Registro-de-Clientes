import 'package:gql/ast.dart';
import 'package:gql/language.dart';

const _deleteCustomersQuery = r'''mutation deleteCostumer($costumerID: ID!) {
  deleteCostumer(_id: $costumerID) {
    _id
    firstName
    lastName
    dni
    address
    totalVisits
    created
    updated
  }
}''';

DocumentNode deleteCustomersMutation = parseString(_deleteCustomersQuery);
