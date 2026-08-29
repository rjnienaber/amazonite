module Amazonite::SsmV1
  class AzureSubscription
    include JSON::Serializable

    @[JSON::Field(key: "Id")]
    property id : String

    @[JSON::Field(key: "DisplayName")]
    property display_name : String | Nil

    def initialize(
      @id : String,
      @display_name : String | Nil = nil,
    )
    end
  end
end
