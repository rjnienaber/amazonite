private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a Network Access Scope analysis.
  class NetworkInsightsAccessScopeAnalysis
    # The ID of the Network Access Scope analysis.
    property network_insights_access_scope_analysis_id : String | Nil

    # The Amazon Resource Name (ARN) of the Network Access Scope analysis.
    property network_insights_access_scope_analysis_arn : String | Nil

    # The ID of the Network Access Scope.
    property network_insights_access_scope_id : String | Nil

    # The status.
    property status : AnalysisStatus | Nil

    # The status message.
    property status_message : String | Nil

    # The warning message.
    property warning_message : String | Nil

    # The analysis start date.
    property start_date : Time | Nil

    # The analysis end date.
    property end_date : Time | Nil

    # Indicates whether there are findings.
    property findings_found : FindingsFound | Nil

    # The number of network interfaces analyzed.
    property analyzed_eni_count : Int32 | Nil

    # The tags.
    property tags : Array(Tag) | Nil

    def initialize(
      @network_insights_access_scope_analysis_id : String | Nil = nil,
      @network_insights_access_scope_analysis_arn : String | Nil = nil,
      @network_insights_access_scope_id : String | Nil = nil,
      @status : AnalysisStatus | Nil = nil,
      @status_message : String | Nil = nil,
      @warning_message : String | Nil = nil,
      @start_date : Time | Nil = nil,
      @end_date : Time | Nil = nil,
      @findings_found : FindingsFound | Nil = nil,
      @analyzed_eni_count : Int32 | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @network_insights_access_scope_analysis_id
        params << {"#{prefix}NetworkInsightsAccessScopeAnalysisId", value}
      end

      if value = @network_insights_access_scope_analysis_arn
        params << {"#{prefix}NetworkInsightsAccessScopeAnalysisArn", value}
      end

      if value = @network_insights_access_scope_id
        params << {"#{prefix}NetworkInsightsAccessScopeId", value}
      end

      if value = @status
        params << {"#{prefix}Status", value.to_json_object_key}
      end

      if value = @status_message
        params << {"#{prefix}StatusMessage", value}
      end

      if value = @warning_message
        params << {"#{prefix}WarningMessage", value}
      end

      if value = @start_date
        params << {"#{prefix}StartDate", Core::QueryValue.time(value)}
      end

      if value = @end_date
        params << {"#{prefix}EndDate", Core::QueryValue.time(value)}
      end

      if value = @findings_found
        params << {"#{prefix}FindingsFound", value.to_json_object_key}
      end

      if value = @analyzed_eni_count
        params << {"#{prefix}AnalyzedEniCount", value.to_s}
      end

      (@tags || [] of Tag).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSet.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        network_insights_access_scope_analysis_id: Core::XMLValue.string(node.xpath_node("*[local-name()='networkInsightsAccessScopeAnalysisId']")),
        network_insights_access_scope_analysis_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='networkInsightsAccessScopeAnalysisArn']")),
        network_insights_access_scope_id: Core::XMLValue.string(node.xpath_node("*[local-name()='networkInsightsAccessScopeId']")),
        status: (n = node.xpath_node("*[local-name()='status']")) ? AEC::AnalysisStatus.from_json_object_key?(n.content) : nil,
        status_message: Core::XMLValue.string(node.xpath_node("*[local-name()='statusMessage']")),
        warning_message: Core::XMLValue.string(node.xpath_node("*[local-name()='warningMessage']")),
        start_date: Core::XMLValue.time(node.xpath_node("*[local-name()='startDate']")),
        end_date: Core::XMLValue.time(node.xpath_node("*[local-name()='endDate']")),
        findings_found: (n = node.xpath_node("*[local-name()='findingsFound']")) ? AEC::FindingsFound.from_json_object_key?(n.content) : nil,
        analyzed_eni_count: Core::XMLValue.i32(node.xpath_node("*[local-name()='analyzedEniCount']")),
        tags: node.xpath_nodes("*[local-name()='tagSet']/*[local-name()='item']").map { |n| Tag.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @network_insights_access_scope_analysis_arn
        raise Core::ValidationError.new("NetworkInsightsAccessScopeAnalysisArn length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("NetworkInsightsAccessScopeAnalysisArn length must be <= 1283") if value.size > 1283
      end

      if value = @tags
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@network_insights_access_scope_analysis_id, @network_insights_access_scope_analysis_arn, @network_insights_access_scope_id, @status, @status_message, @warning_message, @start_date, @end_date, @findings_found, @analyzed_eni_count, @tags)
  end
end
