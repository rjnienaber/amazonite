module Amazonite::SsmV1
  class MetadataValue
    include JSON::Serializable

    @[JSON::Field(key: "Value")]
    property value : String | Nil

    def initialize(
      @value : String | Nil = nil
    )
    end
  end
end
