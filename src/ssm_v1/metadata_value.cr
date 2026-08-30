private alias Core = Amazonite::Core

module Amazonite::SsmV1
  # Metadata to assign to an Application Manager application.
  class MetadataValue
    include JSON::Serializable

    # Metadata value to assign to an Application Manager application.
    @[JSON::Field(key: "Value")]
    property value : String | Nil

    def initialize(
      @value : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @value
        raise Core::ValidationError.new("Value length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("Value length must be <= 4096") if value.size > 4096
      end
    end

    def_equals_and_hash(@value)
  end
end
