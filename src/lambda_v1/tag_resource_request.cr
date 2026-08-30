module Amazonite::LambdaV1
  class TagResourceRequest
    include JSON::Serializable

    # The resource's Amazon Resource Name (ARN).
    @[JSON::Field(key: "Resource", ignore: true)]
    property resource : String = ""

    # A list of tags to apply to the resource.
    @[JSON::Field(key: "Tags")]
    property tags : Hash(String, String)

    def initialize(
      @resource : String,
      @tags : Hash(String, String),
    )
    end

    def_equals_and_hash(@resource, @tags)
  end
end
