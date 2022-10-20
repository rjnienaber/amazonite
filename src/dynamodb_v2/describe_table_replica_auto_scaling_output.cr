module Amazonite::DynamoDBv2
  class DescribeTableReplicaAutoScalingOutput
    include JSON::Serializable

    @[JSON::Field(key: "TableAutoScalingDescription")]
    property table_auto_scaling_description : TableAutoScalingDescription | Nil

    def initialize(
      @table_auto_scaling_description : TableAutoScalingDescription | Nil = nil
    )
    end
  end
end
