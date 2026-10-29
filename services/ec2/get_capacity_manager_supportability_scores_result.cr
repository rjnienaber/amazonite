private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  class GetCapacityManagerSupportabilityScoresResult
    # The score for all instance type and Availability Zone combinations in the request together. A
    # `high` aggregate score with lower individual scores means that no single combination can support
    # the full request, but the combinations together can.
    property aggregate_score : SupportabilityScore | Nil

    # The score for each instance type and Availability Zone combination in the request.
    property capacity_manager_supportability_scores : Array(CapacityManagerSupportabilityScore) | Nil

    def initialize(
      @aggregate_score : SupportabilityScore | Nil = nil,
      @capacity_manager_supportability_scores : Array(CapacityManagerSupportabilityScore) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @aggregate_score
        params << {"#{prefix}AggregateScore", value.to_json_object_key}
      end

      (@capacity_manager_supportability_scores || [] of CapacityManagerSupportabilityScore).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}CapacityManagerSupportabilityScoreSet.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        aggregate_score: (n = node.xpath_node("*[local-name()='aggregateScore']")) ? AEC::SupportabilityScore.from_json_object_key?(n.content) : nil,
        capacity_manager_supportability_scores: node.xpath_nodes("*[local-name()='capacityManagerSupportabilityScoreSet']/*[local-name()='item']").map { |n| CapacityManagerSupportabilityScore.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @capacity_manager_supportability_scores
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@aggregate_score, @capacity_manager_supportability_scores)
  end
end
