private alias Core = Amazonite::Core

module Amazonite::EC2
  class ModifyVpcBlockPublicAccessOptionsResult
    # Details related to the VPC Block Public Access (BPA) options.
    property vpc_block_public_access_options : VpcBlockPublicAccessOptions | Nil

    def initialize(
      @vpc_block_public_access_options : VpcBlockPublicAccessOptions | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @vpc_block_public_access_options
        params.concat(value.to_query_params("#{prefix}VpcBlockPublicAccessOptions."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        vpc_block_public_access_options: node.xpath_node("*[local-name()='vpcBlockPublicAccessOptions']").try { |n| VpcBlockPublicAccessOptions.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @vpc_block_public_access_options
        value.validate!
      end
    end

    def_equals_and_hash(@vpc_block_public_access_options)
  end
end
