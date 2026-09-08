private alias Core = Amazonite::Core

module Amazonite::EC2
  # Deprecated.
  #
  # Describes the ClassicLink DNS support status of a VPC.
  class ClassicLinkDnsSupport
    # Indicates whether ClassicLink DNS support is enabled for the VPC.
    property classic_link_dns_supported : Bool | Nil

    # The ID of the VPC.
    property vpc_id : String | Nil

    def initialize(
      @classic_link_dns_supported : Bool | Nil = nil,
      @vpc_id : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @classic_link_dns_supported
        params << {"#{prefix}ClassicLinkDnsSupported", Core::QueryValue.bool(value)}
      end

      if value = @vpc_id
        params << {"#{prefix}VpcId", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        classic_link_dns_supported: Core::XMLValue.bool(node.xpath_node("*[local-name()='classicLinkDnsSupported']")),
        vpc_id: Core::XMLValue.string(node.xpath_node("*[local-name()='vpcId']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@classic_link_dns_supported, @vpc_id)
  end
end
