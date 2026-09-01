private alias Core = Amazonite::Core

module Amazonite::Ssm
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

    def validate! : Nil
      if value = @parameters
        value.each(&.validate!)
      end

      if value = @invalid_parameters
        raise Core::ValidationError.new("InvalidParameters must have at least 1 item(s)") if value.size < 1
        raise Core::ValidationError.new("InvalidParameters must have at most 10 item(s)") if value.size > 10
      end
    end

    def_equals_and_hash(@parameters, @invalid_parameters)
  end
end
