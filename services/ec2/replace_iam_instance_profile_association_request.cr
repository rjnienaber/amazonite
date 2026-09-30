private alias Core = Amazonite::Core

module Amazonite::EC2
  class ReplaceIamInstanceProfileAssociationRequest
    # The IAM instance profile.
    property iam_instance_profile : IamInstanceProfileSpecification

    # The ID of the existing IAM instance profile association.
    property association_id : String

    def initialize(
      @iam_instance_profile : IamInstanceProfileSpecification,
      @association_id : String,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params.concat(@iam_instance_profile.to_query_params("#{prefix}IamInstanceProfile."))

      params << {"#{prefix}AssociationId", @association_id}
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        iam_instance_profile: node.xpath_node("*[local-name()='IamInstanceProfile']").try { |n| IamInstanceProfileSpecification.from_xml(n) }.not_nil!,
        association_id: Core::XMLValue.string(node.xpath_node("*[local-name()='AssociationId']")).not_nil!,
      )
    end

    def validate! : Nil
      if value = @iam_instance_profile
        value.validate!
      end
    end

    def_equals_and_hash(@iam_instance_profile, @association_id)
  end
end
