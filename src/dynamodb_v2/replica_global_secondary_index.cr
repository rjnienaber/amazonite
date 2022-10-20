module Amazonite::DynamoDBv2
  class ReplicaGlobalSecondaryIndex
    include JSON::Serializable

    @[JSON::Field(key: "IndexName")]
    property index_name : String

    @[JSON::Field(key: "ProvisionedThroughputOverride")]
    property provisioned_throughput_override : ProvisionedThroughputOverride | Nil

    def initialize(
      @index_name : String,
      @provisioned_throughput_override : ProvisionedThroughputOverride | Nil = nil
    )
    end
  end
end
