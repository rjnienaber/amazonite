private alias Core = Amazonite::Core

module Amazonite::EventBridge
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

    def validate! : Nil
      if value = @key
        raise Core::ValidationError.new("Key length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("Key length must be <= 128") if value.size > 128
        raise Core::ValidationError.new("Key does not match the required pattern") unless value.matches?(Regex.new("^[\\p{L}\\p{Z}\\p{N}_.:/=+\\-@]*$"))
      end

      if value = @values
        raise Core::ValidationError.new("Values must have at least 1 item(s)") if value.size < 1
        raise Core::ValidationError.new("Values must have at most 50 item(s)") if value.size > 50
      end
    end

    def_equals_and_hash(@key, @values)
  end
end
