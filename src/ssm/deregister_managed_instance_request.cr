private alias Core = Amazonite::Core

module Amazonite::Ssm
  class DeregisterManagedInstanceRequest
    include JSON::Serializable

    # The ID assigned to the managed node when you registered it using the activation process.
    @[JSON::Field(key: "InstanceId")]
    property instance_id : String

    def initialize(
      @instance_id : String,
    )
    end

    def validate! : Nil
      if value = @instance_id
        raise Core::ValidationError.new("InstanceId length must be >= 20") if value.size < 20
        raise Core::ValidationError.new("InstanceId length must be <= 124") if value.size > 124
        raise Core::ValidationError.new("InstanceId does not match the required pattern") unless value.matches?(Regex.new("^(^mi-[0-9a-f]{17}$)|(^eks_c:[0-9A-Za-z][A-Za-z0-9\\-_]{0,99}_\\w{17}$)$"))
      end
    end

    def_equals_and_hash(@instance_id)
  end
end
