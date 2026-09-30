private alias Core = Amazonite::Core

module Amazonite::Lambda
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

    def validate! : Nil
      if value = @resource
        raise Core::ValidationError.new("Resource length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("Resource length must be <= 10000") if value.size > 10000
        raise Core::ValidationError.new("Resource does not match the required pattern") unless value.matches?(Regex.new("^arn:(aws[a-zA-Z-]*):lambda:(eusc-)?[a-z]{2}((-gov)|(-iso([a-z]?)))?-[a-z]+-\\d{1}:\\d{12}:(function:[a-zA-Z0-9-_]+(:(\\$LATEST|[a-zA-Z0-9-_]+))?|code-signing-config:csc-[a-z0-9]{17}|event-source-mapping:[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}|(capacity-provider|network-connector):[a-zA-Z0-9-_]{1,64})$"))
      end
    end

    def_equals_and_hash(@resource, @tags)
  end
end
