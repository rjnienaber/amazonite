private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class ListResourceScanResourcesInput
    property resource_scan_id : String

    property resource_identifier : String | Nil

    property resource_type_prefix : String | Nil

    property tag_key : String | Nil

    property tag_value : String | Nil

    property next_token : String | Nil

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
  end
end
