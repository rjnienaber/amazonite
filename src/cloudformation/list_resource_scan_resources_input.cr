private alias Core = Amazonite::Core

module Amazonite::CloudFormation
  class ListResourceScanResourcesInput
    # The Amazon Resource Name (ARN) of the resource scan.
    property resource_scan_id : String

    # If specified, the returned resources will have the specified resource identifier (or one of them
    # in the case where the resource has multiple identifiers).
    property resource_identifier : String | Nil

    # If specified, the returned resources will be of any of the resource types with the specified
    # prefix.
    property resource_type_prefix : String | Nil

    # If specified, the returned resources will have a matching tag key.
    property tag_key : String | Nil

    # If specified, the returned resources will have a matching tag value.
    property tag_value : String | Nil

    # The token for the next set of items to return. (You received this token from a previous call.)
    property next_token : String | Nil

    # If the number of available results exceeds this maximum, the response includes a `NextToken`
    # value that you can use for the `NextToken` parameter to get the next set of results. By default
    # the `ListResourceScanResources` API action will return at most 100 results in each response. The
    # maximum value is 100.
    property max_results : Int32 | Nil

    def initialize(
      @resource_scan_id : String,
      @resource_identifier : String | Nil = nil,
      @resource_type_prefix : String | Nil = nil,
      @tag_key : String | Nil = nil,
      @tag_value : String | Nil = nil,
      @next_token : String | Nil = nil,
      @max_results : Int32 | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}ResourceScanId", @resource_scan_id}

      if value = @resource_identifier
        params << {"#{prefix}ResourceIdentifier", value}
      end

      if value = @resource_type_prefix
        params << {"#{prefix}ResourceTypePrefix", value}
      end

      if value = @tag_key
        params << {"#{prefix}TagKey", value}
      end

      if value = @tag_value
        params << {"#{prefix}TagValue", value}
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
        resource_scan_id: Core::XMLValue.string(node.xpath_node("*[local-name()='ResourceScanId']")).not_nil!,
        resource_identifier: Core::XMLValue.string(node.xpath_node("*[local-name()='ResourceIdentifier']")),
        resource_type_prefix: Core::XMLValue.string(node.xpath_node("*[local-name()='ResourceTypePrefix']")),
        tag_key: Core::XMLValue.string(node.xpath_node("*[local-name()='TagKey']")),
        tag_value: Core::XMLValue.string(node.xpath_node("*[local-name()='TagValue']")),
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='NextToken']")),
        max_results: Core::XMLValue.i32(node.xpath_node("*[local-name()='MaxResults']")),
      )
    end

    def validate! : Nil
      if value = @tag_key
        raise Core::ValidationError.new("TagKey length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("TagKey length must be <= 128") if value.size > 128
      end

      if value = @tag_value
        raise Core::ValidationError.new("TagValue length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("TagValue length must be <= 256") if value.size > 256
      end

      if value = @next_token
        raise Core::ValidationError.new("NextToken length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("NextToken length must be <= 1024") if value.size > 1024
      end
    end

    def_equals_and_hash(@resource_scan_id, @resource_identifier, @resource_type_prefix, @tag_key, @tag_value, @next_token, @max_results)
  end
end
