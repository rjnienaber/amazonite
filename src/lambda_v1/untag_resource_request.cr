private alias Core = Amazonite::Core

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

    def validate! : Nil
      if value = @resource
        raise Core::ValidationError.new("Resource length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("Resource length must be <= 10000") if value.size > 10000
        raise Core::ValidationError.new("Resource does not match the required pattern") unless value.matches?(Regex.new("^arn:(aws[a-zA-Z-]*):lambda:(eusc-)?[a-z]{2}((-gov)|(-iso([a-z]?)))?-[a-z]+-\\d{1}:\\d{12}:(function:[a-zA-Z0-9-_]+(:(\\$LATEST|[a-zA-Z0-9-_]+))?|code-signing-config:csc-[a-z0-9]{17}|event-source-mapping:[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}|(capacity-provider|network-connector):[a-zA-Z0-9-_]{1,64})$"))
      end
    end

    def_equals_and_hash(@resource, @tag_keys)
  end
end
