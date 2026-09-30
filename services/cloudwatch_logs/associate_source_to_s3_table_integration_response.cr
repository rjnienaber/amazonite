private alias Core = Amazonite::Core

module Amazonite::CloudWatchLogs
  class AssociateSourceToS3TableIntegrationResponse
    include JSON::Serializable

    # The unique identifier for the association between the data source and S3 Table Integration.
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
