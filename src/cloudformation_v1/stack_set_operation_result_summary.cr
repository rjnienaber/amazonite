private alias ACF = Amazonite::CloudFormationV1
private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  # The structure that contains information about a specified operation's results for a given
  # account in a given Region.
  class StackSetOperationResultSummary
    # [Self-managed permissions] The name of the Amazon Web Services account for this operation
    # result.
    property account : String | Nil

    # The name of the Amazon Web Services Region for this operation result.
    property region : String | Nil

    # The result status of the StackSet operation for the given account in the given Region.
    #
    # - `CANCELLED`: The operation in the specified account and Region has been canceled. This is
    # either because a user has stopped the StackSet operation, or because the failure tolerance of
    # the StackSet operation has been exceeded.
    #
    # - `FAILED`: The operation in the specified account and Region failed.
    #
    # If the StackSet operation fails in enough accounts within a Region, the failure tolerance for
    # the StackSet operation as a whole might be exceeded.
    #
    # - `RUNNING`: The operation in the specified account and Region is currently in progress.
    #
    # - `PENDING`: The operation in the specified account and Region has yet to start.
    #
    # - `SUCCEEDED`: The operation in the specified account and Region completed successfully.
    property status : StackSetOperationResultStatus | Nil

    # The reason for the assigned result status.
    property status_reason : String | Nil

    # The results of the account gate function CloudFormation invokes, if present, before proceeding
    # with StackSet operations in an account.
    property account_gate_result : AccountGateResult | Nil

    # [Service-managed permissions] The organization root ID or organizational unit (OU) IDs that you
    # specified for
    # [DeploymentTargets](https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_DeploymentTargets.html).
    property organizational_unit_id : String | Nil

    def initialize(
      @account : String | Nil = nil,
      @region : String | Nil = nil,
      @status : StackSetOperationResultStatus | Nil = nil,
      @status_reason : String | Nil = nil,
      @account_gate_result : AccountGateResult | Nil = nil,
      @organizational_unit_id : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @account
        params << {"#{prefix}Account", value}
      end

      if value = @region
        params << {"#{prefix}Region", value}
      end

      if value = @status
        params << {"#{prefix}Status", value.to_json_object_key}
      end

      if value = @status_reason
        params << {"#{prefix}StatusReason", value}
      end

      if value = @account_gate_result
        params.concat(value.to_query_params("#{prefix}AccountGateResult."))
      end

      if value = @organizational_unit_id
        params << {"#{prefix}OrganizationalUnitId", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        account: Core::XMLValue.string(node.xpath_node("*[local-name()='Account']")),
        region: Core::XMLValue.string(node.xpath_node("*[local-name()='Region']")),
        status: (n = node.xpath_node("*[local-name()='Status']")) ? ACF::StackSetOperationResultStatus.from_json_object_key?(n.content) : nil,
        status_reason: Core::XMLValue.string(node.xpath_node("*[local-name()='StatusReason']")),
        account_gate_result: node.xpath_node("*[local-name()='AccountGateResult']").try { |n| AccountGateResult.from_xml(n) },
        organizational_unit_id: Core::XMLValue.string(node.xpath_node("*[local-name()='OrganizationalUnitId']")),
      )
    end

    def validate! : Nil
      if value = @account
        raise Core::ValidationError.new("Account does not match the required pattern") unless value.matches?(Regex.new("^[0-9]{12}$"))
      end

      if value = @region
        raise Core::ValidationError.new("Region does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z0-9-]{1,128}$"))
      end

      if value = @account_gate_result
        value.validate!
      end

      if value = @organizational_unit_id
        raise Core::ValidationError.new("OrganizationalUnitId does not match the required pattern") unless value.matches?(Regex.new("^(ou-[a-z0-9]{4,32}-[a-z0-9]{8,32}|r-[a-z0-9]{4,32})$"))
      end
    end

    def_equals_and_hash(@account, @region, @status, @status_reason, @account_gate_result, @organizational_unit_id)
  end
end
