module Amazonite::SsmV1
  class GetConnectionStatusRequest
    include JSON::Serializable

    # The managed node ID.
    @[JSON::Field(key: "Target")]
    property target : String

    def initialize(
      @target : String,
    )
    end
  end
end
