private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeLaunchTemplatesRequest
    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # One or more launch template IDs.
    property launch_template_ids : Array(String) | Nil

    # One or more launch template names.
    property launch_template_names : Array(String) | Nil

    # One or more filters.
    #
    # - `create-time` - The time the launch template was created.
    #
    # - `launch-template-name` - The name of the launch template.
    #
    # - `tag`: - The key/value combination of a tag assigned to the resource. Use the tag key in the
    # filter name and the tag value as the filter value. For example, to find all resources that have
    # a tag with the key `Owner` and the value `TeamA`, specify `tag:Owner` for the filter name and
    # `TeamA` for the filter value.
    #
    # - `tag-key` - The key of a tag assigned to the resource. Use this filter to find all resources
    # assigned a tag with a specific key, regardless of the tag value.
    property filters : Array(Filter) | Nil

    # The token to request the next page of results.
    property next_token : String | Nil

    # The maximum number of results to return in a single call. To retrieve the remaining results,
    # make another call with the returned `NextToken` value. This value can be between 1 and 200.
    property max_results : Int32 | Nil

    # Indicates whether to include managed resources in the output. If this parameter is set to
    # `true`, the output includes resources that are managed by Amazon Web Services services, even if
    # managed resource visibility is set to hidden.
    property include_managed_resources : Bool | Nil

    def initialize(
      @dry_run : Bool | Nil = nil,
      @launch_template_ids : Array(String) | Nil = nil,
      @launch_template_names : Array(String) | Nil = nil,
      @filters : Array(Filter) | Nil = nil,
      @next_token : String | Nil = nil,
      @max_results : Int32 | Nil = nil,
      @include_managed_resources : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      (@launch_template_ids || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}LaunchTemplateId.#{i}", item}
      end

      (@launch_template_names || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}LaunchTemplateName.#{i}", item}
      end

      (@filters || [] of Filter).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Filter.#{i}."))
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end

      if value = @max_results
        params << {"#{prefix}MaxResults", value.to_s}
      end

      if value = @include_managed_resources
        params << {"#{prefix}IncludeManagedResources", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
        launch_template_ids: node.xpath_nodes("*[local-name()='LaunchTemplateId']/*[local-name()='item']").map { |n| n.content },
        launch_template_names: node.xpath_nodes("*[local-name()='LaunchTemplateName']/*[local-name()='item']").map { |n| n.content },
        filters: node.xpath_nodes("*[local-name()='Filter']/*[local-name()='Filter']").map { |n| Filter.from_xml(n) },
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='NextToken']")),
        max_results: Core::XMLValue.i32(node.xpath_node("*[local-name()='MaxResults']")),
        include_managed_resources: Core::XMLValue.bool(node.xpath_node("*[local-name()='IncludeManagedResources']")),
      )
    end

    def validate! : Nil
      if value = @filters
        value.each(&.validate!)
      end

      if value = @max_results
        raise Core::ValidationError.new("MaxResults value must be >= 1") if value < 1
        raise Core::ValidationError.new("MaxResults value must be <= 200") if value > 200
      end
    end

    def_equals_and_hash(@dry_run, @launch_template_ids, @launch_template_names, @filters, @next_token, @max_results, @include_managed_resources)
  end
end
