module Amazonite::ApiGatewayV1
  # Gets the Tags collection for a given resource.
  class GetTagsRequest
    include JSON::Serializable

    # The ARN of a resource that can be tagged.
    @[JSON::Field(key: "resourceArn", ignore: true)]
    property resource_arn : String = ""

    # (Not currently supported) The current pagination position in the paged result set.
    @[JSON::Field(key: "position", ignore: true)]
    property position : String | Nil

    # (Not currently supported) The maximum number of returned results per page. The default value is
    # 25 and the maximum value is 500.
    @[JSON::Field(key: "limit", ignore: true)]
    property limit : Int32 | Nil

    def initialize(
      @resource_arn : String,
      @position : String | Nil = nil,
      @limit : Int32 | Nil = nil,
    )
    end

    def_equals_and_hash(@resource_arn, @position, @limit)
  end
end
