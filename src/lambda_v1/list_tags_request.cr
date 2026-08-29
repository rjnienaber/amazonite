module Amazonite::LambdaV1
  class ListTagsRequest
    include JSON::Serializable

    # The resource's Amazon Resource Name (ARN). Note: Lambda does not support adding tags to function
    # aliases or versions.
    @[JSON::Field(key: "Resource", ignore: true)]
    property resource : String = ""

    def initialize(
      @resource : String,
    )
    end
  end
end
