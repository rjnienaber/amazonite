private alias ACF = Amazonite::CloudFormationV1
private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class ListResourceScansInput
    property next_token : String | Nil

    property max_results : Int32 | Nil

    property scan_type_filter : ScanType | Nil

    def initialize(
      @next_token : String | Nil = nil,
      @max_results : Int32 | Nil = nil,
      @scan_type_filter : ScanType | Nil = nil,
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

      if value = @scan_type_filter
        params << {"#{prefix}ScanTypeFilter", value.to_json_object_key}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='NextToken']")),
        max_results: Core::XMLValue.i32(node.xpath_node("*[local-name()='MaxResults']")),
        scan_type_filter: (n = node.xpath_node("*[local-name()='ScanTypeFilter']")) ? ACF::ScanType.from_json_object_key?(n.content) : nil,
      )
    end
  end
end
