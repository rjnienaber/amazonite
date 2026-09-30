private alias Core = Amazonite::Core

module Amazonite::EC2
  # A single entry in an image usage report, detailing how an image is being used by a specific
  # Amazon Web Services account and resource type.
  class ImageUsageReportEntry
    # The type of resource (`ec2:Instance` or `ec2:LaunchTemplate`).
    property resource_type : String | Nil

    # The ID of the report.
    property report_id : String | Nil

    # The number of times resources of this type reference this image in the account.
    property usage_count : Int64 | Nil

    # The ID of the account that uses the image.
    property account_id : String | Nil

    # The ID of the image.
    property image_id : String | Nil

    # The date and time the report creation was initiated.
    property report_creation_time : Time | Nil

    def initialize(
      @resource_type : String | Nil = nil,
      @report_id : String | Nil = nil,
      @usage_count : Int64 | Nil = nil,
      @account_id : String | Nil = nil,
      @image_id : String | Nil = nil,
      @report_creation_time : Time | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @resource_type
        params << {"#{prefix}ResourceType", value}
      end

      if value = @report_id
        params << {"#{prefix}ReportId", value}
      end

      if value = @usage_count
        params << {"#{prefix}UsageCount", value.to_s}
      end

      if value = @account_id
        params << {"#{prefix}AccountId", value}
      end

      if value = @image_id
        params << {"#{prefix}ImageId", value}
      end

      if value = @report_creation_time
        params << {"#{prefix}ReportCreationTime", Core::QueryValue.time(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        resource_type: Core::XMLValue.string(node.xpath_node("*[local-name()='resourceType']")),
        report_id: Core::XMLValue.string(node.xpath_node("*[local-name()='reportId']")),
        usage_count: Core::XMLValue.i64(node.xpath_node("*[local-name()='usageCount']")),
        account_id: Core::XMLValue.string(node.xpath_node("*[local-name()='accountId']")),
        image_id: Core::XMLValue.string(node.xpath_node("*[local-name()='imageId']")),
        report_creation_time: Core::XMLValue.time(node.xpath_node("*[local-name()='reportCreationTime']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@resource_type, @report_id, @usage_count, @account_id, @image_id, @report_creation_time)
  end
end
