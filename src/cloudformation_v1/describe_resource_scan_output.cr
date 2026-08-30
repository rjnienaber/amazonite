private alias ACF = Amazonite::CloudFormationV1
private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class DescribeResourceScanOutput
    # The Amazon Resource Name (ARN) of the resource scan. The format is
    # `arn:${Partition}:cloudformation:${Region}:${Account}:resourceScan/${Id}`. An example is
    # `arn:aws:cloudformation:*us-east-1*:*123456789012*:resourceScan/*f5b490f7-7ed4-428a-aa06-31ff25db0772*
    # `.
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

    # The list of resource types for the specified scan. Resource types are only available for scans
    # with a `Status` set to `COMPLETE` or `FAILED `.
    property resource_types : Array(String) | Nil

    # The number of resources that were listed. This is only available for scans with a `Status` set
    # to `COMPLETE`, `EXPIRED`, or `FAILED `.
    property resources_scanned : Int32 | Nil

    # The number of resources that were read. This is only available for scans with a `Status` set to
    # `COMPLETE`, `EXPIRED`, or `FAILED`.
    #
    # This field may be 0 if the resource scan failed with a `ResourceScanLimitExceededException`.
    property resources_read : Int32 | Nil

    # The scan filters that were used.
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

    def_equals_and_hash(@resource_scan_id, @status, @status_reason, @start_time, @end_time, @percentage_completed, @resource_types, @resources_scanned, @resources_read, @scan_filters)
  end
end
