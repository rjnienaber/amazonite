private alias Core = Amazonite::Core

module Amazonite::Sns
  class ListTagsForResourceRequest
    # The ARN of the topic for which to list tags.
    property resource_arn : String

    def initialize(
      @resource_arn : String,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}ResourceArn", @resource_arn}
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        resource_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='ResourceArn']")).not_nil!,
      )
    end

    def validate! : Nil
      if value = @resource_arn
        raise Core::ValidationError.new("ResourceArn length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("ResourceArn length must be <= 1011") if value.size > 1011
      end
    end

    def_equals_and_hash(@resource_arn)
  end
end
