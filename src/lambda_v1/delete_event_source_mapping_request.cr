module Amazonite::LambdaV1
  class DeleteEventSourceMappingRequest
    include JSON::Serializable

    # The identifier of the event source mapping.
    @[JSON::Field(key: "UUID", ignore: true)]
    property uuid : String = ""

    def initialize(
      @uuid : String,
    )
    end
  end
end
