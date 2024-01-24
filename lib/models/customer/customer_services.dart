import 'dart:developer';
import 'package:flutter_data_base_aplication/graphql/customer/get_customers.dart';
import 'package:flutter_data_base_aplication/models/graphql_config.dart';

import 'package:flutter_data_base_aplication/models/customer/customer_model.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class GraphQLCustomerModel {
  static GraphQLConfig graphQLConfig = GraphQLConfig();
  GraphQLClient client = graphQLConfig.clientToQuery();
  CustomerModel customerModel = CustomerModel();

  Future<List<CustomerModel>> getCustomersIn() async {
    try {
      QueryResult result = await client.query(QueryOptions(
          fetchPolicy: FetchPolicy.noCache, document: getCustomers));

      if (result.hasException) {
        throw Exception(result.exception);
      }

      List? res = result.data?['getCostumers']['edges'];

      inspect(res);

      inspect(res);

      if (res == null || res.isEmpty) {
        return [];
      }

      List<CustomerModel> registredCustomers = res.map((customers) {
        return CustomerModel.fromMap(dataMap: customers);
      }).toList();

      return registredCustomers;
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<bool> createCustomer(
      {required String firstname,
      required String lastName,
      required int dni,
      required String address}) async {
    try {
      QueryResult result = await client.mutate(MutationOptions(
          fetchPolicy: FetchPolicy.noCache,
          document:
              gql("""mutation createCustomer (\$customer: CreateCostumer) {
  createCostumer(input: \$customer) {
    firstName
    lastName
    dni
    address
    totalVisits
    created
    updated
  }
}"""),
          variables: {
            "customer": {
              "firstName": firstname,
              "lastName": lastName,
              "dni": dni,
              "address": address
            }
          }));

      if (result.hasException) {
        throw Exception(result.exception);
      } else {
        return true;
      }
    } catch (error) {
      return false;
    }
  }

  Future<bool> deleteCustomer({required String id}) async {
    try {
      QueryResult result = await client.mutate(MutationOptions(
          fetchPolicy: FetchPolicy.noCache,
          document: gql("""mutation deleteCostumer(\$costumerID: ID!) {
  deleteCostumer(_id: \$costumerID) {
    _id
    firstName
    lastName
    dni
    address
    totalVisits
    created
    updated
  }
}"""),
          variables: {"costumerID": id}));
      inspect(result);

      if (result.hasException) {
        throw Exception(result.exception);
      } else {
        return true;
      }
    } catch (error) {
      return false;
    }
  }

  Future<bool> updateCustomer({required Map input}) async {
    try {
      QueryResult result = await client.mutate(MutationOptions(
          fetchPolicy: FetchPolicy.noCache,
          document:
              gql("""mutation updateCustomer(\$upCustomer:UpdateCostumer) {
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
}
"""),
          variables: {"upCustomer": input}));
      inspect(input);
      if (result.hasException) {
        throw Exception(result.exception);
      } else {
        return true;
      }
    } catch (error) {
      return false;
    }
  }
}
