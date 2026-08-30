private alias Core = Amazonite::Core

module Amazonite::IamV1
  class SimulatePrincipalPolicyRequest
    # The Amazon Resource Name (ARN) of a user, group, or role whose policies you want to include in
    # the simulation. If you specify a user, group, or role, the simulation includes all policies that
    # are associated with that entity. If you specify a user, the simulation also includes all
    # policies that are attached to any groups the user belongs to.
    #
    # The maximum length of the policy document that you can pass in this operation, including
    # whitespace, is listed below. To view the maximum character counts of a managed policy with no
    # whitespaces, see [IAM and STS character
    # quotas](https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_iam-quotas.html#reference_iam-quotas-entity-length).
    #
    # For more information about ARNs, see [Amazon Resource Names
    # (ARNs)](https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html) in the
    # *Amazon Web Services General Reference*.
    property policy_source_arn : String

    # An optional list of additional policy documents to include in the simulation. Each document is
    # specified as a string containing the complete, valid JSON text of an IAM policy.
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
    property policy_input_list : Array(String) | Nil

    # The IAM permissions boundary policy to simulate. The permissions boundary sets the maximum
    # permissions that the entity can have. You can input only one permissions boundary when you pass
    # a policy to this operation. An IAM entity can only have one permissions boundary in effect at a
    # time. For example, if a permissions boundary is attached to an entity and you pass in a
    # different permissions boundary policy using this parameter, then the new permissions boundary
    # policy is used for the simulation. For more information about permissions boundaries, see
    # [Permissions boundaries for IAM
    # entities](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_boundaries.html) in
    # the *IAM User Guide*. The policy input is specified as a string containing the complete, valid
    # JSON text of a permissions boundary policy.
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

    # A list of policies to exclude from the simulation. Use this parameter to test what the
    # simulation result would be if a policy were removed, without changing which policies are
    # actually attached to the principal identified by `PolicySourceArn`.
    #
    # Each entry is a
    # [PolicyIdentifier](https://docs.aws.amazon.com/IAM/latest/APIReference/API_PolicyIdentifier.html)
    # that identifies one or more policies to exclude by policy type, by Amazon Resource Name (ARN),
    # or by the name of an inline policy and the entity it is attached to.
    #
    # Syntactically invalid identifiers, such as malformed ARNs or wildcards in disallowed positions,
    # cause the request to fail with an `InvalidInput` error. Syntactically valid identifiers that
    # don't match any attached policy are ignored. Resource control policies (RCPs) are not supported
    # in this release; identifiers that target RCPs are also ignored.
    property policy_exclusion_list : Array(PolicyIdentifier) | Nil

    # A list of names of API operations to evaluate in the simulation. Each operation is evaluated for
    # each resource. Each operation must include the service identifier, such as `iam:CreateUser`.
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

    # An Amazon Web Services account ID that specifies the owner of any simulated resource that does
    # not identify its owner in the resource ARN. Examples of resource ARNs include an S3 bucket or
    # object. If `ResourceOwner` is specified, it is also used as the account owner of any
    # `ResourcePolicy` included in the simulation. If the `ResourceOwner` parameter is not specified,
    # then the owner of the resources and the resource policy defaults to the account of the identity
    # provided in `CallerArn`. This parameter is required only if you specify a resource-based policy
    # and account that owns the resource is different from the account that owns the simulated calling
    # user `CallerArn`.
    property resource_owner : String | Nil

    # The ARN of the IAM user, group, or role that you want to specify as the simulated caller of the
    # API operations. If you do not specify a `CallerArn`, it defaults to the ARN of the user, group,
    # or role that you specify in `PolicySourceArn`. If you include both a `PolicySourceArn` (for
    # example, `arn:aws:iam::123456789012:user/David`) and a `CallerArn` (for example,
    # `arn:aws:iam::123456789012:user/Bob`), the result is that you simulate calling the API
    # operations as Bob, as if Bob had David's policies.
    #
    # You can specify the ARN of an IAM user, group, or role. You cannot specify the ARN of an assumed
    # role, federated user, or a service principal.
    #
    # `CallerArn` is required if you include a `ResourcePolicy` and the `PolicySourceArn` is not the
    # ARN for an IAM user, group, or role. This is required so that the resource-based policy's
    # `Principal` element has a value to use in evaluating the policy.
    #
    # For more information about ARNs, see [Amazon Resource Names
    # (ARNs)](https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html) in the
    # *Amazon Web Services General Reference*.
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
      @policy_source_arn : String,
      @action_names : Array(String),
      @policy_input_list : Array(String) | Nil = nil,
      @permissions_boundary_policy_input_list : Array(String) | Nil = nil,
      @policy_exclusion_list : Array(PolicyIdentifier) | Nil = nil,
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

      params << {"#{prefix}PolicySourceArn", @policy_source_arn}

      (@policy_input_list || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}PolicyInputList.member.#{i}", item}
      end

      (@permissions_boundary_policy_input_list || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}PermissionsBoundaryPolicyInputList.member.#{i}", item}
      end

      (@policy_exclusion_list || [] of PolicyIdentifier).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}PolicyExclusionList.member.#{i}."))
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
        policy_source_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='PolicySourceArn']")).not_nil!,
        policy_input_list: node.xpath_nodes("*[local-name()='PolicyInputList']/*[local-name()='member']").map { |n| n.content },
        permissions_boundary_policy_input_list: node.xpath_nodes("*[local-name()='PermissionsBoundaryPolicyInputList']/*[local-name()='member']").map { |n| n.content },
        policy_exclusion_list: node.xpath_nodes("*[local-name()='PolicyExclusionList']/*[local-name()='member']").map { |n| PolicyIdentifier.from_xml(n) },
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

    def_equals_and_hash(@policy_source_arn, @policy_input_list, @permissions_boundary_policy_input_list, @policy_exclusion_list, @action_names, @resource_arns, @resource_policy, @resource_owner, @caller_arn, @context_entries, @resource_handling_option, @max_items, @marker)
  end
end
