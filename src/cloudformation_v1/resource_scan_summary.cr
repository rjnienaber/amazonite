private alias ACF = Amazonite::CloudFormationV1
private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class ResourceScanSummary
    property resource_scan_id : String | Nil

    property status : ResourceScanStatus | Nil

    property status_reason : String | Nil

    property start_time : Time | Nil

    property end_time : Time | Nil

    property percentage_completed : Float64 | Nil

    property scan_type : ScanType | Nil

    def initialize(
      @resource_scan_id : String | Nil = nil,
      @status : ResourceScanStatus | Nil = nil,
      @status_reason : String | Nil = nil,
      @start_time : Time | Nil = nil,
      @end_time : Time | Nil = nil,
      @percentage_completed : Float64 | Nil = nil,
      @scan_type : ScanType | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @resource_scan_id
        params << {"#{prefix}ResourceScanId", value}
      end

      if value = @status
        params << {"#{prefix}Status", value.to_json_object_key}
      end

      if value = @status_reason
        params << {"#{prefix}StatusReason", value}
      end

      if value = @start_time
        params << {"#{prefix}StartTime", Core::QueryValue.time(value)}
      end

      if value = @end_time
        params << {"#{prefix}EndTime", Core::QueryValue.time(value)}
      end

      if value = @percentage_completed
        params << {"#{prefix}PercentageCompleted", value.to_s}
      end

      if value = @scan_type
        params << {"#{prefix}ScanType", value.to_json_object_key}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        resource_scan_id: Core::XMLValue.string(node.xpath_node("*[local-name()='ResourceScanId']")),
        status: (n = node.xpath_node("*[local-name()='Status']")) ? ACF::ResourceScanStatus.from_json_object_key?(n.content) : nil,
        status_reason: Core::XMLValue.string(node.xpath_node("*[local-name()='StatusReason']")),
        start_time: Core::XMLValue.time(node.xpath_node("*[local-name()='StartTime']")),
        end_time: Core::XMLValue.time(node.xpath_node("*[local-name()='EndTime']")),
        percentage_completed: Core::XMLValue.f64(node.xpath_node("*[local-name()='PercentageCompleted']")),
        scan_type: (n = node.xpath_node("*[local-name()='ScanType']")) ? ACF::ScanType.from_json_object_key?(n.content) : nil,
      )
    end
  end
end
