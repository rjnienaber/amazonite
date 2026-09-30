private alias Core = Amazonite::Core

module Amazonite::CloudWatchLogs
  class DeleteScheduledQueryRequest
    include JSON::Serializable

    # The ARN or name of the scheduled query to delete.
    @[JSON::Field(key: "identifier")]
    property identifier : String

    def initialize(
      @identifier : String,
    )
    end

    def validate! : Nil
      if value = @identifier
        raise Core::ValidationError.new("identifier length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("identifier length must be <= 300") if value.size > 300
      end
    end

    def_equals_and_hash(@identifier)
  end
end
