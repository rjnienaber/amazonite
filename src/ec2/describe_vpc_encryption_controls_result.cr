private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeVpcEncryptionControlsResult
    # Information about the VPC Encryption Control configurations.
    property vpc_encryption_controls : Array(VpcEncryptionControl) | Nil

    # The token to include in another request to get the next page of items. This value is `null` when
    # there are no more items to return.
    property next_token : String | Nil

    def initialize(
      @vpc_encryption_controls : Array(VpcEncryptionControl) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@vpc_encryption_controls || [] of VpcEncryptionControl).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}VpcEncryptionControlSet.#{i}."))
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        vpc_encryption_controls: node.xpath_nodes("*[local-name()='vpcEncryptionControlSet']/*[local-name()='item']").map { |n| VpcEncryptionControl.from_xml(n) },
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='nextToken']")),
      )
    end

    def validate! : Nil
      if value = @vpc_encryption_controls
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@vpc_encryption_controls, @next_token)
  end
end
