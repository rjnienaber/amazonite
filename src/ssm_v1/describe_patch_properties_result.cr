module Amazonite::SsmV1
  class DescribePatchPropertiesResult
    include JSON::Serializable

    # A list of the properties for patches matching the filter request parameters.
    @[JSON::Field(key: "Properties")]
    property properties : Array(Hash(String, String)) | Nil

    # The token for the next set of items to return. (You use this token in the next call.)
    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @properties : Array(Hash(String, String)) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end
  end
end
