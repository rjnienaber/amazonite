private alias Core = Amazonite::Core

module Amazonite::Lambda
  class ListAliasesRequest
    include JSON::Serializable

    # The name or ARN of the Lambda function.
    #
    # **Name formats**
    #
    # - **Function name** - `MyFunction`.
    #
    # - **Function ARN** - `arn:aws:lambda:us-west-2:123456789012:function:MyFunction`.
    #
    # - **Partial ARN** - `123456789012:function:MyFunction`.
    #
    # The length constraint applies only to the full ARN. If you specify only the function name, it is
    # limited to 64 characters in length.
    @[JSON::Field(key: "FunctionName", ignore: true)]
    property function_name : String = ""

    # Specify a function version to only list aliases that invoke that version.
    @[JSON::Field(key: "FunctionVersion", ignore: true)]
    property function_version : String | Nil

    # Specify the pagination token that's returned by a previous request to retrieve the next page of
    # results.
    @[JSON::Field(key: "Marker", ignore: true)]
    property marker : String | Nil

    # Limit the number of aliases returned.
    @[JSON::Field(key: "MaxItems", ignore: true)]
    property max_items : Int32 | Nil

    def initialize(
      @function_name : String,
      @function_version : String | Nil = nil,
      @marker : String | Nil = nil,
      @max_items : Int32 | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @function_name
        raise Core::ValidationError.new("FunctionName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("FunctionName length must be <= 140") if value.size > 140
        raise Core::ValidationError.new("FunctionName does not match the required pattern") unless value.matches?(Regex.new("^(arn:(aws[a-zA-Z-]*)?:lambda:)?((eusc-)?[a-z]{2}((-gov)|(-iso([a-z]?)))?-[a-z]+-\\d{1}:)?(\\d{12}:)?(function:)?([a-zA-Z0-9-_]+)(:(\\$LATEST|[a-zA-Z0-9-_]+))?$"))
      end

      if value = @function_version
        raise Core::ValidationError.new("FunctionVersion length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("FunctionVersion length must be <= 1024") if value.size > 1024
        raise Core::ValidationError.new("FunctionVersion does not match the required pattern") unless value.matches?(Regex.new("^(\\$LATEST(\\.PUBLISHED)?|[0-9]+)$"))
      end

      if value = @max_items
        raise Core::ValidationError.new("MaxItems value must be >= 1") if value < 1
        raise Core::ValidationError.new("MaxItems value must be <= 10000") if value > 10000
      end
    end

    def_equals_and_hash(@function_name, @function_version, @marker, @max_items)
  end
end
