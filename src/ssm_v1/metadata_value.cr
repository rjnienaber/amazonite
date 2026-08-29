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
  end
end
