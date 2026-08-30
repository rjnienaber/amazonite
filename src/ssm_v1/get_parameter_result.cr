private alias Core = Amazonite::Core

module Amazonite::SsmV1
  class GetParameterResult
    include JSON::Serializable

    # Information about a parameter.
    @[JSON::Field(key: "Parameter")]
    property parameter : Parameter | Nil

    def initialize(
      @parameter : Parameter | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @parameter
        value.validate!
      end
    end

    def_equals_and_hash(@parameter)
  end
end
