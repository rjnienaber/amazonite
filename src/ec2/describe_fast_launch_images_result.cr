private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeFastLaunchImagesResult
    # A collection of details about the fast-launch enabled Windows images that meet the requested
    # criteria.
    property fast_launch_images : Array(DescribeFastLaunchImagesSuccessItem) | Nil

    # The token to include in another request to get the next page of items. This value is `null` when
    # there are no more items to return.
    property next_token : String | Nil

    def initialize(
      @fast_launch_images : Array(DescribeFastLaunchImagesSuccessItem) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@fast_launch_images || [] of DescribeFastLaunchImagesSuccessItem).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}FastLaunchImageSet.#{i}."))
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        fast_launch_images: node.xpath_nodes("*[local-name()='fastLaunchImageSet']/*[local-name()='item']").map { |n| DescribeFastLaunchImagesSuccessItem.from_xml(n) },
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='nextToken']")),
      )
    end

    def validate! : Nil
      if value = @fast_launch_images
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@fast_launch_images, @next_token)
  end
end
