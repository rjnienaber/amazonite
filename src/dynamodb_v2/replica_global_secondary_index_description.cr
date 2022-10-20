module Amazonite::DynamoDBv2
  class ReplicaGlobalSecondaryIndexDescription
    include JSON::Serializable

    @[JSON::Field(key: "IndexName")]
    property index_name : String | Nil

    @[JSON::Field(key: "ProvisionedThroughputOverride")]
    property provisioned_throughput_override : ProvisionedThroughputOverride | Nil

    def initialize(
      @index_name : String | Nil = nil,
      @provisioned_throughput_override : ProvisionedThroughputOverride | Nil = nil
    )
    end
  end
end
