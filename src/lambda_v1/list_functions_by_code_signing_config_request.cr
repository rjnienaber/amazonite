module Amazonite::LambdaV1
  class ListFunctionsByCodeSigningConfigRequest
    include JSON::Serializable

    # The The Amazon Resource Name (ARN) of the code signing configuration.
    @[JSON::Field(key: "CodeSigningConfigArn", ignore: true)]
    property code_signing_config_arn : String = ""

    # Specify the pagination token that's returned by a previous request to retrieve the next page of
    # results.
    @[JSON::Field(key: "Marker", ignore: true)]
    property marker : String | Nil

    # Maximum number of items to return.
    @[JSON::Field(key: "MaxItems", ignore: true)]
    property max_items : Int32 | Nil

    def initialize(
      @code_signing_config_arn : String,
      @marker : String | Nil = nil,
      @max_items : Int32 | Nil = nil,
    )
    end

    def_equals_and_hash(@code_signing_config_arn, @marker, @max_items)
  end
end
