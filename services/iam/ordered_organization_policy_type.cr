module Amazonite::Iam
  # Represents one level of an Organizations hierarchy—the organization root, an organizational unit
  # (OU), or an account—together with the service control policies (SCPs) that apply at that level.
  # Each element in the list represents one level of the hierarchy, ordered from the organization
  # root down to the account.
  #
  # For more information about SCPs, see [Service control policies
  # (SCPs)](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_scps.html)
  # in the *Organizations User Guide*.
  class OrderedOrganizationPolicyType
    # A list of SCP documents that apply at this level of the Organizations hierarchy. Each document
    # is specified as a string containing the complete, valid JSON text of an SCP.
    property service_control_policy_input_list : Array(String) | Nil

    def initialize(
      @service_control_policy_input_list : Array(String) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@service_control_policy_input_list || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}ServiceControlPolicyInputList.member.#{i}", item}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        service_control_policy_input_list: node.xpath_nodes("*[local-name()='ServiceControlPolicyInputList']/*[local-name()='member']").map { |n| n.content },
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@service_control_policy_input_list)
  end
end
