module Amazonite::SsmV1
  # Information about the association.
  class AssociationOverview
    include JSON::Serializable

    # The status of the association. Status can be: Pending, Success, or Failed.
    @[JSON::Field(key: "Status")]
    property status : String | Nil

    # A detailed status of the association.
    @[JSON::Field(key: "DetailedStatus")]
    property detailed_status : String | Nil

    # Returns the number of targets for the association status. For example, if you created an
    # association with two managed nodes, and one of them was successful, this would return the count
    # of managed nodes by status.
    @[JSON::Field(key: "AssociationStatusAggregatedCount")]
    property association_status_aggregated_count : Hash(String, Int32) | Nil

    def initialize(
      @status : String | Nil = nil,
      @detailed_status : String | Nil = nil,
      @association_status_aggregated_count : Hash(String, Int32) | Nil = nil,
    )
    end
  end
end
