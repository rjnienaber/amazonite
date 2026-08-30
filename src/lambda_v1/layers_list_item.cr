private alias Core = Amazonite::Core

module Amazonite::LambdaV1
  # Details about an [Lambda
  # layer](https://docs.aws.amazon.com/lambda/latest/dg/configuration-layers.html).
  class LayersListItem
    include JSON::Serializable

    # The name of the layer.
    @[JSON::Field(key: "LayerName")]
    property layer_name : String | Nil

    # The Amazon Resource Name (ARN) of the function layer.
    @[JSON::Field(key: "LayerArn")]
    property layer_arn : String | Nil

    # The newest version of the layer.
    @[JSON::Field(key: "LatestMatchingVersion")]
    property latest_matching_version : LayerVersionsListItem | Nil

    def initialize(
      @layer_name : String | Nil = nil,
      @layer_arn : String | Nil = nil,
      @latest_matching_version : LayerVersionsListItem | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @layer_name
        raise Core::ValidationError.new("LayerName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("LayerName length must be <= 140") if value.size > 140
        raise Core::ValidationError.new("LayerName does not match the required pattern") unless value.matches?(Regex.new("^(arn:(aws[a-zA-Z-]*)?:lambda:(eusc-)?[a-z]{2}((-gov)|(-iso([a-z]?)))?-[a-z]+-\\d{1}:\\d{12}:layer:[a-zA-Z0-9-_]+)|[a-zA-Z0-9-_]+$"))
      end

      if value = @layer_arn
        raise Core::ValidationError.new("LayerArn length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("LayerArn length must be <= 2048") if value.size > 2048
        raise Core::ValidationError.new("LayerArn does not match the required pattern") unless value.matches?(Regex.new("^arn:(aws[a-zA-Z-]*)?:lambda:(eusc-)?[a-z]{2}((-gov)|(-iso([a-z]?)))?-[a-z]+-\\d{1}:\\d{12}:layer:[a-zA-Z0-9-_]+$"))
      end

      if value = @latest_matching_version
        value.validate!
      end
    end

    def_equals_and_hash(@layer_name, @layer_arn, @latest_matching_version)
  end
end
