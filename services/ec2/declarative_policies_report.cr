private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes the metadata of the account status report.
  class DeclarativePoliciesReport
    # The ID of the report.
    property report_id : String | Nil

    # The name of the Amazon S3 bucket where the report is located.
    property s3_bucket : String | Nil

    # The prefix for your S3 object.
    property s3_prefix : String | Nil

    # The root ID, organizational unit ID, or account ID.
    #
    # Format:
    #
    # - For root: `r-ab12`
    #
    # - For OU: `ou-ab12-cdef1234`
    #
    # - For account: `123456789012`
    property target_id : String | Nil

    # The time when the report generation started.
    property start_time : Time | Nil

    # The time when the report generation ended.
    property end_time : Time | Nil

    # The current status of the report.
    property status : ReportState | Nil

    # Any tags assigned to the report.
    property tags : Array(Tag) | Nil

    def initialize(
      @report_id : String | Nil = nil,
      @s3_bucket : String | Nil = nil,
      @s3_prefix : String | Nil = nil,
      @target_id : String | Nil = nil,
      @start_time : Time | Nil = nil,
      @end_time : Time | Nil = nil,
      @status : ReportState | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @report_id
        params << {"#{prefix}ReportId", value}
      end

      if value = @s3_bucket
        params << {"#{prefix}S3Bucket", value}
      end

      if value = @s3_prefix
        params << {"#{prefix}S3Prefix", value}
      end

      if value = @target_id
        params << {"#{prefix}TargetId", value}
      end

      if value = @start_time
        params << {"#{prefix}StartTime", Core::QueryValue.time(value)}
      end

      if value = @end_time
        params << {"#{prefix}EndTime", Core::QueryValue.time(value)}
      end

      if value = @status
        params << {"#{prefix}Status", value.to_json_object_key}
      end

      (@tags || [] of Tag).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSet.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        report_id: Core::XMLValue.string(node.xpath_node("*[local-name()='reportId']")),
        s3_bucket: Core::XMLValue.string(node.xpath_node("*[local-name()='s3Bucket']")),
        s3_prefix: Core::XMLValue.string(node.xpath_node("*[local-name()='s3Prefix']")),
        target_id: Core::XMLValue.string(node.xpath_node("*[local-name()='targetId']")),
        start_time: Core::XMLValue.time(node.xpath_node("*[local-name()='startTime']")),
        end_time: Core::XMLValue.time(node.xpath_node("*[local-name()='endTime']")),
        status: (n = node.xpath_node("*[local-name()='status']")) ? AEC::ReportState.from_json_object_key?(n.content) : nil,
        tags: node.xpath_nodes("*[local-name()='tagSet']/*[local-name()='item']").map { |n| Tag.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @tags
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@report_id, @s3_bucket, @s3_prefix, @target_id, @start_time, @end_time, @status, @tags)
  end
end
