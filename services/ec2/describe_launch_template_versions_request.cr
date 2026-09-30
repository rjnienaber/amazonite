private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeLaunchTemplateVersionsRequest
    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The ID of the launch template.
    #
    # To describe one or more versions of a specified launch template, you must specify either the
    # launch template ID or the launch template name, but not both.
    #
    # To describe all the latest or default launch template versions in your account, you must omit
    # this parameter.
    property launch_template_id : String | Nil

    # The name of the launch template.
    #
    # To describe one or more versions of a specified launch template, you must specify either the
    # launch template name or the launch template ID, but not both.
    #
    # To describe all the latest or default launch template versions in your account, you must omit
    # this parameter.
    property launch_template_name : String | Nil

    # One or more versions of the launch template. Valid values depend on whether you are describing a
    # specified launch template (by ID or name) or all launch templates in your account.
    #
    # To describe one or more versions of a specified launch template, valid values are `$Latest`,
    # `$Default`, and numbers.
    #
    # To describe all launch templates in your account that are defined as the latest version, the
    # valid value is `$Latest`. To describe all launch templates in your account that are defined as
    # the default version, the valid value is `$Default`. You can specify `$Latest` and `$Default` in
    # the same request. You cannot specify numbers.
    property versions : Array(String) | Nil

    # The version number after which to describe launch template versions.
    property min_version : String | Nil

    # The version number up to which to describe launch template versions.
    property max_version : String | Nil

    # The token to request the next page of results.
    property next_token : String | Nil

    # The maximum number of results to return in a single call. To retrieve the remaining results,
    # make another call with the returned `NextToken` value. This value can be between 1 and 200.
    property max_results : Int32 | Nil

    # One or more filters.
    #
    # - `create-time` - The time the launch template version was created.
    #
    # - `ebs-optimized` - A boolean that indicates whether the instance is optimized for Amazon EBS
    # I/O.
    #
    # - `http-endpoint` - Indicates whether the HTTP metadata endpoint on your instances is enabled
    # (`enabled` | `disabled`).
    #
    # - `http-protocol-ipv4` - Indicates whether the IPv4 endpoint for the instance metadata service
    # is enabled (`enabled` | `disabled`).
    #
    # - `host-resource-group-arn` - The ARN of the host resource group in which to launch the
    # instances.
    #
    # - `http-tokens` - The state of token usage for your instance metadata requests (`optional` |
    # `required`).
    #
    # - `iam-instance-profile` - The ARN of the IAM instance profile.
    #
    # - `image-id` - The ID of the AMI.
    #
    # - `instance-type` - The instance type.
    #
    # - `is-default-version` - A boolean that indicates whether the launch template version is the
    # default version.
    #
    # - `kernel-id` - The kernel ID.
    #
    # - `license-configuration-arn` - The ARN of the license configuration.
    #
    # - `network-card-index` - The index of the network card.
    #
    # - `ram-disk-id` - The RAM disk ID.
    property filters : Array(Filter) | Nil

    # If `true`, and if a Systems Manager parameter is specified for `ImageId`, the AMI ID is
    # displayed in the response for `imageId`.
    #
    # If `false`, and if a Systems Manager parameter is specified for `ImageId`, the parameter is
    # displayed in the response for `imageId`.
    #
    # For more information, see [Use a Systems Manager parameter instead of an AMI
    # ID](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/create-launch-template.html#use-an-ssm-parameter-instead-of-an-ami-id)
    # in the *Amazon EC2 User Guide*.
    #
    # Default: `false`
    property resolve_alias : Bool | Nil

    # Indicates whether to include managed resources in the output. If this parameter is set to
    # `true`, the output includes resources that are managed by Amazon Web Services services, even if
    # managed resource visibility is set to hidden.
    property include_managed_resources : Bool | Nil

    def initialize(
      @dry_run : Bool | Nil = nil,
      @launch_template_id : String | Nil = nil,
      @launch_template_name : String | Nil = nil,
      @versions : Array(String) | Nil = nil,
      @min_version : String | Nil = nil,
      @max_version : String | Nil = nil,
      @next_token : String | Nil = nil,
      @max_results : Int32 | Nil = nil,
      @filters : Array(Filter) | Nil = nil,
      @resolve_alias : Bool | Nil = nil,
      @include_managed_resources : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      if value = @launch_template_id
        params << {"#{prefix}LaunchTemplateId", value}
      end

      if value = @launch_template_name
        params << {"#{prefix}LaunchTemplateName", value}
      end

      (@versions || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}LaunchTemplateVersion.#{i}", item}
      end

      if value = @min_version
        params << {"#{prefix}MinVersion", value}
      end

      if value = @max_version
        params << {"#{prefix}MaxVersion", value}
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end

      if value = @max_results
        params << {"#{prefix}MaxResults", value.to_s}
      end

      (@filters || [] of Filter).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Filter.#{i}."))
      end

      if value = @resolve_alias
        params << {"#{prefix}ResolveAlias", Core::QueryValue.bool(value)}
      end

      if value = @include_managed_resources
        params << {"#{prefix}IncludeManagedResources", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
        launch_template_id: Core::XMLValue.string(node.xpath_node("*[local-name()='LaunchTemplateId']")),
        launch_template_name: Core::XMLValue.string(node.xpath_node("*[local-name()='LaunchTemplateName']")),
        versions: node.xpath_nodes("*[local-name()='LaunchTemplateVersion']/*[local-name()='item']").map { |n| n.content },
        min_version: Core::XMLValue.string(node.xpath_node("*[local-name()='MinVersion']")),
        max_version: Core::XMLValue.string(node.xpath_node("*[local-name()='MaxVersion']")),
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='NextToken']")),
        max_results: Core::XMLValue.i32(node.xpath_node("*[local-name()='MaxResults']")),
        filters: node.xpath_nodes("*[local-name()='Filter']/*[local-name()='Filter']").map { |n| Filter.from_xml(n) },
        resolve_alias: Core::XMLValue.bool(node.xpath_node("*[local-name()='ResolveAlias']")),
        include_managed_resources: Core::XMLValue.bool(node.xpath_node("*[local-name()='IncludeManagedResources']")),
      )
    end

    def validate! : Nil
      if value = @launch_template_name
        raise Core::ValidationError.new("LaunchTemplateName length must be >= 3") if value.size < 3
        raise Core::ValidationError.new("LaunchTemplateName length must be <= 128") if value.size > 128
        raise Core::ValidationError.new("LaunchTemplateName does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z0-9\\(\\)\\.\\-/_]+$"))
      end

      if value = @filters
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@dry_run, @launch_template_id, @launch_template_name, @versions, @min_version, @max_version, @next_token, @max_results, @filters, @resolve_alias, @include_managed_resources)
  end
end
