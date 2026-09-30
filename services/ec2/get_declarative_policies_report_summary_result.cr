private alias Core = Amazonite::Core

module Amazonite::EC2
  class GetDeclarativePoliciesReportSummaryResult
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

    # The total number of accounts associated with the specified `targetId`.
    property number_of_accounts : Int32 | Nil

    # The number of accounts where attributes could not be retrieved in any Region.
    property number_of_failed_accounts : Int32 | Nil

    # The attributes described in the report.
    property attribute_summaries : Array(AttributeSummary) | Nil

    def initialize(
      @report_id : String | Nil = nil,
      @s3_bucket : String | Nil = nil,
      @s3_prefix : String | Nil = nil,
      @target_id : String | Nil = nil,
      @start_time : Time | Nil = nil,
      @end_time : Time | Nil = nil,
      @number_of_accounts : Int32 | Nil = nil,
      @number_of_failed_accounts : Int32 | Nil = nil,
      @attribute_summaries : Array(AttributeSummary) | Nil = nil,
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

      if value = @number_of_accounts
        params << {"#{prefix}NumberOfAccounts", value.to_s}
      end

      if value = @number_of_failed_accounts
        params << {"#{prefix}NumberOfFailedAccounts", value.to_s}
      end

      (@attribute_summaries || [] of AttributeSummary).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}AttributeSummarySet.#{i}."))
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
        number_of_accounts: Core::XMLValue.i32(node.xpath_node("*[local-name()='numberOfAccounts']")),
        number_of_failed_accounts: Core::XMLValue.i32(node.xpath_node("*[local-name()='numberOfFailedAccounts']")),
        attribute_summaries: node.xpath_nodes("*[local-name()='attributeSummarySet']/*[local-name()='item']").map { |n| AttributeSummary.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @attribute_summaries
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@report_id, @s3_bucket, @s3_prefix, @target_id, @start_time, @end_time, @number_of_accounts, @number_of_failed_accounts, @attribute_summaries)
  end
end
