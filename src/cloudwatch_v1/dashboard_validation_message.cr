module Amazonite::CloudWatchV1
  # An error or warning for the operation.
  class DashboardValidationMessage
    include JSON::Serializable

    # The data path related to the message.
    @[JSON::Field(key: "DataPath")]
    property data_path : String | Nil

    # A message describing the error or warning.
    @[JSON::Field(key: "Message")]
    property message : String | Nil

    def initialize(
      @data_path : String | Nil = nil,
      @message : String | Nil = nil,
    )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@data_path, @message)
  end
end
