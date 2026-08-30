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

    def_equals_and_hash(@layer_name, @layer_arn, @latest_matching_version)
  end
end
