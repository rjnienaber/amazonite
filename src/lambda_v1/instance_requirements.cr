private alias AL = Amazonite::LambdaV1
private alias Core = Amazonite::Core

module Amazonite::LambdaV1
  # Specifications that define the characteristics and constraints for compute instances used by the
  # capacity provider.
  class InstanceRequirements
    include JSON::Serializable

    # A list of supported CPU architectures for compute instances. Valid values include `x86_64` and
    # `arm64`.
    @[JSON::Field(key: "Architectures", converter: Core::ArrayConverter(AL::Architecture))]
    property architectures : Array(Architecture) | Nil

    # A list of EC2 instance types that the capacity provider is allowed to use. If not specified, all
    # compatible instance types are allowed.
    @[JSON::Field(key: "AllowedInstanceTypes")]
    property allowed_instance_types : Array(String) | Nil

    # A list of EC2 instance types that the capacity provider should not use, even if they meet other
    # requirements.
    @[JSON::Field(key: "ExcludedInstanceTypes")]
    property excluded_instance_types : Array(String) | Nil

    def initialize(
      @architectures : Array(Architecture) | Nil = nil,
      @allowed_instance_types : Array(String) | Nil = nil,
      @excluded_instance_types : Array(String) | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @architectures
        raise Core::ValidationError.new("Architectures must have at least 1 item(s)") if value.size < 1
        raise Core::ValidationError.new("Architectures must have at most 1 item(s)") if value.size > 1
      end

      if value = @allowed_instance_types
        raise Core::ValidationError.new("AllowedInstanceTypes must have at least 0 item(s)") if value.size < 0
        raise Core::ValidationError.new("AllowedInstanceTypes must have at most 400 item(s)") if value.size > 400
      end

      if value = @excluded_instance_types
        raise Core::ValidationError.new("ExcludedInstanceTypes must have at least 0 item(s)") if value.size < 0
        raise Core::ValidationError.new("ExcludedInstanceTypes must have at most 400 item(s)") if value.size > 400
      end
    end

    def_equals_and_hash(@architectures, @allowed_instance_types, @excluded_instance_types)
  end
end
