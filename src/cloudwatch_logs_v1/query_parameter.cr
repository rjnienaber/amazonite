module Amazonite::CloudWatchLogsV1
  # This structure defines a query parameter for a saved CloudWatch Logs Insights query definition.
  # Query parameters are supported only for Logs Insights QL queries. They are placeholder variables
  # that you can reference in a query string using the `{{parameterName}}` syntax. Each parameter
  # can include a default value and a description.
  class QueryParameter
    include JSON::Serializable

    # The name of the query parameter. A query parameter name must start with a letter or underscore,
    # and contain only letters, digits, and underscores.
    @[JSON::Field(key: "name")]
    property name : String

    # The default value to use for this query parameter if no value is supplied at execution time.
    @[JSON::Field(key: "defaultValue")]
    property default_value : String | Nil

    # A description of the query parameter that explains its purpose or expected values.
    @[JSON::Field(key: "description")]
    property description : String | Nil

    def initialize(
      @name : String,
      @default_value : String | Nil = nil,
      @description : String | Nil = nil,
    )
    end
  end
end
