module Amazonite::SsmV1
  # One or more policies assigned to a parameter.
  class ParameterInlinePolicy
    include JSON::Serializable

    # The JSON text of the policy.
    @[JSON::Field(key: "PolicyText")]
    property policy_text : String | Nil

    # The type of policy. Parameter Store, a tool in Amazon Web Services Systems Manager, supports the
    # following policy types: Expiration, ExpirationNotification, and NoChangeNotification.
    @[JSON::Field(key: "PolicyType")]
    property policy_type : String | Nil

    # The status of the policy. Policies report the following statuses: Pending (the policy hasn't
    # been enforced or applied yet), Finished (the policy was applied), Failed (the policy wasn't
    # applied), or InProgress (the policy is being applied now).
    @[JSON::Field(key: "PolicyStatus")]
    property policy_status : String | Nil

    def initialize(
      @policy_text : String | Nil = nil,
      @policy_type : String | Nil = nil,
      @policy_status : String | Nil = nil,
    )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@policy_text, @policy_type, @policy_status)
  end
end
