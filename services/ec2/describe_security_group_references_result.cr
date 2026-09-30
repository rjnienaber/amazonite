private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeSecurityGroupReferencesResult
    # Information about the VPCs with the referencing security groups.
    property security_group_reference_set : Array(SecurityGroupReference) | Nil

    def initialize(
      @security_group_reference_set : Array(SecurityGroupReference) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@security_group_reference_set || [] of SecurityGroupReference).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}SecurityGroupReferenceSet.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        security_group_reference_set: node.xpath_nodes("*[local-name()='securityGroupReferenceSet']/*[local-name()='item']").map { |n| SecurityGroupReference.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @security_group_reference_set
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@security_group_reference_set)
  end
end
