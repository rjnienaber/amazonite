module Amazonite::LambdaV1
  class ListTagsRequest
    include JSON::Serializable

    @[JSON::Field(key: "Resource", ignore: true)]
    property resource : String = ""

    def initialize(
      @resource : String,
    )
    end
  end
end
