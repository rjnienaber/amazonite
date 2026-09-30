private alias Core = Amazonite::Core

module Amazonite::EC2
  class ListVolumesInRecycleBinRequest
    # The IDs of the volumes to list. Omit this parameter to list all of the volumes that are in the
    # Recycle Bin.
    property volume_ids : Array(String) | Nil

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The maximum number of items to return for this request. To get the next page of items, make
    # another request with the token returned in the output. For more information, see
    # [Pagination](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/Query-Requests.html#api-pagination).
    #
    # Valid range: 5 - 500
    property max_results : Int32 | Nil

    # The token returned from a previous paginated request. Pagination continues from the end of the
    # items returned by the previous request.
    property next_token : String | Nil

    def initialize(
      @volume_ids : Array(String) | Nil = nil,
      @dry_run : Bool | Nil = nil,
      @max_results : Int32 | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@volume_ids || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}VolumeId.#{i}", item}
      end

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      if value = @max_results
        params << {"#{prefix}MaxResults", value.to_s}
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        volume_ids: node.xpath_nodes("*[local-name()='VolumeId']/*[local-name()='VolumeId']").map { |n| n.content },
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
        max_results: Core::XMLValue.i32(node.xpath_node("*[local-name()='MaxResults']")),
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='NextToken']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@volume_ids, @dry_run, @max_results, @next_token)
  end
end
