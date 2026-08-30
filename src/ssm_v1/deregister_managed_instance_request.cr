module Amazonite::SsmV1
  class DeregisterManagedInstanceRequest
    include JSON::Serializable

    # The ID assigned to the managed node when you registered it using the activation process.
    @[JSON::Field(key: "InstanceId")]
    property instance_id : String

    def initialize(
      @instance_id : String,
    )
    end

    def_equals_and_hash(@instance_id)
  end
end
