private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class StartResourceScanOutput
    # The Amazon Resource Name (ARN) of the resource scan. The format is
    # `arn:${Partition}:cloudformation:${Region}:${Account}:resourceScan/${Id}`. An example is
    # `arn:aws:cloudformation:*us-east-1*:*123456789012*:resourceScan/*f5b490f7-7ed4-428a-aa06-31ff25db0772*
    # `.
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

    def validate! : Nil
    end

    def_equals_and_hash(@resource_scan_id)
  end
end
