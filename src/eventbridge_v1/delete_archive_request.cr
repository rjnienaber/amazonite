module Amazonite::EventBridgeV1
  class DeleteArchiveRequest
    include JSON::Serializable

    # The name of the archive to delete.
    @[JSON::Field(key: "ArchiveName")]
    property archive_name : String

    def initialize(
      @archive_name : String,
    )
    end
  end
end
