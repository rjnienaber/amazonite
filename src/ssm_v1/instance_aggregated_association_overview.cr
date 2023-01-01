module Amazonite::SsmV1
  class InstanceAggregatedAssociationOverview
    include JSON::Serializable

    @[JSON::Field(key: "DetailedStatus")]
    property detailed_status : String | Nil

    @[JSON::Field(key: "InstanceAssociationStatusAggregatedCount")]
    property instance_association_status_aggregated_count : Hash(String, Int32) | Nil

    def initialize(
      @detailed_status : String | Nil = nil,
      @instance_association_status_aggregated_count : Hash(String, Int32) | Nil = nil
    )
    end
  end
end
