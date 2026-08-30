module Amazonite::SsmV1
  class GetParametersResult
    include JSON::Serializable

    # A list of details for a parameter.
    @[JSON::Field(key: "Parameters")]
    property parameters : Array(Parameter) | Nil

    # A list of parameters that aren't formatted correctly or don't run during an execution.
    @[JSON::Field(key: "InvalidParameters")]
    property invalid_parameters : Array(String) | Nil

    def initialize(
      @parameters : Array(Parameter) | Nil = nil,
      @invalid_parameters : Array(String) | Nil = nil,
    )
    end

    def_equals_and_hash(@parameters, @invalid_parameters)
  end
end
