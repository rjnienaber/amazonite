private alias ACF = Amazonite::CloudFormationV1
private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class DescribeResourceScanOutput
    property resource_scan_id : String | Nil

    property status : ResourceScanStatus | Nil

    property status_reason : String | Nil

    property start_time : Time | Nil

    property end_time : Time | Nil

    property percentage_completed : Float64 | Nil

    property resource_types : Array(String) | Nil

    property resources_scanned : Int32 | Nil

    property resources_read : Int32 | Nil

    property scan_filters : Array(ScanFilter) | Nil

    def initialize(
      @resource_scan_id : String | Nil = nil,
      @status : ResourceScanStatus | Nil = nil,
      @status_reason : String | Nil = nil,
      @start_time : Time | Nil = nil,
      @end_time : Time | Nil = nil,
      @percentage_completed : Float64 | Nil = nil,
      @resource_types : Array(String) | Nil = nil,
      @resources_scanned : Int32 | Nil = nil,
      @resources_read : Int32 | Nil = nil,
      @scan_filters : Array(ScanFilter) | Nil = nil,
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

      (@resource_types || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}ResourceTypes.member.#{i}", item}
      end

      if value = @resources_scanned
        params << {"#{prefix}ResourcesScanned", value.to_s}
      end

      if value = @resources_read
        params << {"#{prefix}ResourcesRead", value.to_s}
      end

      (@scan_filters || [] of ScanFilter).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}ScanFilters.member.#{i}."))
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
        resource_types: node.xpath_nodes("*[local-name()='ResourceTypes']/*[local-name()='member']").map { |n| n.content },
        resources_scanned: Core::XMLValue.i32(node.xpath_node("*[local-name()='ResourcesScanned']")),
        resources_read: Core::XMLValue.i32(node.xpath_node("*[local-name()='ResourcesRead']")),
        scan_filters: node.xpath_nodes("*[local-name()='ScanFilters']/*[local-name()='member']").map { |n| ScanFilter.from_xml(n) },
      )
    end
  end
end
