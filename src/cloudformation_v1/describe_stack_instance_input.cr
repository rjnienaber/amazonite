private alias ACF = Amazonite::CloudFormationV1
private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class DescribeStackInstanceInput
    # The name or the unique stack ID of the StackSet that you want to get stack instance information
    # for.
    property stack_set_name : String

    # The ID of an Amazon Web Services account that's associated with this stack instance.
    property stack_instance_account : String

    # The name of a Region that's associated with this stack instance.
    property stack_instance_region : String

    # [Service-managed permissions] Specifies whether you are acting as an account administrator in
    # the organization's management account or as a delegated administrator in a member account.
    #
    # By default, `SELF` is specified. Use `SELF` for StackSets with self-managed permissions.
    #
    # - If you are signed in to the management account, specify `SELF`.
    #
    # - If you are signed in to a delegated administrator account, specify `DELEGATED_ADMIN`.
    #
    # Your Amazon Web Services account must be registered as a delegated administrator in the
    # management account. For more information, see [Register a delegated
    # administrator](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-orgs-delegated-admin.html)
    # in the *CloudFormation User Guide*.
    property call_as : CallAs | Nil

    def initialize(
      @stack_set_name : String,
      @stack_instance_account : String,
      @stack_instance_region : String,
      @call_as : CallAs | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}StackSetName", @stack_set_name}

      params << {"#{prefix}StackInstanceAccount", @stack_instance_account}

      params << {"#{prefix}StackInstanceRegion", @stack_instance_region}

      if value = @call_as
        params << {"#{prefix}CallAs", value.to_json_object_key}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        stack_set_name: Core::XMLValue.string(node.xpath_node("*[local-name()='StackSetName']")).not_nil!,
        stack_instance_account: Core::XMLValue.string(node.xpath_node("*[local-name()='StackInstanceAccount']")).not_nil!,
        stack_instance_region: Core::XMLValue.string(node.xpath_node("*[local-name()='StackInstanceRegion']")).not_nil!,
        call_as: (n = node.xpath_node("*[local-name()='CallAs']")) ? ACF::CallAs.from_json_object_key?(n.content) : nil,
      )
    end

    def_equals_and_hash(@stack_set_name, @stack_instance_account, @stack_instance_region, @call_as)
  end
end
