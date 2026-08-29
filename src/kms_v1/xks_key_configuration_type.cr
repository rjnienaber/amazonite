module Amazonite::KmsV1
  class XksKeyConfigurationType
    include JSON::Serializable

    @[JSON::Field(key: "Id")]
    property id : String | Nil

    def initialize(
      @id : String | Nil = nil,
    )
    end
  end
end
