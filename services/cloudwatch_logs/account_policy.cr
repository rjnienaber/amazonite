private alias ACWL = Amazonite::CloudWatchLogs
private alias Core = Amazonite::Core

module Amazonite::CloudWatchLogs
  # A structure that contains information about one CloudWatch Logs account policy.
  class AccountPolicy
    include JSON::Serializable

    # The name of the account policy.
    @[JSON::Field(key: "policyName")]
    property policy_name : String | Nil

    # The policy document for this account policy.
    #
    # The JSON specified in `policyDocument` can be up to 30,720 characters.
    @[JSON::Field(key: "policyDocument")]
    property policy_document : String | Nil

    # The date and time that this policy was most recently updated.
    @[JSON::Field(key: "lastUpdatedTime")]
    property last_updated_time : Int64 | Nil

    # The type of policy for this account policy.
    @[JSON::Field(key: "policyType", converter: ACWL::PolicyType)]
    property policy_type : PolicyType | Nil

    # The scope of the account policy.
    @[JSON::Field(key: "scope", converter: ACWL::Scope)]
    property scope : Scope | Nil

    # The log group selection criteria that is used for this policy.
    @[JSON::Field(key: "selectionCriteria")]
    property selection_criteria : String | Nil

    # The Amazon Web Services account ID that the policy applies to.
    @[JSON::Field(key: "accountId")]
    property account_id : String | Nil

    def initialize(
      @policy_name : String | Nil = nil,
      @policy_document : String | Nil = nil,
      @last_updated_time : Int64 | Nil = nil,
      @policy_type : PolicyType | Nil = nil,
      @scope : Scope | Nil = nil,
      @selection_criteria : String | Nil = nil,
      @account_id : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @last_updated_time
        raise Core::ValidationError.new("lastUpdatedTime value must be >= 0") if value < 0
      end

      if value = @account_id
        raise Core::ValidationError.new("accountId length must be >= 12") if value.size < 12
        raise Core::ValidationError.new("accountId length must be <= 12") if value.size > 12
        raise Core::ValidationError.new("accountId does not match the required pattern") unless value.matches?(Regex.new("^\\d{12}$"))
      end
    end

    def_equals_and_hash(@policy_name, @policy_document, @last_updated_time, @policy_type, @scope, @selection_criteria, @account_id)
  end
end
