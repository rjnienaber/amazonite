private alias Core = Amazonite::Core

module Amazonite::DynamoDBV2
  class DescribeTableReplicaAutoScalingOutput
    include JSON::Serializable

    # Represents the auto scaling properties of the table.
    @[JSON::Field(key: "TableAutoScalingDescription")]
    property table_auto_scaling_description : TableAutoScalingDescription | Nil

    def initialize(
      @table_auto_scaling_description : TableAutoScalingDescription | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @table_auto_scaling_description
        value.validate!
      end
    end

    def_equals_and_hash(@table_auto_scaling_description)
  end
end
