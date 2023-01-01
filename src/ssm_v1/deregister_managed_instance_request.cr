module Amazonite::SsmV1
  class DeregisterManagedInstanceRequest
    include JSON::Serializable

    @[JSON::Field(key: "InstanceId")]
    property instance_id : String

    def initialize(
      @instance_id : String
    )
    end
  end
end
