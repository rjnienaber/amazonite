private alias Core = Amazonite::Core

module Amazonite::CloudWatchLogs
  # Contains the estimated impact of creating, updating, or deleting an account-level retention
  # policy. The analysis compares the effective retention period of each log group, which accounts
  # for all account-level retention policies that apply to it, before and after the change. Log
  # groups in the Delivery class are not included.
  class DryRunResult
    include JSON::Serializable

    # The number of log groups in the scope of the policy that were analyzed. This value is the sum of
    # `increasedRetentionLogGroupCount`, `decreasedRetentionLogGroupCount`, and
    # `unchangedRetentionLogGroupCount`, and does not include log groups that could not be analyzed.
    @[JSON::Field(key: "totalMatchedLogGroups")]
    property total_matched_log_groups : Int32 | Nil

    # The number of log groups whose effective retention period would become longer.
    @[JSON::Field(key: "increasedRetentionLogGroupCount")]
    property increased_retention_log_group_count : Int32 | Nil

    # The number of log groups whose effective retention period would become shorter.
    @[JSON::Field(key: "decreasedRetentionLogGroupCount")]
    property decreased_retention_log_group_count : Int32 | Nil

    # The number of log groups whose effective retention period would not change.
    @[JSON::Field(key: "unchangedRetentionLogGroupCount")]
    property unchanged_retention_log_group_count : Int32 | Nil

    # The number of log groups in the scope of the policy that could not be analyzed. These log groups
    # are not included in `totalMatchedLogGroups`.
    @[JSON::Field(key: "failedAnalysisCount")]
    property failed_analysis_count : Int32 | Nil

    # Up to 20 log groups in the scope of the policy, sorted by stored bytes in descending order. This
    # list can include log groups whose effective retention period would not change.
    @[JSON::Field(key: "topLogGroupsImpacted")]
    property top_log_groups_impacted : Array(LogGroupImpact) | Nil

    def initialize(
      @total_matched_log_groups : Int32 | Nil = nil,
      @increased_retention_log_group_count : Int32 | Nil = nil,
      @decreased_retention_log_group_count : Int32 | Nil = nil,
      @unchanged_retention_log_group_count : Int32 | Nil = nil,
      @failed_analysis_count : Int32 | Nil = nil,
      @top_log_groups_impacted : Array(LogGroupImpact) | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @total_matched_log_groups
        raise Core::ValidationError.new("totalMatchedLogGroups value must be >= 0") if value < 0
      end

      if value = @increased_retention_log_group_count
        raise Core::ValidationError.new("increasedRetentionLogGroupCount value must be >= 0") if value < 0
      end

      if value = @decreased_retention_log_group_count
        raise Core::ValidationError.new("decreasedRetentionLogGroupCount value must be >= 0") if value < 0
      end

      if value = @unchanged_retention_log_group_count
        raise Core::ValidationError.new("unchangedRetentionLogGroupCount value must be >= 0") if value < 0
      end

      if value = @failed_analysis_count
        raise Core::ValidationError.new("failedAnalysisCount value must be >= 0") if value < 0
      end

      if value = @top_log_groups_impacted
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@total_matched_log_groups, @increased_retention_log_group_count, @decreased_retention_log_group_count, @unchanged_retention_log_group_count, @failed_analysis_count, @top_log_groups_impacted)
  end
end
