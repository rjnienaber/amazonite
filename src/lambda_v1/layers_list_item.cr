module Amazonite::LambdaV1
  class LayersListItem
    include JSON::Serializable

    @[JSON::Field(key: "LayerName")]
    property layer_name : String | Nil

    @[JSON::Field(key: "LayerArn")]
    property layer_arn : String | Nil

    @[JSON::Field(key: "LatestMatchingVersion")]
    property latest_matching_version : LayerVersionsListItem | Nil

    def initialize(
      @layer_name : String | Nil = nil,
      @layer_arn : String | Nil = nil,
      @latest_matching_version : LayerVersionsListItem | Nil = nil,
    )
    end
  end
end
