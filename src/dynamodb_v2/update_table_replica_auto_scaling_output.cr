private alias Core = Amazonite::Core

module Amazonite::DynamoDBV2
  class UpdateTableReplicaAutoScalingOutput
    include JSON::Serializable

    # Returns information about the auto scaling settings of a table with replicas.
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
