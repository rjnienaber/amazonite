private alias Core = Amazonite::Core

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

    def validate! : Nil
      if value = @archive_name
        raise Core::ValidationError.new("ArchiveName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("ArchiveName length must be <= 48") if value.size > 48
        raise Core::ValidationError.new("ArchiveName does not match the required pattern") unless value.matches?(Regex.new("^[\\.\\-_A-Za-z0-9]+$"))
      end
    end

    def_equals_and_hash(@archive_name)
  end
end
