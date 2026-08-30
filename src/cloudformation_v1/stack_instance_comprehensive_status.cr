private alias ACF = Amazonite::CloudFormationV1

module Amazonite::CloudFormationV1
  # The detailed status of the stack instance.
  class StackInstanceComprehensiveStatus
    # - `CANCELLED`: The operation in the specified account and Region has been canceled. This is
    # either because a user has stopped the StackSet operation, or because the failure tolerance of
    # the StackSet operation has been exceeded.
    #
    # - `FAILED`: The operation in the specified account and Region failed. If the StackSet operation
    # fails in enough accounts within a Region, the failure tolerance for the StackSet operation as a
    # whole might be exceeded.
    #
    # - `FAILED_IMPORT`: The import of the stack instance in the specified account and Region failed
    # and left the stack in an unstable state. Once the issues causing the failure are fixed, the
    # import operation can be retried. If enough StackSet operations fail in enough accounts within a
    # Region, the failure tolerance for the StackSet operation as a whole might be exceeded.
    #
    # - `INOPERABLE`: A `DeleteStackInstances` operation has failed and left the stack in an unstable
    # state. Stacks in this state are excluded from further `UpdateStackSet` operations. You might
    # need to perform a `DeleteStackInstances` operation, with `RetainStacks` set to `true`, to delete
    # the stack instance, and then delete the stack manually.
    #
    # - `PENDING`: The operation in the specified account and Region has yet to start.
    #
    # - `RUNNING`: The operation in the specified account and Region is currently in progress.
    #
    # - `SKIPPED_SUSPENDED_ACCOUNT`: The operation in the specified account and Region has been
    # skipped because the account was suspended at the time of the operation.
    #
    # - `SUCCEEDED`: The operation in the specified account and Region completed successfully.
    property detailed_status : StackInstanceDetailedStatus | Nil

    def initialize(
      @detailed_status : StackInstanceDetailedStatus | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @detailed_status
        params << {"#{prefix}DetailedStatus", value.to_json_object_key}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        detailed_status: (n = node.xpath_node("*[local-name()='DetailedStatus']")) ? ACF::StackInstanceDetailedStatus.from_json_object_key?(n.content) : nil,
      )
    end

    def_equals_and_hash(@detailed_status)
  end
end
