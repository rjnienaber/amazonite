private alias ACF = Amazonite::CloudFormationV1
private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  # A summary of the resource scan. This is returned by the `ListResourceScan` API action.
  class ResourceScanSummary
    # The Amazon Resource Name (ARN) of the resource scan.
    property resource_scan_id : String | Nil

    # Status of the resource scan.
    #
    # IN_PROGRESS The resource scan is still in progress.
    #
    # COMPLETE The resource scan is complete.
    #
    # EXPIRED The resource scan has expired.
    #
    # FAILED The resource scan has failed.
    property status : ResourceScanStatus | Nil

    # The reason for the resource scan status, providing more information if a failure happened.
    property status_reason : String | Nil

    # The time that the resource scan was started.
    property start_time : Time | Nil

    # The time that the resource scan was finished.
    property end_time : Time | Nil

    # The percentage of the resource scan that has been completed.
    property percentage_completed : Float64 | Nil

    # The scan type that has been completed.
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
