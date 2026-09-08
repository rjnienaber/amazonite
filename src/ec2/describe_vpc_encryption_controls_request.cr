private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeVpcEncryptionControlsRequest
    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The filters to apply to the request.
    property filters : Array(Filter) | Nil

    # The IDs of the VPC Encryption Control configurations to describe.
    property vpc_encryption_control_ids : Array(String) | Nil

    # The IDs of the VPCs to describe encryption control configurations for.
    property vpc_ids : Array(String) | Nil

    # The token returned from a previous paginated request. Pagination continues from the end of the
    # items returned by the previous request.
    property next_token : String | Nil

    # The maximum number of items to return for this request. To get the next page of items, make
    # another request with the token returned in the output. For more information, see
    # [Pagination](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/Query-Requests.html#api-pagination).
    property max_results : Int32 | Nil

    def initialize(
      @dry_run : Bool | Nil = nil,
      @filters : Array(Filter) | Nil = nil,
      @vpc_encryption_control_ids : Array(String) | Nil = nil,
      @vpc_ids : Array(String) | Nil = nil,
      @next_token : String | Nil = nil,
      @max_results : Int32 | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      (@filters || [] of Filter).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Filter.#{i}."))
      end

      (@vpc_encryption_control_ids || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}VpcEncryptionControlId.#{i}", item}
      end

      (@vpc_ids || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}VpcId.#{i}", item}
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
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
        filters: node.xpath_nodes("*[local-name()='Filter']/*[local-name()='Filter']").map { |n| Filter.from_xml(n) },
        vpc_encryption_control_ids: node.xpath_nodes("*[local-name()='VpcEncryptionControlId']/*[local-name()='item']").map { |n| n.content },
        vpc_ids: node.xpath_nodes("*[local-name()='VpcId']/*[local-name()='VpcId']").map { |n| n.content },
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
        raise Core::ValidationError.new("MaxResults value must be <= 1000") if value > 1000
      end
    end

    def_equals_and_hash(@dry_run, @filters, @vpc_encryption_control_ids, @vpc_ids, @next_token, @max_results)
  end
end
