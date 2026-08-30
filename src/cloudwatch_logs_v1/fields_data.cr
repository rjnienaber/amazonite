private alias Core = Amazonite::Core

module Amazonite::CloudWatchLogsV1
  # A structure containing the extracted fields from a log event. These fields are extracted based
  # on the log format and can be used for structured querying and analysis.
  class FieldsData
    include JSON::Serializable

    # The actual log data content returned in the streaming response. This contains the fields and
    # values of the log event in a structured format that can be parsed and processed by the client.
    @[JSON::Field(key: "data", converter: Core::Base64Converter)]
    property data : Bytes | Nil

    def initialize(
      @data : Bytes | Nil = nil,
    )
    end
  end
end
