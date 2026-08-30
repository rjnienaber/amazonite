private alias Core = Amazonite::Core

module Amazonite::CloudWatchLogsV1
  class CancelImportTaskRequest
    include JSON::Serializable

    # The ID of the import task to cancel.
    @[JSON::Field(key: "importId")]
    property import_id : String

    def initialize(
      @import_id : String,
    )
    end

    def validate! : Nil
      if value = @import_id
        raise Core::ValidationError.new("importId length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("importId length must be <= 256") if value.size > 256
        raise Core::ValidationError.new("importId does not match the required pattern") unless value.matches?(Regex.new("^[\\-a-zA-Z0-9]+$"))
      end
    end

    def_equals_and_hash(@import_id)
  end
end
