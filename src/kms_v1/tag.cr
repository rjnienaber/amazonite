module Amazonite::KmsV1
  class Tag
    include JSON::Serializable

    @[JSON::Field(key: "TagKey")]
    property tag_key : String

    @[JSON::Field(key: "TagValue")]
    property tag_value : String

    def initialize(
      @tag_key : String,
      @tag_value : String,
    )
    end
  end
end
