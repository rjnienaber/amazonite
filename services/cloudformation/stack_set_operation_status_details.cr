private alias Core = Amazonite::Core

module Amazonite::CloudFormation
  # Detailed information about the StackSet operation.
  class StackSetOperationStatusDetails
    # The detailed progress information for the individual stages of the StackSet operation: the role
    # provisioning stage and the stack instances deployment stage.
    property stages : Stages | Nil

    # The total number of accounts targeted by this StackSet operation. Self-managed operations and
    # service-managed operations that do not provision roles also report this value when it is known.
    # CloudFormation populates this value after it resolves the target accounts. Until then, this
    # field is not present.
    property total_accounts_count : Int32 | Nil

    # The total number of stack instances targeted by this StackSet operation. CloudFormation
    # populates this value after it resolves the target stack instances. Until then, this field is not
    # present.
    property total_stack_instances_count : Int32 | Nil

    # The number of stack instances for which the StackSet operation failed.
    property failed_stack_instances_count : Int32 | Nil

    def initialize(
      @stages : Stages | Nil = nil,
      @total_accounts_count : Int32 | Nil = nil,
      @total_stack_instances_count : Int32 | Nil = nil,
      @failed_stack_instances_count : Int32 | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @stages
        params.concat(value.to_query_params("#{prefix}Stages."))
      end

      if value = @total_accounts_count
        params << {"#{prefix}TotalAccountsCount", value.to_s}
      end

      if value = @total_stack_instances_count
        params << {"#{prefix}TotalStackInstancesCount", value.to_s}
      end

      if value = @failed_stack_instances_count
        params << {"#{prefix}FailedStackInstancesCount", value.to_s}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        stages: node.xpath_node("*[local-name()='Stages']").try { |n| Stages.from_xml(n) },
        total_accounts_count: Core::XMLValue.i32(node.xpath_node("*[local-name()='TotalAccountsCount']")),
        total_stack_instances_count: Core::XMLValue.i32(node.xpath_node("*[local-name()='TotalStackInstancesCount']")),
        failed_stack_instances_count: Core::XMLValue.i32(node.xpath_node("*[local-name()='FailedStackInstancesCount']")),
      )
    end

    def validate! : Nil
      if value = @stages
        value.validate!
      end

      if value = @total_accounts_count
        raise Core::ValidationError.new("TotalAccountsCount value must be >= 0") if value < 0
      end

      if value = @total_stack_instances_count
        raise Core::ValidationError.new("TotalStackInstancesCount value must be >= 0") if value < 0
      end

      if value = @failed_stack_instances_count
        raise Core::ValidationError.new("FailedStackInstancesCount value must be >= 0") if value < 0
      end
    end

    def_equals_and_hash(@stages, @total_accounts_count, @total_stack_instances_count, @failed_stack_instances_count)
  end
end
