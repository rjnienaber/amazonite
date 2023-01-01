module Amazonite::SsmV1
  class AssociationOverview
    include JSON::Serializable

    @[JSON::Field(key: "Status")]
    property status : String | Nil

    @[JSON::Field(key: "DetailedStatus")]
    property detailed_status : String | Nil

    @[JSON::Field(key: "AssociationStatusAggregatedCount")]
    property association_status_aggregated_count : Hash(String, Int32) | Nil

    def initialize(
      @status : String | Nil = nil,
      @detailed_status : String | Nil = nil,
      @association_status_aggregated_count : Hash(String, Int32) | Nil = nil
    )
    end
  end
end
