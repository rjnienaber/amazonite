module Amazonite::CloudWatchV1
  class ManagedRule
    include JSON::Serializable

    @[JSON::Field(key: "TemplateName")]
    property template_name : String

    @[JSON::Field(key: "ResourceARN")]
    property resource_arn : String

    @[JSON::Field(key: "Tags")]
    property tags : Array(Tag) | Nil

    def initialize(
      @template_name : String,
      @resource_arn : String,
      @tags : Array(Tag) | Nil = nil,
    )
    end
  end
end
