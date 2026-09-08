private alias Core = Amazonite::Core

module Amazonite::EC2
  class ListImagesInRecycleBinResult
    # Information about the AMIs.
    property images : Array(ImageRecycleBinInfo) | Nil

    # The token to include in another request to get the next page of items. This value is `null` when
    # there are no more items to return.
    property next_token : String | Nil

    def initialize(
      @images : Array(ImageRecycleBinInfo) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@images || [] of ImageRecycleBinInfo).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}ImageSet.#{i}."))
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        images: node.xpath_nodes("*[local-name()='imageSet']/*[local-name()='item']").map { |n| ImageRecycleBinInfo.from_xml(n) },
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='nextToken']")),
      )
    end

    def validate! : Nil
      if value = @images
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@images, @next_token)
  end
end
