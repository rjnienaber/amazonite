module Amazonite::LambdaV1
  class TagResourceRequest
    include JSON::Serializable

    @[JSON::Field(key: "Resource", ignore: true)]
    property resource : String = ""

    @[JSON::Field(key: "Tags")]
    property tags : Hash(String, String)

    def initialize(
      @resource : String,
      @tags : Hash(String, String),
    )
    end
  end
end
