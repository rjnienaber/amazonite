module Amazonite::SsmV1
  class ResolvedTargets
    include JSON::Serializable

    @[JSON::Field(key: "ParameterValues")]
    property parameter_values : Array(String) | Nil

    @[JSON::Field(key: "Truncated")]
    property truncated : Bool | Nil

    def initialize(
      @parameter_values : Array(String) | Nil = nil,
      @truncated : Bool | Nil = nil
    )
    end
  end
end
