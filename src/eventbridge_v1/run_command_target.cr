module Amazonite::EventBridgeV1
  # Information about the EC2 instances that are to be sent the command, specified as key-value
  # pairs. Each `RunCommandTarget` block can include only one key, but this key may specify multiple
  # values.
  class RunCommandTarget
    include JSON::Serializable

    # Can be either `tag:` *tag-key* or `InstanceIds`.
    @[JSON::Field(key: "Key")]
    property key : String

    # If `Key` is `tag:` *tag-key*, `Values` is a list of tag values. If `Key` is `InstanceIds`,
    # `Values` is a list of Amazon EC2 instance IDs.
    @[JSON::Field(key: "Values")]
    property values : Array(String) = [] of String

    def initialize(
      @key : String,
      @values : Array(String),
    )
    end

    def_equals_and_hash(@key, @values)
  end
end
