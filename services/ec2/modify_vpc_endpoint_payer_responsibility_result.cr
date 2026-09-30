private alias Core = Amazonite::Core

module Amazonite::EC2
  class ModifyVpcEndpointPayerResponsibilityResult
    # The ID of the VPC endpoint.
    property vpc_endpoint_id : String | Nil

    # The payer responsibility settings for the VPC endpoint.
    property payer_responsibilities : Array(PayerResponsibilityEntry) | Nil

    def initialize(
      @vpc_endpoint_id : String | Nil = nil,
      @payer_responsibilities : Array(PayerResponsibilityEntry) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @vpc_endpoint_id
        params << {"#{prefix}VpcEndpointId", value}
      end

      (@payer_responsibilities || [] of PayerResponsibilityEntry).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}PayerResponsibilitySet.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        vpc_endpoint_id: Core::XMLValue.string(node.xpath_node("*[local-name()='vpcEndpointId']")),
        payer_responsibilities: node.xpath_nodes("*[local-name()='payerResponsibilitySet']/*[local-name()='item']").map { |n| PayerResponsibilityEntry.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @payer_responsibilities
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@vpc_endpoint_id, @payer_responsibilities)
  end
end
