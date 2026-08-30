private alias Core = Amazonite::Core

module Amazonite::CloudWatchLogsV1
  # Statistics about the import progress
  class ImportStatistics
    include JSON::Serializable

    # The total number of bytes that have been imported to the managed log group.
    @[JSON::Field(key: "bytesImported")]
    property bytes_imported : Int64 | Nil

    def initialize(
      @bytes_imported : Int64 | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @bytes_imported
        raise Core::ValidationError.new("bytesImported value must be >= 0") if value < 0
      end
    end

    def_equals_and_hash(@bytes_imported)
  end
end
