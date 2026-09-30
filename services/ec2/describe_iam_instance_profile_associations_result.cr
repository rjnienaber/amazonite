private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeIamInstanceProfileAssociationsResult
    # Information about the IAM instance profile associations.
    property iam_instance_profile_associations : Array(IamInstanceProfileAssociation) | Nil

    # The token to include in another request to get the next page of items. This value is `null` when
    # there are no more items to return.
    property next_token : String | Nil

    def initialize(
      @iam_instance_profile_associations : Array(IamInstanceProfileAssociation) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@iam_instance_profile_associations || [] of IamInstanceProfileAssociation).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}IamInstanceProfileAssociationSet.#{i}."))
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        iam_instance_profile_associations: node.xpath_nodes("*[local-name()='iamInstanceProfileAssociationSet']/*[local-name()='item']").map { |n| IamInstanceProfileAssociation.from_xml(n) },
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='nextToken']")),
      )
    end

    def validate! : Nil
      if value = @iam_instance_profile_associations
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@iam_instance_profile_associations, @next_token)
  end
end
