module Amazonite::LambdaV1
  class GetEventSourceMappingRequest
    include JSON::Serializable

    @[JSON::Field(key: "UUID", ignore: true)]
    property uuid : String = ""

    def initialize(
      @uuid : String,
    )
    end
  end
end
