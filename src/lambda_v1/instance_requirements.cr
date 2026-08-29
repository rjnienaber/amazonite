private alias AL = Amazonite::LambdaV1
private alias Core = Amazonite::Core

module Amazonite::LambdaV1
  class InstanceRequirements
    include JSON::Serializable

    @[JSON::Field(key: "Architectures", converter: Core::ArrayConverter(AL::Architecture))]
    property architectures : Array(Architecture) | Nil

    @[JSON::Field(key: "AllowedInstanceTypes")]
    property allowed_instance_types : Array(String) | Nil

    @[JSON::Field(key: "ExcludedInstanceTypes")]
    property excluded_instance_types : Array(String) | Nil

    def initialize(
      @architectures : Array(Architecture) | Nil = nil,
      @allowed_instance_types : Array(String) | Nil = nil,
      @excluded_instance_types : Array(String) | Nil = nil,
    )
    end
  end
end
