private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  # Describes whether StackSets automatically deploys to Organizations accounts that are added to a
  # target organization or organizational unit (OU). For more information, see [Enable or disable
  # automatic deployments for StackSets in
  # Organizations](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-orgs-manage-auto-deployment.html)
  # in the *CloudFormation User Guide*.
  class AutoDeployment
    # If set to `true`, StackSets automatically deploys additional stack instances to Organizations
    # accounts that are added to a target organization or organizational unit (OU) in the specified
    # Regions. If an account is removed from a target organization or OU, StackSets deletes stack
    # instances from the account in the specified Regions.
    property enabled : Bool | Nil

    # If set to `true`, stack resources are retained when an account is removed from a target
    # organization or OU. If set to `false`, stack resources are deleted. Specify only if `Enabled` is
    # set to `True`.
    property retain_stacks_on_account_removal : Bool | Nil

    # A list of StackSet ARNs that this StackSet depends on for auto-deployment operations. When
    # auto-deployment is triggered, operations will be sequenced to ensure all dependencies complete
    # successfully before this StackSet's operation begins.
    property depends_on : Array(String) | Nil

    def initialize(
      @enabled : Bool | Nil = nil,
      @retain_stacks_on_account_removal : Bool | Nil = nil,
      @depends_on : Array(String) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @enabled
        params << {"#{prefix}Enabled", Core::QueryValue.bool(value)}
      end

      if value = @retain_stacks_on_account_removal
        params << {"#{prefix}RetainStacksOnAccountRemoval", Core::QueryValue.bool(value)}
      end

      (@depends_on || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}DependsOn.member.#{i}", item}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        enabled: Core::XMLValue.bool(node.xpath_node("*[local-name()='Enabled']")),
        retain_stacks_on_account_removal: Core::XMLValue.bool(node.xpath_node("*[local-name()='RetainStacksOnAccountRemoval']")),
        depends_on: node.xpath_nodes("*[local-name()='DependsOn']/*[local-name()='member']").map { |n| n.content },
      )
    end
  end
end
