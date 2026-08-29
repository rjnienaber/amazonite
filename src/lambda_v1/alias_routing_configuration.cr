module Amazonite::LambdaV1
  class AliasRoutingConfiguration
    include JSON::Serializable

    @[JSON::Field(key: "AdditionalVersionWeights")]
    property additional_version_weights : Hash(String, Float64) | Nil

    def initialize(
      @additional_version_weights : Hash(String, Float64) | Nil = nil,
    )
    end
  end
end
