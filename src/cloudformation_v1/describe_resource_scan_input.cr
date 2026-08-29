private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class DescribeResourceScanInput
    property resource_scan_id : String

    def initialize(
      @resource_scan_id : String,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}ResourceScanId", @resource_scan_id}
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        resource_scan_id: Core::XMLValue.string(node.xpath_node("*[local-name()='ResourceScanId']")).not_nil!,
      )
    end
  end
end
