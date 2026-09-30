private alias Core = Amazonite::Core

module Amazonite::EC2
  # Contains the parameters for DescribeNetworkInterfacePermissions.
  class DescribeNetworkInterfacePermissionsRequest
    # The network interface permission IDs.
    property network_interface_permission_ids : Array(String) | Nil

    # One or more filters.
    #
    # - `network-interface-permission.network-interface-permission-id` - The ID of the permission.
    #
    # - `network-interface-permission.network-interface-id` - The ID of the network interface.
    #
    # - `network-interface-permission.aws-account-id` - The Amazon Web Services account ID.
    #
    # - `network-interface-permission.aws-service` - The Amazon Web Services service.
    #
    # - `network-interface-permission.permission` - The type of permission (`INSTANCE-ATTACH` |
    # `EIP-ASSOCIATE`).
    property filters : Array(Filter) | Nil

    # The token returned from a previous paginated request. Pagination continues from the end of the
    # items returned by the previous request.
    property next_token : String | Nil

    # The maximum number of items to return for this request. To get the next page of items, make
    # another request with the token returned in the output. If this parameter is not specified, up to
    # 50 results are returned by default. For more information, see
    # [Pagination](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/Query-Requests.html#api-pagination).
    property max_results : Int32 | Nil

    def initialize(
      @network_interface_permission_ids : Array(String) | Nil = nil,
      @filters : Array(Filter) | Nil = nil,
      @next_token : String | Nil = nil,
      @max_results : Int32 | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@network_interface_permission_ids || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}NetworkInterfacePermissionId.#{i}", item}
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
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        network_interface_permission_ids: node.xpath_nodes("*[local-name()='NetworkInterfacePermissionId']/*[local-name()='item']").map { |n| n.content },
        filters: node.xpath_nodes("*[local-name()='Filter']/*[local-name()='Filter']").map { |n| Filter.from_xml(n) },
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='NextToken']")),
        max_results: Core::XMLValue.i32(node.xpath_node("*[local-name()='MaxResults']")),
      )
    end

    def validate! : Nil
      if value = @filters
        value.each(&.validate!)
      end

      if value = @max_results
        raise Core::ValidationError.new("MaxResults value must be >= 5") if value < 5
        raise Core::ValidationError.new("MaxResults value must be <= 255") if value > 255
      end
    end

    def_equals_and_hash(@network_interface_permission_ids, @filters, @next_token, @max_results)
  end
end
