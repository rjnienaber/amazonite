module Amazonite::SsmV1
  class GetParametersResult
    include JSON::Serializable

    @[JSON::Field(key: "Parameters")]
    property parameters : Array(Parameter) | Nil

    @[JSON::Field(key: "InvalidParameters")]
    property invalid_parameters : Array(String) | Nil

    def initialize(
      @parameters : Array(Parameter) | Nil = nil,
      @invalid_parameters : Array(String) | Nil = nil
    )
    end
  end
end
