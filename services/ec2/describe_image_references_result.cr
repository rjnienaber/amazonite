private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeImageReferencesResult
    # The token to include in another request to get the next page of items. This value is `null` when
    # there are no more items to return.
    property next_token : String | Nil

    # The resources that are referencing the specified images.
    property image_references : Array(ImageReference) | Nil

    def initialize(
      @next_token : String | Nil = nil,
      @image_references : Array(ImageReference) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end

      (@image_references || [] of ImageReference).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}ImageReferenceSet.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='nextToken']")),
        image_references: node.xpath_nodes("*[local-name()='imageReferenceSet']/*[local-name()='item']").map { |n| ImageReference.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @image_references
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@next_token, @image_references)
  end
end
