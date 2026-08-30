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

    def_equals_and_hash(@import_id)
  end
end
