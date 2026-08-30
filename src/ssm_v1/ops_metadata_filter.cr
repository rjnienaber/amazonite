private alias Core = Amazonite::Core

module Amazonite::SsmV1
  # A filter to limit the number of OpsMetadata objects displayed.
  class OpsMetadataFilter
    include JSON::Serializable

    # A filter key.
    @[JSON::Field(key: "Key")]
    property key : String

    # A filter value.
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
        raise Core::ValidationError.new("Key does not match the required pattern") unless value.matches?(Regex.new("^(?!\\s*$).+$"))
      end

      if value = @values
        raise Core::ValidationError.new("Values must have at least 1 item(s)") if value.size < 1
        raise Core::ValidationError.new("Values must have at most 10 item(s)") if value.size > 10
      end
    end

    def_equals_and_hash(@key, @values)
  end
end
