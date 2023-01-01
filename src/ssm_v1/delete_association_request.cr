module Amazonite::SsmV1
  class DeleteAssociationRequest
    include JSON::Serializable

    @[JSON::Field(key: "Name")]
    property name : String | Nil

    @[JSON::Field(key: "InstanceId")]
    property instance_id : String | Nil

    @[JSON::Field(key: "AssociationId")]
    property association_id : String | Nil

    def initialize(
      @name : String | Nil = nil,
      @instance_id : String | Nil = nil,
      @association_id : String | Nil = nil
    )
    end
  end
end
