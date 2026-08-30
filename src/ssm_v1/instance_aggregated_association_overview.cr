module Amazonite::SsmV1
  # Status information about the aggregated associations.
  class InstanceAggregatedAssociationOverview
    include JSON::Serializable

    # Detailed status information about the aggregated associations.
    @[JSON::Field(key: "DetailedStatus")]
    property detailed_status : String | Nil

    # The number of associations for the managed nodes.
    @[JSON::Field(key: "InstanceAssociationStatusAggregatedCount")]
    property instance_association_status_aggregated_count : Hash(String, Int32) | Nil

    def initialize(
      @detailed_status : String | Nil = nil,
      @instance_association_status_aggregated_count : Hash(String, Int32) | Nil = nil,
    )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@detailed_status, @instance_association_status_aggregated_count)
  end
end
