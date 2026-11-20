private alias ACF = Amazonite::CloudFormation
private alias Core = Amazonite::Core

module Amazonite::CloudFormation
  # Provides visibility into the role provisioning stage of a StackSet operation, including
  # per-account progress counts and a completion percentage. For operations that do not provision
  # IAM roles in target accounts, the `Status` is `NOT_APPLICABLE` and the progress counts are
  # omitted.
  class RoleProvisioning
    # The status of the role provisioning stage can be one of the following values:
    #
    # - `NOT_APPLICABLE`: The operation does not provision roles. This includes self-managed
    # operations and service-managed operations whose configuration does not require role
    # provisioning.
    #
    # - `NOT_STARTED`: Role provisioning has not started. The operation has not begun resolving target
    # accounts, or it failed or stopped before the total number of target accounts was resolved.
    #
    # - `IN_PROGRESS`: Role provisioning is actively processing target accounts.
    #
    # - `SUCCEEDED`: Role provisioning finished and succeeded for all target accounts.
    #
    # - `PARTIAL_SUCCESS`: Role provisioning finished, but succeeded for only a subset of target
    # accounts; one or more accounts failed.
    #
    # - `FAILED`: Role provisioning finished and failed for all target accounts.
    property status : StageStatus | Nil

    # The number of accounts for which role provisioning succeeded.
    property succeeded_accounts_count : Int32 | Nil

    # The number of accounts for which role provisioning failed.
    property failed_accounts_count : Int32 | Nil

    # The number of accounts that have finished role provisioning, including both succeeded and failed
    # accounts.
    property completed_accounts_count : Int32 | Nil

    # The number of accounts that are still awaiting role provisioning.
    property pending_accounts_count : Int32 | Nil

    # The percentage of accounts that have completed role provisioning.
    property percentage_completed : Float64 | Nil

    def initialize(
      @status : StageStatus | Nil = nil,
      @succeeded_accounts_count : Int32 | Nil = nil,
      @failed_accounts_count : Int32 | Nil = nil,
      @completed_accounts_count : Int32 | Nil = nil,
      @pending_accounts_count : Int32 | Nil = nil,
      @percentage_completed : Float64 | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @status
        params << {"#{prefix}Status", value.to_json_object_key}
      end

      if value = @succeeded_accounts_count
        params << {"#{prefix}SucceededAccountsCount", value.to_s}
      end

      if value = @failed_accounts_count
        params << {"#{prefix}FailedAccountsCount", value.to_s}
      end

      if value = @completed_accounts_count
        params << {"#{prefix}CompletedAccountsCount", value.to_s}
      end

      if value = @pending_accounts_count
        params << {"#{prefix}PendingAccountsCount", value.to_s}
      end

      if value = @percentage_completed
        params << {"#{prefix}PercentageCompleted", value.to_s}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        status: (n = node.xpath_node("*[local-name()='Status']")) ? ACF::StageStatus.from_json_object_key?(n.content) : nil,
        succeeded_accounts_count: Core::XMLValue.i32(node.xpath_node("*[local-name()='SucceededAccountsCount']")),
        failed_accounts_count: Core::XMLValue.i32(node.xpath_node("*[local-name()='FailedAccountsCount']")),
        completed_accounts_count: Core::XMLValue.i32(node.xpath_node("*[local-name()='CompletedAccountsCount']")),
        pending_accounts_count: Core::XMLValue.i32(node.xpath_node("*[local-name()='PendingAccountsCount']")),
        percentage_completed: Core::XMLValue.f64(node.xpath_node("*[local-name()='PercentageCompleted']")),
      )
    end

    def validate! : Nil
      if value = @succeeded_accounts_count
        raise Core::ValidationError.new("SucceededAccountsCount value must be >= 0") if value < 0
      end

      if value = @failed_accounts_count
        raise Core::ValidationError.new("FailedAccountsCount value must be >= 0") if value < 0
      end

      if value = @completed_accounts_count
        raise Core::ValidationError.new("CompletedAccountsCount value must be >= 0") if value < 0
      end

      if value = @pending_accounts_count
        raise Core::ValidationError.new("PendingAccountsCount value must be >= 0") if value < 0
      end

      if value = @percentage_completed
        raise Core::ValidationError.new("PercentageCompleted value must be >= 0") if value < 0
        raise Core::ValidationError.new("PercentageCompleted value must be <= 100") if value > 100
      end
    end

    def_equals_and_hash(@status, @succeeded_accounts_count, @failed_accounts_count, @completed_accounts_count, @pending_accounts_count, @percentage_completed)
  end
end
