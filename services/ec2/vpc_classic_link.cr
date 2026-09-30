private alias Core = Amazonite::Core

module Amazonite::EC2
  # Deprecated.
  #
  # Describes whether a VPC is enabled for ClassicLink.
  class VpcClassicLink
    # Indicates whether the VPC is enabled for ClassicLink.
    property classic_link_enabled : Bool | Nil

    # Any tags assigned to the VPC.
    property tags : Array(Tag) | Nil

    # The ID of the VPC.
    property vpc_id : String | Nil

    def initialize(
      @classic_link_enabled : Bool | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
      @vpc_id : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @classic_link_enabled
        params << {"#{prefix}ClassicLinkEnabled", Core::QueryValue.bool(value)}
      end

      (@tags || [] of Tag).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSet.#{i}."))
      end

      if value = @vpc_id
        params << {"#{prefix}VpcId", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        classic_link_enabled: Core::XMLValue.bool(node.xpath_node("*[local-name()='classicLinkEnabled']")),
        tags: node.xpath_nodes("*[local-name()='tagSet']/*[local-name()='item']").map { |n| Tag.from_xml(n) },
        vpc_id: Core::XMLValue.string(node.xpath_node("*[local-name()='vpcId']")),
      )
    end

    def validate! : Nil
      if value = @tags
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@classic_link_enabled, @tags, @vpc_id)
  end
end
