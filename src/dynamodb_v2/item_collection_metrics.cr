module Amazonite::DynamoDBV2
  # Information about item collections, if any, that were affected by the operation.
  # `ItemCollectionMetrics` is only returned if the request asked for it. If the table does not have
  # any local secondary indexes, this information is not returned in the response.
  class ItemCollectionMetrics
    include JSON::Serializable

    # The partition key value of the item collection. This value is the same as the partition key
    # value of the item.
    @[JSON::Field(key: "ItemCollectionKey")]
    property item_collection_key : Hash(String, AttributeValue) | Nil

    # An estimate of item collection size, in gigabytes. This value is a two-element array containing
    # a lower bound and an upper bound for the estimate. The estimate includes the size of all the
    # items in the table, plus the size of all attributes projected into all of the local secondary
    # indexes on that table. Use this estimate to measure whether a local secondary index is
    # approaching its size limit.
    #
    # The estimate is subject to change over time; therefore, do not rely on the precision or accuracy
    # of the estimate.
    @[JSON::Field(key: "SizeEstimateRangeGB")]
    property size_estimate_range_gb : Array(Float64) | Nil

    def initialize(
      @item_collection_key : Hash(String, AttributeValue) | Nil = nil,
      @size_estimate_range_gb : Array(Float64) | Nil = nil,
    )
    end
  end
end
