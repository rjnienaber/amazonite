private alias Core = Amazonite::Core

module Amazonite::EventBridgeV1
  # Contains the GraphQL operation to be parsed and executed, if the event target is an AppSync API.
  class AppSyncParameters
    include JSON::Serializable

    # The GraphQL operation; that is, the query, mutation, or subscription to be parsed and executed
    # by the GraphQL service.
    #
    # For more information, see
    # [Operations](https://docs.aws.amazon.com/appsync/latest/devguide/graphql-architecture.html#graphql-operations)
    # in the *AppSync User Guide*.
    @[JSON::Field(key: "GraphQLOperation")]
    property graph_ql_operation : String | Nil

    def initialize(
      @graph_ql_operation : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @graph_ql_operation
        raise Core::ValidationError.new("GraphQLOperation length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("GraphQLOperation length must be <= 1048576") if value.size > 1048576
      end
    end

    def_equals_and_hash(@graph_ql_operation)
  end
end
