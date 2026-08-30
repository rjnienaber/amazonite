private alias ADDB = Amazonite::DynamoDBV2

module Amazonite::DynamoDBV2
  # Represents the DynamoDB Streams configuration for a table in DynamoDB.
  class StreamSpecification
    include JSON::Serializable

    # Indicates whether DynamoDB Streams is enabled (true) or disabled (false) on the table.
    @[JSON::Field(key: "StreamEnabled")]
    property stream_enabled : Bool

    # When an item in the table is modified, `StreamViewType` determines what information is written
    # to the stream for this table. Valid values for `StreamViewType` are:
    #
    # - `KEYS_ONLY` - Only the key attributes of the modified item are written to the stream.
    #
    # - `NEW_IMAGE` - The entire item, as it appears after it was modified, is written to the stream.
    #
    # - `OLD_IMAGE` - The entire item, as it appeared before it was modified, is written to the
    # stream.
    #
    # - `NEW_AND_OLD_IMAGES` - Both the new and the old item images of the item are written to the
    # stream.
    @[JSON::Field(key: "StreamViewType", converter: ADDB::StreamViewType)]
    property stream_view_type : StreamViewType | Nil

    def initialize(
      @stream_enabled : Bool,
      @stream_view_type : StreamViewType | Nil = nil,
    )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@stream_enabled, @stream_view_type)
  end
end
