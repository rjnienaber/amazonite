private alias Core = Amazonite::Core

module Amazonite::Sns
  class TagResourceRequest
    # The ARN of the topic to which to add tags.
    property resource_arn : String

    # The tags to be added to the specified topic. A tag consists of a required key and an optional
    # value.
    property tags : Array(Tag) = [] of Tag

    def initialize(
      @resource_arn : String,
      @tags : Array(Tag),
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}ResourceArn", @resource_arn}

      @tags.each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Tags.member.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        resource_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='ResourceArn']")).not_nil!,
        tags: node.xpath_nodes("*[local-name()='Tags']/*[local-name()='member']").map { |n| Tag.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @resource_arn
        raise Core::ValidationError.new("ResourceArn length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("ResourceArn length must be <= 1011") if value.size > 1011
      end

      if value = @tags
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@resource_arn, @tags)
  end
end
