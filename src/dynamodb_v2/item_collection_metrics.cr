module Amazonite::DynamoDBv2
  class ItemCollectionMetrics
    include JSON::Serializable

    @[JSON::Field(key: "ItemCollectionKey")]
    property item_collection_key : Hash(String, AttributeValue) | Nil

    @[JSON::Field(key: "SizeEstimateRangeGB")]
    property size_estimate_range_gb : Array(Float64) | Nil

    def initialize(
      @item_collection_key : Hash(String, AttributeValue) | Nil = nil,
      @size_estimate_range_gb : Array(Float64) | Nil = nil
    )
    end
  end
end