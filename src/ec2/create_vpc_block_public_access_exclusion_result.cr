private alias Core = Amazonite::Core

module Amazonite::EC2
  class CreateVpcBlockPublicAccessExclusionResult
    # Details about an exclusion.
    property vpc_block_public_access_exclusion : VpcBlockPublicAccessExclusion | Nil

    def initialize(
      @vpc_block_public_access_exclusion : VpcBlockPublicAccessExclusion | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @vpc_block_public_access_exclusion
        params.concat(value.to_query_params("#{prefix}VpcBlockPublicAccessExclusion."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        vpc_block_public_access_exclusion: node.xpath_node("*[local-name()='vpcBlockPublicAccessExclusion']").try { |n| VpcBlockPublicAccessExclusion.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @vpc_block_public_access_exclusion
        value.validate!
      end
    end

    def_equals_and_hash(@vpc_block_public_access_exclusion)
  end
end
