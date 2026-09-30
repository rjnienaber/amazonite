private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes an association between an IAM instance profile and an instance.
  class IamInstanceProfileAssociation
    # The ID of the association.
    property association_id : String | Nil

    # The ID of the instance.
    property instance_id : String | Nil

    # The IAM instance profile.
    property iam_instance_profile : IamInstanceProfile | Nil

    # The state of the association.
    property state : IamInstanceProfileAssociationState | Nil

    # The time the IAM instance profile was associated with the instance.
    property timestamp : Time | Nil

    def initialize(
      @association_id : String | Nil = nil,
      @instance_id : String | Nil = nil,
      @iam_instance_profile : IamInstanceProfile | Nil = nil,
      @state : IamInstanceProfileAssociationState | Nil = nil,
      @timestamp : Time | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @association_id
        params << {"#{prefix}AssociationId", value}
      end

      if value = @instance_id
        params << {"#{prefix}InstanceId", value}
      end

      if value = @iam_instance_profile
        params.concat(value.to_query_params("#{prefix}IamInstanceProfile."))
      end

      if value = @state
        params << {"#{prefix}State", value.to_json_object_key}
      end

      if value = @timestamp
        params << {"#{prefix}Timestamp", Core::QueryValue.time(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        association_id: Core::XMLValue.string(node.xpath_node("*[local-name()='associationId']")),
        instance_id: Core::XMLValue.string(node.xpath_node("*[local-name()='instanceId']")),
        iam_instance_profile: node.xpath_node("*[local-name()='iamInstanceProfile']").try { |n| IamInstanceProfile.from_xml(n) },
        state: (n = node.xpath_node("*[local-name()='state']")) ? AEC::IamInstanceProfileAssociationState.from_json_object_key?(n.content) : nil,
        timestamp: Core::XMLValue.time(node.xpath_node("*[local-name()='timestamp']")),
      )
    end

    def validate! : Nil
      if value = @iam_instance_profile
        value.validate!
      end
    end

    def_equals_and_hash(@association_id, @instance_id, @iam_instance_profile, @state, @timestamp)
  end
end
