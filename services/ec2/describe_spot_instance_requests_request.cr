private alias Core = Amazonite::Core

module Amazonite::EC2
  # Contains the parameters for DescribeSpotInstanceRequests.
  class DescribeSpotInstanceRequestsRequest
    # The token returned from a previous paginated request. Pagination continues from the end of the
    # items returned by the previous request.
    property next_token : String | Nil

    # The maximum number of items to return for this request. To get the next page of items, make
    # another request with the token returned in the output. For more information, see
    # [Pagination](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/Query-Requests.html#api-pagination).
    property max_results : Int32 | Nil

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The IDs of the Spot Instance requests.
    property spot_instance_request_ids : Array(String) | Nil

    # The filters.
    #
    # - `availability-zone-group` - The Availability Zone group.
    #
    # - `create-time` - The time stamp when the Spot Instance request was created.
    #
    # - `fault-code` - The fault code related to the request.
    #
    # - `fault-message` - The fault message related to the request.
    #
    # - `instance-id` - The ID of the instance that fulfilled the request.
    #
    # - `launch-group` - The Spot Instance launch group.
    #
    # - `launch.block-device-mapping.delete-on-termination` - Indicates whether the EBS volume is
    # deleted on instance termination.
    #
    # - `launch.block-device-mapping.device-name` - The device name for the volume in the block device
    # mapping (for example, `/dev/sdh` or `xvdh`).
    #
    # - `launch.block-device-mapping.snapshot-id` - The ID of the snapshot for the EBS volume.
    #
    # - `launch.block-device-mapping.volume-size` - The size of the EBS volume, in GiB.
    #
    # - `launch.block-device-mapping.volume-type` - The type of EBS volume: `gp2` or `gp3` for General
    # Purpose SSD, `io1` or `io2` for Provisioned IOPS SSD, `st1` for Throughput Optimized HDD, `sc1`
    # for Cold HDD, or `standard` for Magnetic.
    #
    # - `launch.group-id` - The ID of the security group for the instance.
    #
    # - `launch.group-name` - The name of the security group for the instance.
    #
    # - `launch.image-id` - The ID of the AMI.
    #
    # - `launch.instance-type` - The type of instance (for example, `m3.medium`).
    #
    # - `launch.kernel-id` - The kernel ID.
    #
    # - `launch.key-name` - The name of the key pair the instance launched with.
    #
    # - `launch.monitoring-enabled` - Whether detailed monitoring is enabled for the Spot Instance.
    #
    # - `launch.ramdisk-id` - The RAM disk ID.
    #
    # - `launched-availability-zone` - The Availability Zone in which the request is launched.
    #
    # - `launched-availability-zone-id` - The ID of the Availability Zone in which the request is
    # launched.
    #
    # - `network-interface.addresses.primary` - Indicates whether the IP address is the primary
    # private IP address.
    #
    # - `network-interface.delete-on-termination` - Indicates whether the network interface is deleted
    # when the instance is terminated.
    #
    # - `network-interface.description` - A description of the network interface.
    #
    # - `network-interface.device-index` - The index of the device for the network interface
    # attachment on the instance.
    #
    # - `network-interface.group-id` - The ID of the security group associated with the network
    # interface.
    #
    # - `network-interface.network-interface-id` - The ID of the network interface.
    #
    # - `network-interface.private-ip-address` - The primary private IP address of the network
    # interface.
    #
    # - `network-interface.subnet-id` - The ID of the subnet for the instance.
    #
    # - `product-description` - The product description associated with the instance (`Linux/UNIX` |
    # `Windows`).
    #
    # - `spot-instance-request-id` - The Spot Instance request ID.
    #
    # - `spot-price` - The maximum hourly price for any Spot Instance launched to fulfill the request.
    #
    # - `state` - The state of the Spot Instance request (`open` | `active` | `closed` | `cancelled` |
    # `failed`). Spot request status information can help you track your Amazon EC2 Spot Instance
    # requests. For more information, see [Spot request
    # status](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/spot-request-status.html) in the
    # *Amazon EC2 User Guide*.
    #
    # - `status-code` - The short code describing the most recent evaluation of your Spot Instance
    # request.
    #
    # - `status-message` - The message explaining the status of the Spot Instance request.
    #
    # - `tag:` - The key/value combination of a tag assigned to the resource. Use the tag key in the
    # filter name and the tag value as the filter value. For example, to find all resources that have
    # a tag with the key `Owner` and the value `TeamA`, specify `tag:Owner` for the filter name and
    # `TeamA` for the filter value.
    #
    # - `tag-key` - The key of a tag assigned to the resource. Use this filter to find all resources
    # assigned a tag with a specific key, regardless of the tag value.
    #
    # - `type` - The type of Spot Instance request (`one-time` | `persistent`).
    #
    # - `valid-from` - The start date of the request.
    #
    # - `valid-until` - The end date of the request.
    property filters : Array(Filter) | Nil

    def initialize(
      @next_token : String | Nil = nil,
      @max_results : Int32 | Nil = nil,
      @dry_run : Bool | Nil = nil,
      @spot_instance_request_ids : Array(String) | Nil = nil,
      @filters : Array(Filter) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end

      if value = @max_results
        params << {"#{prefix}MaxResults", value.to_s}
      end

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      (@spot_instance_request_ids || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}SpotInstanceRequestId.#{i}", item}
      end

      (@filters || [] of Filter).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Filter.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='NextToken']")),
        max_results: Core::XMLValue.i32(node.xpath_node("*[local-name()='MaxResults']")),
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='dryRun']")),
        spot_instance_request_ids: node.xpath_nodes("*[local-name()='SpotInstanceRequestId']/*[local-name()='SpotInstanceRequestId']").map { |n| n.content },
        filters: node.xpath_nodes("*[local-name()='Filter']/*[local-name()='Filter']").map { |n| Filter.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @filters
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@next_token, @max_results, @dry_run, @spot_instance_request_ids, @filters)
  end
end
