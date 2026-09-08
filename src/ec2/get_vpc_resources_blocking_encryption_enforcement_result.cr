private alias Core = Amazonite::Core

module Amazonite::EC2
  class GetVpcResourcesBlockingEncryptionEnforcementResult
    # Information about resources that are blocking encryption enforcement.
    property non_compliant_resources : Array(VpcEncryptionNonCompliantResource) | Nil

    # The token to include in another request to get the next page of items. This value is `null` when
    # there are no more items to return.
    property next_token : String | Nil

    def initialize(
      @non_compliant_resources : Array(VpcEncryptionNonCompliantResource) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@non_compliant_resources || [] of VpcEncryptionNonCompliantResource).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}NonCompliantResourceSet.#{i}."))
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        non_compliant_resources: node.xpath_nodes("*[local-name()='nonCompliantResourceSet']/*[local-name()='item']").map { |n| VpcEncryptionNonCompliantResource.from_xml(n) },
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='nextToken']")),
      )
    end

    def validate! : Nil
      if value = @non_compliant_resources
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@non_compliant_resources, @next_token)
  end
end
