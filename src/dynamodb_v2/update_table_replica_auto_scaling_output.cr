module Amazonite::DynamoDBV2
  class UpdateTableReplicaAutoScalingOutput
    include JSON::Serializable

    @[JSON::Field(key: "TableAutoScalingDescription")]
    property table_auto_scaling_description : TableAutoScalingDescription | Nil

    def initialize(
      @table_auto_scaling_description : TableAutoScalingDescription | Nil = nil
    )
    end
  end
end
