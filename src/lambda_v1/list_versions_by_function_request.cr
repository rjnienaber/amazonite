module Amazonite::LambdaV1
  class ListVersionsByFunctionRequest
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

    # Specify the pagination token that's returned by a previous request to retrieve the next page of
    # results.
    @[JSON::Field(key: "Marker", ignore: true)]
    property marker : String | Nil

    # The maximum number of versions to return. Note that `ListVersionsByFunction` returns a maximum
    # of 50 items in each response, even if you set the number higher.
    @[JSON::Field(key: "MaxItems", ignore: true)]
    property max_items : Int32 | Nil

    def initialize(
      @function_name : String,
      @marker : String | Nil = nil,
      @max_items : Int32 | Nil = nil,
    )
    end

    def_equals_and_hash(@function_name, @marker, @max_items)
  end
end
