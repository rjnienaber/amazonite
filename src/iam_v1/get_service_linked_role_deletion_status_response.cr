private alias AI = Amazonite::IamV1
private alias Core = Amazonite::Core

module Amazonite::IamV1
  class GetServiceLinkedRoleDeletionStatusResponse
    # The status of the deletion.
    property status : DeletionTaskStatusType

    # An object that contains details about the reason the deletion failed.
    property reason : DeletionTaskFailureReasonType | Nil

    def initialize(
      @status : DeletionTaskStatusType,
      @reason : DeletionTaskFailureReasonType | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}Status", @status.to_json_object_key}

      if value = @reason
        params.concat(value.to_query_params("#{prefix}Reason."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        status: ((n = node.xpath_node("*[local-name()='Status']")) ? AI::DeletionTaskStatusType.from_json_object_key?(n.content) : nil).not_nil!,
        reason: node.xpath_node("*[local-name()='Reason']").try { |n| DeletionTaskFailureReasonType.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @reason
        value.validate!
      end
    end

    def_equals_and_hash(@status, @reason)
  end
end
