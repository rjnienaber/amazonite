private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class StartResourceScanOutput
    property resource_scan_id : String | Nil

    def initialize(
      @resource_scan_id : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @resource_scan_id
        params << {"#{prefix}ResourceScanId", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        resource_scan_id: Core::XMLValue.string(node.xpath_node("*[local-name()='ResourceScanId']")),
      )
    end
  end
end
