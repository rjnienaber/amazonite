private alias Core = Amazonite::Core

module Amazonite::EC2
  class DisableVpcClassicLinkDnsSupportRequest
    # The ID of the VPC.
    property vpc_id : String | Nil

    def initialize(
      @vpc_id : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @vpc_id
        params << {"#{prefix}VpcId", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        vpc_id: Core::XMLValue.string(node.xpath_node("*[local-name()='VpcId']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@vpc_id)
  end
end
