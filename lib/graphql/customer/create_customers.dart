import 'package:gql/ast.dart';
import 'package:gql/language.dart';

const _createCustomerQuery =
    r'''mutation createCustomer (\$customer: CreateCostumer) {
  createCostumer(input: \$customer) {
    firstName
    lastName
    dni
    address
    totalVisits
    created
    updated
  }
}''';

DocumentNode createCustomerMutation = parseString(_createCustomerQuery);
