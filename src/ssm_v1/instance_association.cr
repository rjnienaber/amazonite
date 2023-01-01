module Amazonite::SsmV1
  class InstanceAssociation
    include JSON::Serializable

    @[JSON::Field(key: "AssociationId")]
    property association_id : String | Nil

    @[JSON::Field(key: "InstanceId")]
    property instance_id : String | Nil

    @[JSON::Field(key: "Content")]
    property content : String | Nil

    @[JSON::Field(key: "AssociationVersion")]
    property association_version : String | Nil

    def initialize(
      @association_id : String | Nil = nil,
      @instance_id : String | Nil = nil,
      @content : String | Nil = nil,
      @association_version : String | Nil = nil
    )
    end
  end
end
