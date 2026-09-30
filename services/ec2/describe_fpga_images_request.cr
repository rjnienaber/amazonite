private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeFpgaImagesRequest
    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The AFI IDs.
    property fpga_image_ids : Array(String) | Nil

    # Filters the AFI by owner. Specify an Amazon Web Services account ID, `self` (owner is the sender
    # of the request), or an Amazon Web Services owner alias (valid values are `amazon` |
    # `aws-marketplace`).
    property owners : Array(String) | Nil

    # The filters.
    #
    # - `create-time` - The creation time of the AFI.
    #
    # - `fpga-image-id` - The FPGA image identifier (AFI ID).
    #
    # - `fpga-image-global-id` - The global FPGA image identifier (AGFI ID).
    #
    # - `name` - The name of the AFI.
    #
    # - `owner-id` - The Amazon Web Services account ID of the AFI owner.
    #
    # - `product-code` - The product code.
    #
    # - `shell-version` - The version of the Amazon Web Services Shell that was used to create the
    # bitstream.
    #
    # - `state` - The state of the AFI (`pending` | `failed` | `available` | `unavailable`).
    #
    # - `tag`: - The key/value combination of a tag assigned to the resource. Use the tag key in the
    # filter name and the tag value as the filter value. For example, to find all resources that have
    # a tag with the key `Owner` and the value `TeamA`, specify `tag:Owner` for the filter name and
    # `TeamA` for the filter value.
    #
    # - `tag-key` - The key of a tag assigned to the resource. Use this filter to find all resources
    # assigned a tag with a specific key, regardless of the tag value.
    #
    # - `update-time` - The time of the most recent update.
    property filters : Array(Filter) | Nil

    # The token to retrieve the next page of results.
    property next_token : String | Nil

    # The maximum number of results to return in a single call.
    property max_results : Int32 | Nil

    def initialize(
      @dry_run : Bool | Nil = nil,
      @fpga_image_ids : Array(String) | Nil = nil,
      @owners : Array(String) | Nil = nil,
      @filters : Array(Filter) | Nil = nil,
      @next_token : String | Nil = nil,
      @max_results : Int32 | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      (@fpga_image_ids || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}FpgaImageId.#{i}", item}
      end

      (@owners || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}Owner.#{i}", item}
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
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
        fpga_image_ids: node.xpath_nodes("*[local-name()='FpgaImageId']/*[local-name()='item']").map { |n| n.content },
        owners: node.xpath_nodes("*[local-name()='Owner']/*[local-name()='Owner']").map { |n| n.content },
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
        raise Core::ValidationError.new("MaxResults value must be <= 1000") if value > 1000
      end
    end

    def_equals_and_hash(@dry_run, @fpga_image_ids, @owners, @filters, @next_token, @max_results)
  end
end
