module Amazonite::LambdaV1
  class UntagResourceRequest
    include JSON::Serializable

    @[JSON::Field(key: "Resource", ignore: true)]
    property resource : String = ""

    @[JSON::Field(key: "TagKeys", ignore: true)]
    property tag_keys : Array(String) = [] of String

    def initialize(
      @resource : String,
      @tag_keys : Array(String),
    )
    end
  end
end
