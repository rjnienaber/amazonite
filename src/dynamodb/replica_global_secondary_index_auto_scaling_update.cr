private alias Core = Amazonite::Core

module Amazonite::DynamoDB
  # Represents the auto scaling settings of a global secondary index for a replica that will be
  # modified.
  class ReplicaGlobalSecondaryIndexAutoScalingUpdate
    include JSON::Serializable

    # The name of the global secondary index.
    @[JSON::Field(key: "IndexName")]
    property index_name : String | Nil

    @[JSON::Field(key: "ProvisionedReadCapacityAutoScalingUpdate")]
    property provisioned_read_capacity_auto_scaling_update : AutoScalingSettingsUpdate | Nil

    def initialize(
      @index_name : String | Nil = nil,
      @provisioned_read_capacity_auto_scaling_update : AutoScalingSettingsUpdate | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @index_name
        raise Core::ValidationError.new("IndexName length must be >= 3") if value.size < 3
        raise Core::ValidationError.new("IndexName length must be <= 255") if value.size > 255
        raise Core::ValidationError.new("IndexName does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z0-9_.-]+$"))
      end

      if value = @provisioned_read_capacity_auto_scaling_update
        value.validate!
      end
    end

    def_equals_and_hash(@index_name, @provisioned_read_capacity_auto_scaling_update)
  end
end
