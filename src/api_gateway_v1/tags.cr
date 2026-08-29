module Amazonite::ApiGatewayV1
  # The collection of tags. Each tag element is associated with a given resource.
  class Tags
    include JSON::Serializable

    # The collection of tags. Each tag element is associated with a given resource.
    @[JSON::Field(key: "tags")]
    property tags : Hash(String, String) | Nil

    def initialize(
      @tags : Hash(String, String) | Nil = nil,
    )
    end
  end
end
