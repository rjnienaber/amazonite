private alias Core = Amazonite::Core

module Amazonite::SsmV1
  # Metadata that you assign to your Amazon Web Services resources. Tags enable you to categorize
  # your resources in different ways, for example, by purpose, owner, or environment. In Amazon Web
  # Services Systems Manager, you can apply tags to Systems Manager documents (SSM documents),
  # managed nodes, maintenance windows, parameters, patch baselines, OpsItems, and OpsMetadata.
  class Tag
    include JSON::Serializable

    # The name of the tag.
    @[JSON::Field(key: "Key")]
    property key : String

    # The value of the tag.
    @[JSON::Field(key: "Value")]
    property value : String

    def initialize(
      @key : String,
      @value : String,
    )
    end

    def validate! : Nil
      if value = @key
        raise Core::ValidationError.new("Key length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("Key length must be <= 128") if value.size > 128
        raise Core::ValidationError.new("Key does not match the required pattern") unless value.matches?(Regex.new("^([\\p{L}\\p{Z}\\p{N}_.:/=+\\-@]*)$"))
      end

      if value = @value
        raise Core::ValidationError.new("Value length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("Value length must be <= 256") if value.size > 256
        raise Core::ValidationError.new("Value does not match the required pattern") unless value.matches?(Regex.new("^([\\p{L}\\p{Z}\\p{N}_.:/=+\\-@]*)$"))
      end
    end

    def_equals_and_hash(@key, @value)
  end
end
