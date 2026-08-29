private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  class PutParameterResult
    include JSON::Serializable

    # The new version number of a parameter. If you edit a parameter value, Parameter Store
    # automatically creates a new version and assigns this new version a unique ID. You can reference
    # a parameter version ID in API operations or in Systems Manager documents (SSM documents). By
    # default, if you don't specify a specific version, the system returns the latest parameter value
    # when a parameter is called.
    @[JSON::Field(key: "Version")]
    property version : Int64 | Nil

    # The tier assigned to the parameter.
    @[JSON::Field(key: "Tier", converter: AS::ParameterTier)]
    property tier : ParameterTier | Nil

    def initialize(
      @version : Int64 | Nil = nil,
      @tier : ParameterTier | Nil = nil,
    )
    end
  end
end
