private alias Core = Amazonite::Core

module Amazonite::CloudWatchLogs
  # A stream of structured log data returned by the GetLogObject operation. This stream contains log
  # events with their associated metadata and extracted fields.
  class GetLogObjectResponseStream
    include JSON::Serializable

    @[JSON::Field(key: "fields")]
    property fields : FieldsData | Nil

    def initialize(
      @fields : FieldsData | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @fields
        value.validate!
      end
    end

    def_equals_and_hash(@fields)
  end
end
