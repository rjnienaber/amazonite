private alias Core = Amazonite::Core

module Amazonite::Iam
  class SimulateCustomPolicyRequest
    # A list of policy documents to include in the simulation. Each document is specified as a string
    # containing the complete, valid JSON text of an IAM policy. Do not include any resource-based
    # policies in this parameter. Any resource-based policy must be submitted with the
    # `ResourcePolicy` parameter. The policies cannot be "scope-down" policies, such as you could
    # include in a call to
    # [GetFederationToken](https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetFederationToken.html)
    # or one of the
    # [AssumeRole](https://docs.aws.amazon.com/IAM/latest/APIReference/API_AssumeRole.html) API
    # operations. In other words, do not use policies designed to restrict what a user can do while
    # using the temporary credentials.
    #
    # The maximum length of the policy document that you can pass in this operation, including
    # whitespace, is listed below. To view the maximum character counts of a managed policy with no
    # whitespaces, see [IAM and STS character
    # quotas](https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_iam-quotas.html#reference_iam-quotas-entity-length).
    #
    # The [regex pattern](http://wikipedia.org/wiki/regex) used to validate this parameter is a string
    # of characters consisting of the following:
    #
    # - Any printable ASCII character ranging from the space character (`\u0020`) through the end of
    # the ASCII character range
    #
    # - The printable characters in the Basic Latin and Latin-1 Supplement character set (through
    # `\u00FF`)
    #
    # - The special characters tab (`\u0009`), line feed (`\u000A`), and carriage return (`\u000D`)
    property policy_input_list : Array(String) = [] of String

    # The IAM permissions boundary policy to simulate. The permissions boundary sets the maximum
    # permissions that an IAM entity can have. You can input only one permissions boundary when you
    # pass a policy to this operation. For more information about permissions boundaries, see
    # [Permissions boundaries for IAM
    # entities](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_boundaries.html) in
    # the *IAM User Guide*. The policy input is specified as a string that contains the complete,
    # valid JSON text of a permissions boundary policy.
    #
    # The maximum length of the policy document that you can pass in this operation, including
    # whitespace, is listed below. To view the maximum character counts of a managed policy with no
    # whitespaces, see [IAM and STS character
    # quotas](https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_iam-quotas.html#reference_iam-quotas-entity-length).
    #
    # The [regex pattern](http://wikipedia.org/wiki/regex) used to validate this parameter is a string
    # of characters consisting of the following:
    #
    # - Any printable ASCII character ranging from the space character (`\u0020`) through the end of
    # the ASCII character range
    #
    # - The printable characters in the Basic Latin and Latin-1 Supplement character set (through
    # `\u00FF`)
    #
    # - The special characters tab (`\u0009`), line feed (`\u000A`), and carriage return (`\u000D`)
    property permissions_boundary_policy_input_list : Array(String) | Nil

    # An ordered list of service control policies (SCPs) to include in the simulation. Each element
    # represents one level of an Organizations hierarchy, from the organization root to the account.
    #
    # The simulator evaluates SCPs in the order that you provide, consistent with how Organizations
    # enforces SCPs. The first element must represent the organization root, and the last element must
    # represent the account. Any elements between them represent organizational units (OUs) in
    # descending order.
    #
    # Use this parameter to simulate the effect of an SCP hierarchy without calling
    # [SimulatePrincipalPolicy](https://docs.aws.amazon.com/IAM/latest/APIReference/API_SimulatePrincipalPolicy.html).
    property ordered_organization_policy_input_list : Array(OrderedOrganizationPolicyType) | Nil

    # A list of names of API operations to evaluate in the simulation. Each operation is evaluated
    # against each resource. Each operation must include the service identifier, such as
    # `iam:CreateUser`. This operation does not support using wildcards (*) in an action name.
    property action_names : Array(String) = [] of String

    # A list of ARNs of Amazon Web Services resources to include in the simulation. If this parameter
    # is not provided, then the value defaults to `*` (all resources). Each API in the `ActionNames`
    # parameter is evaluated for each resource in this list. The simulation determines the access
    # result (allowed or denied) of each combination and reports it in the response. You can simulate
    # resources that don't exist in your account.
    #
    # The simulation does not automatically retrieve policies for the specified resources. If you want
    # to include a resource policy in the simulation, then you must include the policy as a string in
    # the `ResourcePolicy` parameter.
    #
    # If you include a `ResourcePolicy`, then it must be applicable to all of the resources included
    # in the simulation or you receive an invalid input error.
    #
    # For more information about ARNs, see [Amazon Resource Names
    # (ARNs)](https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html) in the
    # *Amazon Web Services General Reference*.
    #
    # Simulation of resource-based policies isn't supported for IAM roles.
    property resource_arns : Array(String) | Nil

    # A resource-based policy to include in the simulation provided as a string. Each resource in the
    # simulation is treated as if it had this policy attached. You can include only one resource-based
    # policy in a simulation.
    #
    # The maximum length of the policy document that you can pass in this operation, including
    # whitespace, is listed below. To view the maximum character counts of a managed policy with no
    # whitespaces, see [IAM and STS character
    # quotas](https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_iam-quotas.html#reference_iam-quotas-entity-length).
    #
    # The [regex pattern](http://wikipedia.org/wiki/regex) used to validate this parameter is a string
    # of characters consisting of the following:
    #
    # - Any printable ASCII character ranging from the space character (`\u0020`) through the end of
    # the ASCII character range
    #
    # - The printable characters in the Basic Latin and Latin-1 Supplement character set (through
    # `\u00FF`)
    #
    # - The special characters tab (`\u0009`), line feed (`\u000A`), and carriage return (`\u000D`)
    #
    # Simulation of resource-based policies isn't supported for IAM roles.
    property resource_policy : String | Nil

    # An ARN representing the Amazon Web Services account ID that specifies the owner of any simulated
    # resource that does not identify its owner in the resource ARN. Examples of resource ARNs include
    # an S3 bucket or object. If `ResourceOwner` is specified, it is also used as the account owner of
    # any `ResourcePolicy` included in the simulation. If the `ResourceOwner` parameter is not
    # specified, then the owner of the resources and the resource policy defaults to the account of
    # the identity provided in `CallerArn`. This parameter is required only if you specify a
    # resource-based policy and account that owns the resource is different from the account that owns
    # the simulated calling user `CallerArn`.
    #
    # The ARN for an account uses the following syntax: `arn:aws:iam::*AWS-account-ID*:root`. For
    # example, to represent the account with the 112233445566 ID, use the following ARN:
    # `arn:aws:iam::112233445566-ID:root`.
    property resource_owner : String | Nil

    # The ARN of the IAM user, group, or role that you want to use as the simulated caller of the API
    # operations. `CallerArn` is required if you include a `ResourcePolicy` so that the policy's
    # `Principal` element has a value to use in evaluating the policy.
    #
    # You cannot specify the ARN of an assumed role, federated user, or a service principal.
    property caller_arn : String | Nil

    # A list of context keys and corresponding values for the simulation to use. Whenever a context
    # key is evaluated in one of the simulated IAM permissions policies, the corresponding value is
    # supplied.
    property context_entries : Array(ContextEntry) | Nil

    # Specifies the type of simulation to run. Different API operations that support resource-based
    # policies require different combinations of resources. By specifying the type of simulation to
    # run, you enable the policy simulator to enforce the presence of the required resources to ensure
    # reliable simulation results. If your simulation does not match one of the following scenarios,
    # then you can omit this parameter. The following list shows each of the supported scenario values
    # and the resources that you must define to run the simulation.
    #
    # Each of the Amazon EC2 scenarios requires that you specify instance, image, and security group
    # resources. If your scenario includes an EBS volume, then you must specify that volume as a
    # resource. If the Amazon EC2 scenario includes VPC, then you must supply the network interface
    # resource. If it includes an IP subnet, then you must specify the subnet resource. For more
    # information on the Amazon EC2 scenario options, see [Supported
    # platforms](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-supported-platforms.html) in
    # the *Amazon EC2 User Guide*.
    #
    # - **EC2-VPC-InstanceStore**
    #
    # instance, image, security group, network interface
    #
    # - **EC2-VPC-InstanceStore-Subnet**
    #
    # instance, image, security group, network interface, subnet
    #
    # - **EC2-VPC-EBS**
    #
    # instance, image, security group, network interface, volume
    #
    # - **EC2-VPC-EBS-Subnet**
    #
    # instance, image, security group, network interface, subnet, volume
    property resource_handling_option : String | Nil

    # Use this only when paginating results to indicate the maximum number of items you want in the
    # response. If additional items exist beyond the maximum you specify, the `IsTruncated` response
    # element is `true`.
    #
    # If you do not include this parameter, the number of items defaults to 100. Note that IAM might
    # return fewer results, even when there are more results available. In that case, the
    # `IsTruncated` response element returns `true`, and `Marker` contains a value to include in the
    # subsequent call that tells the service where to continue from.
    property max_items : Int32 | Nil

    # Use this parameter only when paginating results and only after you receive a response indicating
    # that the results are truncated. Set it to the value of the `Marker` element in the response that
    # you received to indicate where the next call should start.
    property marker : String | Nil

    def initialize(
      @policy_input_list : Array(String),
      @action_names : Array(String),
      @permissions_boundary_policy_input_list : Array(String) | Nil = nil,
      @ordered_organization_policy_input_list : Array(OrderedOrganizationPolicyType) | Nil = nil,
      @resource_arns : Array(String) | Nil = nil,
      @resource_policy : String | Nil = nil,
      @resource_owner : String | Nil = nil,
      @caller_arn : String | Nil = nil,
      @context_entries : Array(ContextEntry) | Nil = nil,
      @resource_handling_option : String | Nil = nil,
      @max_items : Int32 | Nil = nil,
      @marker : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      @policy_input_list.each_with_index(1) do |item, i|
        params << {"#{prefix}PolicyInputList.member.#{i}", item}
      end

      (@permissions_boundary_policy_input_list || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}PermissionsBoundaryPolicyInputList.member.#{i}", item}
      end

      (@ordered_organization_policy_input_list || [] of OrderedOrganizationPolicyType).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}OrderedOrganizationPolicyInputList.member.#{i}."))
      end

      @action_names.each_with_index(1) do |item, i|
        params << {"#{prefix}ActionNames.member.#{i}", item}
      end

      (@resource_arns || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}ResourceArns.member.#{i}", item}
      end

      if value = @resource_policy
        params << {"#{prefix}ResourcePolicy", value}
      end

      if value = @resource_owner
        params << {"#{prefix}ResourceOwner", value}
      end

      if value = @caller_arn
        params << {"#{prefix}CallerArn", value}
      end

      (@context_entries || [] of ContextEntry).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}ContextEntries.member.#{i}."))
      end

      if value = @resource_handling_option
        params << {"#{prefix}ResourceHandlingOption", value}
      end

      if value = @max_items
        params << {"#{prefix}MaxItems", value.to_s}
      end

      if value = @marker
        params << {"#{prefix}Marker", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        policy_input_list: node.xpath_nodes("*[local-name()='PolicyInputList']/*[local-name()='member']").map { |n| n.content },
        permissions_boundary_policy_input_list: node.xpath_nodes("*[local-name()='PermissionsBoundaryPolicyInputList']/*[local-name()='member']").map { |n| n.content },
        ordered_organization_policy_input_list: node.xpath_nodes("*[local-name()='OrderedOrganizationPolicyInputList']/*[local-name()='member']").map { |n| OrderedOrganizationPolicyType.from_xml(n) },
        action_names: node.xpath_nodes("*[local-name()='ActionNames']/*[local-name()='member']").map { |n| n.content },
        resource_arns: node.xpath_nodes("*[local-name()='ResourceArns']/*[local-name()='member']").map { |n| n.content },
        resource_policy: Core::XMLValue.string(node.xpath_node("*[local-name()='ResourcePolicy']")),
        resource_owner: Core::XMLValue.string(node.xpath_node("*[local-name()='ResourceOwner']")),
        caller_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='CallerArn']")),
        context_entries: node.xpath_nodes("*[local-name()='ContextEntries']/*[local-name()='member']").map { |n| ContextEntry.from_xml(n) },
        resource_handling_option: Core::XMLValue.string(node.xpath_node("*[local-name()='ResourceHandlingOption']")),
        max_items: Core::XMLValue.i32(node.xpath_node("*[local-name()='MaxItems']")),
        marker: Core::XMLValue.string(node.xpath_node("*[local-name()='Marker']")),
      )
    end

    def validate! : Nil
      if value = @ordered_organization_policy_input_list
        raise Core::ValidationError.new("OrderedOrganizationPolicyInputList must have at least 0 item(s)") if value.size < 0
        raise Core::ValidationError.new("OrderedOrganizationPolicyInputList must have at most 7 item(s)") if value.size > 7
        value.each(&.validate!)
      end

      if value = @resource_policy
        raise Core::ValidationError.new("ResourcePolicy length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("ResourcePolicy length must be <= 131072") if value.size > 131072
        raise Core::ValidationError.new("ResourcePolicy does not match the required pattern") unless value.matches?(Regex.new("^[\t\n\r -ÿ]+$"))
      end

      if value = @resource_owner
        raise Core::ValidationError.new("ResourceOwner length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("ResourceOwner length must be <= 2048") if value.size > 2048
      end

      if value = @caller_arn
        raise Core::ValidationError.new("CallerArn length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("CallerArn length must be <= 2048") if value.size > 2048
      end

      if value = @context_entries
        value.each(&.validate!)
      end

      if value = @resource_handling_option
        raise Core::ValidationError.new("ResourceHandlingOption length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("ResourceHandlingOption length must be <= 64") if value.size > 64
      end

      if value = @max_items
        raise Core::ValidationError.new("MaxItems value must be >= 1") if value < 1
        raise Core::ValidationError.new("MaxItems value must be <= 1000") if value > 1000
      end

      if value = @marker
        raise Core::ValidationError.new("Marker length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("Marker length must be <= 320") if value.size > 320
        raise Core::ValidationError.new("Marker does not match the required pattern") unless value.matches?(Regex.new("^[ -ÿ]+$"))
      end
    end

    def_equals_and_hash(@policy_input_list, @permissions_boundary_policy_input_list, @ordered_organization_policy_input_list, @action_names, @resource_arns, @resource_policy, @resource_owner, @caller_arn, @context_entries, @resource_handling_option, @max_items, @marker)
  end
end
