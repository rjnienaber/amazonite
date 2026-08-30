private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class DescribeResourceScanInput
    # The Amazon Resource Name (ARN) of the resource scan.
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

    def validate! : Nil
    end

    def_equals_and_hash(@resource_scan_id)
  end
end
