import 'package:gql/ast.dart';
import 'package:gql/language.dart';

const _updateCustomerQuery =
    r'''mutation updateCustomer(\$upCustomer:UpdateCostumer) {
  updateCostumer(input: \$upCustomer) {
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

DocumentNode updateCustomerMutation = parseString(_updateCustomerQuery);
