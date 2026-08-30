module Amazonite::CloudWatchLogsV1
  class DisassociateSourceFromS3TableIntegrationResponse
    include JSON::Serializable

    # The unique identifier of the association that was removed.
    @[JSON::Field(key: "identifier")]
    property identifier : String | Nil

    def initialize(
      @identifier : String | Nil = nil,
    )
    end

    def_equals_and_hash(@identifier)
  end
end
