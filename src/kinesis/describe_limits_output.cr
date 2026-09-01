private alias Core = Amazonite::Core

module Amazonite::Kinesis
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

    def validate! : Nil
      if value = @shard_limit
        raise Core::ValidationError.new("ShardLimit value must be >= 0") if value < 0
        raise Core::ValidationError.new("ShardLimit value must be <= 1000000") if value > 1000000
      end

      if value = @open_shard_count
        raise Core::ValidationError.new("OpenShardCount value must be >= 0") if value < 0
        raise Core::ValidationError.new("OpenShardCount value must be <= 1000000") if value > 1000000
      end

      if value = @on_demand_stream_count
        raise Core::ValidationError.new("OnDemandStreamCount value must be >= 0") if value < 0
        raise Core::ValidationError.new("OnDemandStreamCount value must be <= 1000000") if value > 1000000
      end

      if value = @on_demand_stream_count_limit
        raise Core::ValidationError.new("OnDemandStreamCountLimit value must be >= 0") if value < 0
        raise Core::ValidationError.new("OnDemandStreamCountLimit value must be <= 1000000") if value > 1000000
      end
    end

    def_equals_and_hash(@shard_limit, @open_shard_count, @on_demand_stream_count, @on_demand_stream_count_limit)
  end
end
