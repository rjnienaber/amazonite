private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeImagesResult
    # The token to include in another request to get the next page of items. This value is `null` when
    # there are no more items to return.
    property next_token : String | Nil

    # Information about the images.
    property images : Array(Image) | Nil

    def initialize(
      @next_token : String | Nil = nil,
      @images : Array(Image) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end

      (@images || [] of Image).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}ImagesSet.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='nextToken']")),
        images: node.xpath_nodes("*[local-name()='imagesSet']/*[local-name()='item']").map { |n| Image.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @images
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@next_token, @images)
  end
end
