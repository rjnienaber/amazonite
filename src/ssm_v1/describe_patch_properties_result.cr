module Amazonite::SsmV1
  class DescribePatchPropertiesResult
    include JSON::Serializable

    @[JSON::Field(key: "Properties")]
    property properties : Array(Hash(String, String)) | Nil

    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @properties : Array(Hash(String, String)) | Nil = nil,
      @next_token : String | Nil = nil
    )
    end
  end
end
