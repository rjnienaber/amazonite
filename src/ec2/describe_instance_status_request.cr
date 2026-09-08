private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeInstanceStatusRequest
    # The instance IDs.
    #
    # Default: Describes all your instances.
    #
    # Constraints: Maximum 100 explicitly specified instance IDs.
    property instance_ids : Array(String) | Nil

    # The maximum number of items to return for this request. To get the next page of items, make
    # another request with the token returned in the output. For more information, see
    # [Pagination](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/Query-Requests.html#api-pagination).
    #
    # You cannot specify this parameter and the instance IDs parameter in the same request.
    property max_results : Int32 | Nil

    # The token returned from a previous paginated request. Pagination continues from the end of the
    # items returned by the previous request.
    property next_token : String | Nil

    # Indicates whether to include managed resources in the output. If this parameter is set to
    # `true`, the output includes resources that are managed by Amazon Web Services services, even if
    # managed resource visibility is set to hidden.
    property include_managed_resources : Bool | Nil

    # Checks whether you have the required permissions for the operation, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The filters.
    #
    # - `availability-zone` - The Availability Zone of the instance.
    #
    # - `availability-zone-id` - The ID of the Availability Zone of the instance.
    #
    # - `event.code` - The code for the scheduled event (`instance-reboot` | `system-reboot` |
    # `system-maintenance` | `instance-retirement` | `instance-stop`).
    #
    # - `event.description` - A description of the event.
    #
    # - `event.instance-event-id` - The ID of the event whose date and time you are modifying.
    #
    # - `event.not-after` - The latest end time for the scheduled event (for example,
    # `2014-09-15T17:15:20.000Z`).
    #
    # - `event.not-before` - The earliest start time for the scheduled event (for example,
    # `2014-09-15T17:15:20.000Z`).
    #
    # - `event.not-before-deadline` - The deadline for starting the event (for example,
    # `2014-09-15T17:15:20.000Z`).
    #
    # - `instance-state-code` - The code for the instance state, as a 16-bit unsigned integer. The
    # high byte is used for internal purposes and should be ignored. The low byte is set based on the
    # state represented. The valid values are 0 (pending), 16 (running), 32 (shutting-down), 48
    # (terminated), 64 (stopping), and 80 (stopped).
    #
    # - `instance-state-name` - The state of the instance (`pending` | `running` | `shutting-down` |
    # `terminated` | `stopping` | `stopped`).
    #
    # - `instance-status.reachability` - Filters on instance status where the name is `reachability`
    # (`passed` | `failed` | `initializing` | `insufficient-data`).
    #
    # - `instance-status.status` - The status of the instance (`ok` | `impaired` | `initializing` |
    # `insufficient-data` | `not-applicable`).
    #
    # - `operator.managed` - A Boolean that indicates whether this is a managed instance.
    #
    # - `operator.principal` - The principal that manages the instance. Only valid for managed
    # instances, where `managed` is `true`.
    #
    # - `system-status.reachability` - Filters on system status where the name is `reachability`
    # (`passed` | `failed` | `initializing` | `insufficient-data`).
    #
    # - `system-status.status` - The system status of the instance (`ok` | `impaired` | `initializing`
    # | `insufficient-data` | `not-applicable`).
    #
    # - `attached-ebs-status.status` - The status of the attached EBS volume for the instance (`ok` |
    # `impaired` | `initializing` | `insufficient-data` | `not-applicable`).
    #
    # - `application-status.status` - The application status of the instance (`ok` | `impaired` |
    # `initializing` | `insufficient-data` | `not-applicable`).
    property filters : Array(Filter) | Nil

    # When `true`, includes the health status for all instances. When `false`, includes the health
    # status for running instances only.
    #
    # Default: `false`
    property include_all_instances : Bool | Nil

    def initialize(
      @instance_ids : Array(String) | Nil = nil,
      @max_results : Int32 | Nil = nil,
      @next_token : String | Nil = nil,
      @include_managed_resources : Bool | Nil = nil,
      @dry_run : Bool | Nil = nil,
      @filters : Array(Filter) | Nil = nil,
      @include_all_instances : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@instance_ids || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}InstanceId.#{i}", item}
      end

      if value = @max_results
        params << {"#{prefix}MaxResults", value.to_s}
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end

      if value = @include_managed_resources
        params << {"#{prefix}IncludeManagedResources", Core::QueryValue.bool(value)}
      end

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      (@filters || [] of Filter).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Filter.#{i}."))
      end

      if value = @include_all_instances
        params << {"#{prefix}IncludeAllInstances", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        instance_ids: node.xpath_nodes("*[local-name()='InstanceId']/*[local-name()='InstanceId']").map { |n| n.content },
        max_results: Core::XMLValue.i32(node.xpath_node("*[local-name()='MaxResults']")),
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='NextToken']")),
        include_managed_resources: Core::XMLValue.bool(node.xpath_node("*[local-name()='IncludeManagedResources']")),
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='dryRun']")),
        filters: node.xpath_nodes("*[local-name()='Filter']/*[local-name()='Filter']").map { |n| Filter.from_xml(n) },
        include_all_instances: Core::XMLValue.bool(node.xpath_node("*[local-name()='includeAllInstances']")),
      )
    end

    def validate! : Nil
      if value = @filters
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@instance_ids, @max_results, @next_token, @include_managed_resources, @dry_run, @filters, @include_all_instances)
  end
end
