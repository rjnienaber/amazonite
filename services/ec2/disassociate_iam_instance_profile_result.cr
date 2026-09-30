private alias Core = Amazonite::Core

module Amazonite::EC2
  class DisassociateIamInstanceProfileResult
    # Information about the IAM instance profile association.
    property iam_instance_profile_association : IamInstanceProfileAssociation | Nil

    def initialize(
      @iam_instance_profile_association : IamInstanceProfileAssociation | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @iam_instance_profile_association
        params.concat(value.to_query_params("#{prefix}IamInstanceProfileAssociation."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        iam_instance_profile_association: node.xpath_node("*[local-name()='iamInstanceProfileAssociation']").try { |n| IamInstanceProfileAssociation.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @iam_instance_profile_association
        value.validate!
      end
    end

    def_equals_and_hash(@iam_instance_profile_association)
  end
end
