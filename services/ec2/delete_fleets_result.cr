private alias Core = Amazonite::Core

module Amazonite::EC2
  class DeleteFleetsResult
    # Information about the EC2 Fleets that are successfully deleted.
    property successful_fleet_deletions : Array(DeleteFleetSuccessItem) | Nil

    # Information about the EC2 Fleets that are not successfully deleted.
    property unsuccessful_fleet_deletions : Array(DeleteFleetErrorItem) | Nil

    def initialize(
      @successful_fleet_deletions : Array(DeleteFleetSuccessItem) | Nil = nil,
      @unsuccessful_fleet_deletions : Array(DeleteFleetErrorItem) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@successful_fleet_deletions || [] of DeleteFleetSuccessItem).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}SuccessfulFleetDeletionSet.#{i}."))
      end

      (@unsuccessful_fleet_deletions || [] of DeleteFleetErrorItem).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}UnsuccessfulFleetDeletionSet.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        successful_fleet_deletions: node.xpath_nodes("*[local-name()='successfulFleetDeletionSet']/*[local-name()='item']").map { |n| DeleteFleetSuccessItem.from_xml(n) },
        unsuccessful_fleet_deletions: node.xpath_nodes("*[local-name()='unsuccessfulFleetDeletionSet']/*[local-name()='item']").map { |n| DeleteFleetErrorItem.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @successful_fleet_deletions
        value.each(&.validate!)
      end

      if value = @unsuccessful_fleet_deletions
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@successful_fleet_deletions, @unsuccessful_fleet_deletions)
  end
end
