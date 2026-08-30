private alias Core = Amazonite::Core

module Amazonite::SsmV1
  # A resource policy helps you to define the IAM entity (for example, an Amazon Web Services
  # account) that can manage your Systems Manager resources. Currently, `OpsItemGroup` is the only
  # resource that supports Systems Manager resource policies. The resource policy for `OpsItemGroup`
  # enables Amazon Web Services accounts to view and interact with OpsCenter operational work items
  # (OpsItems).
  class GetResourcePoliciesResponseEntry
    include JSON::Serializable

    # A policy ID.
    @[JSON::Field(key: "PolicyId")]
    property policy_id : String | Nil

    # ID of the current policy version. The hash helps to prevent a situation where multiple users
    # attempt to overwrite a policy. You must provide this hash when updating or deleting a policy.
    @[JSON::Field(key: "PolicyHash")]
    property policy_hash : String | Nil

    # A resource policy helps you to define the IAM entity (for example, an Amazon Web Services
    # account) that can manage your Systems Manager resources. Currently, `OpsItemGroup` is the only
    # resource that supports Systems Manager resource policies. The resource policy for `OpsItemGroup`
    # enables Amazon Web Services accounts to view and interact with OpsCenter operational work items
    # (OpsItems).
    @[JSON::Field(key: "Policy")]
    property policy : String | Nil

    def initialize(
      @policy_id : String | Nil = nil,
      @policy_hash : String | Nil = nil,
      @policy : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @policy
        raise Core::ValidationError.new("Policy does not match the required pattern") unless value.matches?(Regex.new("^(?!\\s*$).+$"))
      end
    end

    def_equals_and_hash(@policy_id, @policy_hash, @policy)
  end
end
