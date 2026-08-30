private alias Core = Amazonite::Core

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

    def validate! : Nil
      if value = @code_signing_config_arn
        raise Core::ValidationError.new("CodeSigningConfigArn length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("CodeSigningConfigArn length must be <= 200") if value.size > 200
        raise Core::ValidationError.new("CodeSigningConfigArn does not match the required pattern") unless value.matches?(Regex.new("^arn:(aws[a-zA-Z-]*)?:lambda:(eusc-)?[a-z]{2}((-gov)|(-iso([a-z]?)))?-[a-z]+-\\d{1}:\\d{12}:code-signing-config:csc-[a-z0-9]{17}$"))
      end

      if value = @max_items
        raise Core::ValidationError.new("MaxItems value must be >= 1") if value < 1
        raise Core::ValidationError.new("MaxItems value must be <= 10000") if value > 10000
      end
    end

    def_equals_and_hash(@code_signing_config_arn, @marker, @max_items)
  end
end
