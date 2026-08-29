module Amazonite::LambdaV1
  class UntagResourceRequest
    include JSON::Serializable

    # The resource's Amazon Resource Name (ARN).
    @[JSON::Field(key: "Resource", ignore: true)]
    property resource : String = ""

    # A list of tag keys to remove from the resource.
    @[JSON::Field(key: "TagKeys", ignore: true)]
    property tag_keys : Array(String) = [] of String

    def initialize(
      @resource : String,
      @tag_keys : Array(String),
    )
    end
  end
end
