module Amazonite::KinesisV1
  class DescribeLimitsOutput
    include JSON::Serializable

    # The maximum number of shards.
    @[JSON::Field(key: "ShardLimit")]
    property shard_limit : Int32

    # The number of open shards.
    @[JSON::Field(key: "OpenShardCount")]
    property open_shard_count : Int32

    # Indicates the number of data streams with the on-demand capacity mode.
    @[JSON::Field(key: "OnDemandStreamCount")]
    property on_demand_stream_count : Int32

    # The maximum number of data streams with the on-demand capacity mode.
    @[JSON::Field(key: "OnDemandStreamCountLimit")]
    property on_demand_stream_count_limit : Int32

    def initialize(
      @shard_limit : Int32,
      @open_shard_count : Int32,
      @on_demand_stream_count : Int32,
      @on_demand_stream_count_limit : Int32,
    )
    end
  end
end
