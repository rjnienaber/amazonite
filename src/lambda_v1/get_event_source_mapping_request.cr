private alias Core = Amazonite::Core

module Amazonite::LambdaV1
  class GetEventSourceMappingRequest
    include JSON::Serializable

    # The identifier of the event source mapping.
    @[JSON::Field(key: "UUID", ignore: true)]
    property uuid : String = ""

    def initialize(
      @uuid : String,
    )
    end

    def validate! : Nil
      if value = @uuid
        raise Core::ValidationError.new("UUID length must be >= 36") if value.size < 36
        raise Core::ValidationError.new("UUID length must be <= 36") if value.size > 36
      end
    end

    def_equals_and_hash(@uuid)
  end
end
