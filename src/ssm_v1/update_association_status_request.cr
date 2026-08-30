module Amazonite::SsmV1
  class UpdateAssociationStatusRequest
    include JSON::Serializable

    # The name of the SSM document.
    @[JSON::Field(key: "Name")]
    property name : String

    # The managed node ID.
    @[JSON::Field(key: "InstanceId")]
    property instance_id : String

    # The association status.
    @[JSON::Field(key: "AssociationStatus")]
    property association_status : AssociationStatus

    def initialize(
      @name : String,
      @instance_id : String,
      @association_status : AssociationStatus,
    )
    end

    def_equals_and_hash(@name, @instance_id, @association_status)
  end
end
