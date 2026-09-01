private alias ACWL = Amazonite::CloudWatchLogs
private alias Core = Amazonite::Core

module Amazonite::CloudWatchLogs
  # This structure contains information about the status of an OpenSearch Service resource.
  class OpenSearchResourceStatus
    include JSON::Serializable

    # The current status of this resource.
    @[JSON::Field(key: "status", converter: ACWL::OpenSearchResourceStatusType)]
    property status : OpenSearchResourceStatusType | Nil

    # A message with additional information about the status of this resource.
    @[JSON::Field(key: "statusMessage")]
    property status_message : String | Nil

    def initialize(
      @status : OpenSearchResourceStatusType | Nil = nil,
      @status_message : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @status_message
        raise Core::ValidationError.new("statusMessage length must be >= 1") if value.size < 1
      end
    end

    def_equals_and_hash(@status, @status_message)
  end
end
