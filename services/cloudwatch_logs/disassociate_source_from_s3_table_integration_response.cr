private alias Core = Amazonite::Core

module Amazonite::CloudWatchLogs
  class DisassociateSourceFromS3TableIntegrationResponse
    include JSON::Serializable

    # The unique identifier of the association that was removed.
    @[JSON::Field(key: "identifier")]
    property identifier : String | Nil

    def initialize(
      @identifier : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @identifier
        raise Core::ValidationError.new("identifier length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("identifier length must be <= 2048") if value.size > 2048
      end
    end

    def_equals_and_hash(@identifier)
  end
end
