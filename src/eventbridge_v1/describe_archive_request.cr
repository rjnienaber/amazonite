module Amazonite::EventBridgeV1
  class DescribeArchiveRequest
    include JSON::Serializable

    # The name of the archive to retrieve.
    @[JSON::Field(key: "ArchiveName")]
    property archive_name : String

    def initialize(
      @archive_name : String,
    )
    end

    def_equals_and_hash(@archive_name)
  end
end
