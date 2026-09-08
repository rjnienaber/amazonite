private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeRegionsResult
    # Information about the Regions.
    property regions : Array(Region) | Nil

    def initialize(
      @regions : Array(Region) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@regions || [] of Region).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}RegionInfo.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        regions: node.xpath_nodes("*[local-name()='regionInfo']/*[local-name()='item']").map { |n| Region.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @regions
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@regions)
  end
end
