private alias Core = Amazonite::Core

module Amazonite::EC2
  class GetSpotPlacementScoresResult
    # The Spot placement score for the top 10 Regions or Availability Zones, scored on a scale from 1
    # to 10. Each score reflects how likely it is that each Region or Availability Zone will succeed
    # at fulfilling the specified target capacity *at the time of the Spot placement score request*. A
    # score of `10` means that your Spot capacity request is highly likely to succeed in that Region
    # or Availability Zone.
    #
    # If you request a Spot placement score for Regions, a high score assumes that your fleet request
    # will be configured to use all Availability Zones and the `capacity-optimized` allocation
    # strategy. If you request a Spot placement score for Availability Zones, a high score assumes
    # that your fleet request will be configured to use a single Availability Zone and the
    # `capacity-optimized` allocation strategy.
    #
    # Different Regions or Availability Zones might return the same score.
    #
    # The Spot placement score serves as a recommendation only. No score guarantees that your Spot
    # request will be fully or partially fulfilled.
    property spot_placement_scores : Array(SpotPlacementScore) | Nil

    # The token to include in another request to get the next page of items. This value is `null` when
    # there are no more items to return.
    property next_token : String | Nil

    def initialize(
      @spot_placement_scores : Array(SpotPlacementScore) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@spot_placement_scores || [] of SpotPlacementScore).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}SpotPlacementScoreSet.#{i}."))
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        spot_placement_scores: node.xpath_nodes("*[local-name()='spotPlacementScoreSet']/*[local-name()='item']").map { |n| SpotPlacementScore.from_xml(n) },
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='nextToken']")),
      )
    end

    def validate! : Nil
      if value = @spot_placement_scores
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@spot_placement_scores, @next_token)
  end
end
