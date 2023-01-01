module Amazonite::SsmV1
  class UpdateAssociationStatusRequest
    include JSON::Serializable

    @[JSON::Field(key: "Name")]
    property name : String

    @[JSON::Field(key: "InstanceId")]
    property instance_id : String

    @[JSON::Field(key: "AssociationStatus")]
    property association_status : AssociationStatus

    def initialize(
      @name : String,
      @instance_id : String,
      @association_status : AssociationStatus
    )
    end
  end
end
