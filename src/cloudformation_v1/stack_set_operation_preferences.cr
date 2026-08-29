private alias ACF = Amazonite::CloudFormationV1
private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  # The user-specified preferences for how CloudFormation performs a StackSet operation.
  #
  # For more information about maximum concurrent accounts and failure tolerance, see [StackSet
  # operation
  # options](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-concepts.html#stackset-ops-options).
  #
  # `StackSetOperationPreferences` don't apply to `AutoDeployment`, even if it's enabled.
  class StackSetOperationPreferences
    # The concurrency type of deploying StackSets operations in Regions, could be in parallel or one
    # Region at a time.
    property region_concurrency_type : RegionConcurrencyType | Nil

    # The order of the Regions where you want to perform the stack operation.
    property region_order : Array(String) | Nil

    # The number of accounts per Region this operation can fail in before CloudFormation stops the
    # operation in that Region. If the operation is stopped in a Region, CloudFormation doesn't
    # attempt the operation in any subsequent Regions.
    #
    # You can specify either `FailureToleranceCount` or `FailureTolerancePercentage`, but not both.
    #
    # By default, `0` is specified.
    property failure_tolerance_count : Int32 | Nil

    # The percentage of accounts per Region this stack operation can fail in before CloudFormation
    # stops the operation in that Region. If the operation is stopped in a Region, CloudFormation
    # doesn't attempt the operation in any subsequent Regions.
    #
    # When calculating the number of accounts based on the specified percentage, CloudFormation rounds
    # *down* to the next whole number.
    #
    # You can specify either `FailureToleranceCount` or `FailureTolerancePercentage`, but not both.
    #
    # By default, `0` is specified.
    property failure_tolerance_percentage : Int32 | Nil

    # The maximum number of accounts in which to perform this operation at one time. This can depend
    # on the value of `FailureToleranceCount` depending on your `ConcurrencyMode`.
    # `MaxConcurrentCount` is at most one more than the `FailureToleranceCount` if you're using
    # `STRICT_FAILURE_TOLERANCE`.
    #
    # Note that this setting lets you specify the *maximum* for operations. For large deployments,
    # under certain circumstances the actual number of accounts acted upon concurrently may be lower
    # due to service throttling.
    #
    # You can specify either `MaxConcurrentCount` or `MaxConcurrentPercentage`, but not both.
    #
    # By default, `1` is specified.
    property max_concurrent_count : Int32 | Nil

    # The maximum percentage of accounts in which to perform this operation at one time.
    #
    # When calculating the number of accounts based on the specified percentage, CloudFormation rounds
    # down to the next whole number. This is true except in cases where rounding down would result is
    # zero. In this case, CloudFormation sets the number as one instead.
    #
    # Note that this setting lets you specify the *maximum* for operations. For large deployments,
    # under certain circumstances the actual number of accounts acted upon concurrently may be lower
    # due to service throttling.
    #
    # You can specify either `MaxConcurrentCount` or `MaxConcurrentPercentage`, but not both.
    #
    # By default, `1` is specified.
    property max_concurrent_percentage : Int32 | Nil

    # Specifies how the concurrency level behaves during the operation execution.
    #
    # - `STRICT_FAILURE_TOLERANCE`: This option dynamically lowers the concurrency level to ensure the
    # number of failed accounts never exceeds the value of `FailureToleranceCount` +1. The initial
    # actual concurrency is set to the lower of either the value of the `MaxConcurrentCount`, or the
    # value of `FailureToleranceCount` +1. The actual concurrency is then reduced proportionally by
    # the number of failures. This is the default behavior.
    #
    # If failure tolerance or Maximum concurrent accounts are set to percentages, the behavior is
    # similar.
    #
    # - `SOFT_FAILURE_TOLERANCE`: This option decouples `FailureToleranceCount` from the actual
    # concurrency. This allows StackSet operations to run at the concurrency level set by the
    # `MaxConcurrentCount` value, or `MaxConcurrentPercentage`, regardless of the number of failures.
    property concurrency_mode : ConcurrencyMode | Nil

    def initialize(
      @region_concurrency_type : RegionConcurrencyType | Nil = nil,
      @region_order : Array(String) | Nil = nil,
      @failure_tolerance_count : Int32 | Nil = nil,
      @failure_tolerance_percentage : Int32 | Nil = nil,
      @max_concurrent_count : Int32 | Nil = nil,
      @max_concurrent_percentage : Int32 | Nil = nil,
      @concurrency_mode : ConcurrencyMode | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @region_concurrency_type
        params << {"#{prefix}RegionConcurrencyType", value.to_json_object_key}
      end

      (@region_order || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}RegionOrder.member.#{i}", item}
      end

      if value = @failure_tolerance_count
        params << {"#{prefix}FailureToleranceCount", value.to_s}
      end

      if value = @failure_tolerance_percentage
        params << {"#{prefix}FailureTolerancePercentage", value.to_s}
      end

      if value = @max_concurrent_count
        params << {"#{prefix}MaxConcurrentCount", value.to_s}
      end

      if value = @max_concurrent_percentage
        params << {"#{prefix}MaxConcurrentPercentage", value.to_s}
      end

      if value = @concurrency_mode
        params << {"#{prefix}ConcurrencyMode", value.to_json_object_key}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        region_concurrency_type: (n = node.xpath_node("*[local-name()='RegionConcurrencyType']")) ? ACF::RegionConcurrencyType.from_json_object_key?(n.content) : nil,
        region_order: node.xpath_nodes("*[local-name()='RegionOrder']/*[local-name()='member']").map { |n| n.content },
        failure_tolerance_count: Core::XMLValue.i32(node.xpath_node("*[local-name()='FailureToleranceCount']")),
        failure_tolerance_percentage: Core::XMLValue.i32(node.xpath_node("*[local-name()='FailureTolerancePercentage']")),
        max_concurrent_count: Core::XMLValue.i32(node.xpath_node("*[local-name()='MaxConcurrentCount']")),
        max_concurrent_percentage: Core::XMLValue.i32(node.xpath_node("*[local-name()='MaxConcurrentPercentage']")),
        concurrency_mode: (n = node.xpath_node("*[local-name()='ConcurrencyMode']")) ? ACF::ConcurrencyMode.from_json_object_key?(n.content) : nil,
      )
    end
  end
end
