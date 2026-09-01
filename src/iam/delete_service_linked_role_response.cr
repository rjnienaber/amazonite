private alias Core = Amazonite::Core

module Amazonite::Iam
  class DeleteServiceLinkedRoleResponse
    # The deletion task identifier that you can use to check the status of the deletion. This
    # identifier is returned in the format `task/aws-service-role///`.
    property deletion_task_id : String

    def initialize(
      @deletion_task_id : String,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}DeletionTaskId", @deletion_task_id}
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        deletion_task_id: Core::XMLValue.string(node.xpath_node("*[local-name()='DeletionTaskId']")).not_nil!,
      )
    end

    def validate! : Nil
      if value = @deletion_task_id
        raise Core::ValidationError.new("DeletionTaskId length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("DeletionTaskId length must be <= 1000") if value.size > 1000
      end
    end

    def_equals_and_hash(@deletion_task_id)
  end
end
