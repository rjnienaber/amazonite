private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeVpcClassicLinkResult
    # The ClassicLink status of the VPCs.
    property vpcs : Array(VpcClassicLink) | Nil

    def initialize(
      @vpcs : Array(VpcClassicLink) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@vpcs || [] of VpcClassicLink).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}VpcSet.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        vpcs: node.xpath_nodes("*[local-name()='vpcSet']/*[local-name()='item']").map { |n| VpcClassicLink.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @vpcs
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@vpcs)
  end
end
