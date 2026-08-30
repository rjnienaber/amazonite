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

    def_equals_and_hash(@uuid)
  end
end
