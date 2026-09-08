private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a network insights analysis.
  class NetworkInsightsAnalysis
    # The ID of the network insights analysis.
    property network_insights_analysis_id : String | Nil

    # The Amazon Resource Name (ARN) of the network insights analysis.
    property network_insights_analysis_arn : String | Nil

    # The ID of the path.
    property network_insights_path_id : String | Nil

    # The member accounts that contain resources that the path can traverse.
    property additional_accounts : Array(String) | Nil

    # The Amazon Resource Names (ARN) of the resources that the path must traverse.
    property filter_in_arns : Array(String) | Nil

    # The Amazon Resource Names (ARN) of the resources that the path must ignore.
    property filter_out_arns : Array(String) | Nil

    # The time the analysis started.
    property start_date : Time | Nil

    # The status of the network insights analysis.
    property status : AnalysisStatus | Nil

    # The status message, if the status is `failed`.
    property status_message : String | Nil

    # The warning message.
    property warning_message : String | Nil

    # Indicates whether the destination is reachable from the source.
    property network_path_found : Bool | Nil

    # The components in the path from source to destination.
    property forward_path_components : Array(PathComponent) | Nil

    # The components in the path from destination to source.
    property return_path_components : Array(PathComponent) | Nil

    # The explanations. For more information, see [Reachability Analyzer explanation
    # codes](https://docs.aws.amazon.com/vpc/latest/reachability/explanation-codes.html).
    property explanations : Array(Explanation) | Nil

    # Potential intermediate components.
    property alternate_path_hints : Array(AlternatePathHint) | Nil

    # Potential intermediate accounts.
    property suggested_accounts : Array(String) | Nil

    # The tags.
    property tags : Array(Tag) | Nil

    def initialize(
      @network_insights_analysis_id : String | Nil = nil,
      @network_insights_analysis_arn : String | Nil = nil,
      @network_insights_path_id : String | Nil = nil,
      @additional_accounts : Array(String) | Nil = nil,
      @filter_in_arns : Array(String) | Nil = nil,
      @filter_out_arns : Array(String) | Nil = nil,
      @start_date : Time | Nil = nil,
      @status : AnalysisStatus | Nil = nil,
      @status_message : String | Nil = nil,
      @warning_message : String | Nil = nil,
      @network_path_found : Bool | Nil = nil,
      @forward_path_components : Array(PathComponent) | Nil = nil,
      @return_path_components : Array(PathComponent) | Nil = nil,
      @explanations : Array(Explanation) | Nil = nil,
      @alternate_path_hints : Array(AlternatePathHint) | Nil = nil,
      @suggested_accounts : Array(String) | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @network_insights_analysis_id
        params << {"#{prefix}NetworkInsightsAnalysisId", value}
      end

      if value = @network_insights_analysis_arn
        params << {"#{prefix}NetworkInsightsAnalysisArn", value}
      end

      if value = @network_insights_path_id
        params << {"#{prefix}NetworkInsightsPathId", value}
      end

      (@additional_accounts || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}AdditionalAccountSet.#{i}", item}
      end

      (@filter_in_arns || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}FilterInArnSet.#{i}", item}
      end

      (@filter_out_arns || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}FilterOutArnSet.#{i}", item}
      end

      if value = @start_date
        params << {"#{prefix}StartDate", Core::QueryValue.time(value)}
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

      if value = @network_path_found
        params << {"#{prefix}NetworkPathFound", Core::QueryValue.bool(value)}
      end

      (@forward_path_components || [] of PathComponent).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}ForwardPathComponentSet.#{i}."))
      end

      (@return_path_components || [] of PathComponent).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}ReturnPathComponentSet.#{i}."))
      end

      (@explanations || [] of Explanation).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}ExplanationSet.#{i}."))
      end

      (@alternate_path_hints || [] of AlternatePathHint).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}AlternatePathHintSet.#{i}."))
      end

      (@suggested_accounts || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}SuggestedAccountSet.#{i}", item}
      end

      (@tags || [] of Tag).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSet.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        network_insights_analysis_id: Core::XMLValue.string(node.xpath_node("*[local-name()='networkInsightsAnalysisId']")),
        network_insights_analysis_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='networkInsightsAnalysisArn']")),
        network_insights_path_id: Core::XMLValue.string(node.xpath_node("*[local-name()='networkInsightsPathId']")),
        additional_accounts: node.xpath_nodes("*[local-name()='additionalAccountSet']/*[local-name()='item']").map { |n| n.content },
        filter_in_arns: node.xpath_nodes("*[local-name()='filterInArnSet']/*[local-name()='item']").map { |n| n.content },
        filter_out_arns: node.xpath_nodes("*[local-name()='filterOutArnSet']/*[local-name()='item']").map { |n| n.content },
        start_date: Core::XMLValue.time(node.xpath_node("*[local-name()='startDate']")),
        status: (n = node.xpath_node("*[local-name()='status']")) ? AEC::AnalysisStatus.from_json_object_key?(n.content) : nil,
        status_message: Core::XMLValue.string(node.xpath_node("*[local-name()='statusMessage']")),
        warning_message: Core::XMLValue.string(node.xpath_node("*[local-name()='warningMessage']")),
        network_path_found: Core::XMLValue.bool(node.xpath_node("*[local-name()='networkPathFound']")),
        forward_path_components: node.xpath_nodes("*[local-name()='forwardPathComponentSet']/*[local-name()='item']").map { |n| PathComponent.from_xml(n) },
        return_path_components: node.xpath_nodes("*[local-name()='returnPathComponentSet']/*[local-name()='item']").map { |n| PathComponent.from_xml(n) },
        explanations: node.xpath_nodes("*[local-name()='explanationSet']/*[local-name()='item']").map { |n| Explanation.from_xml(n) },
        alternate_path_hints: node.xpath_nodes("*[local-name()='alternatePathHintSet']/*[local-name()='item']").map { |n| AlternatePathHint.from_xml(n) },
        suggested_accounts: node.xpath_nodes("*[local-name()='suggestedAccountSet']/*[local-name()='item']").map { |n| n.content },
        tags: node.xpath_nodes("*[local-name()='tagSet']/*[local-name()='item']").map { |n| Tag.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @network_insights_analysis_arn
        raise Core::ValidationError.new("NetworkInsightsAnalysisArn length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("NetworkInsightsAnalysisArn length must be <= 1283") if value.size > 1283
      end

      if value = @forward_path_components
        value.each(&.validate!)
      end

      if value = @return_path_components
        value.each(&.validate!)
      end

      if value = @explanations
        value.each(&.validate!)
      end

      if value = @alternate_path_hints
        value.each(&.validate!)
      end

      if value = @tags
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@network_insights_analysis_id, @network_insights_analysis_arn, @network_insights_path_id, @additional_accounts, @filter_in_arns, @filter_out_arns, @start_date, @status, @status_message, @warning_message, @network_path_found, @forward_path_components, @return_path_components, @explanations, @alternate_path_hints, @suggested_accounts, @tags)
  end
end
