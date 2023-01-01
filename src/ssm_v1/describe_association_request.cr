module Amazonite::SsmV1
  class DescribeAssociationRequest
    include JSON::Serializable

    @[JSON::Field(key: "Name")]
    property name : String | Nil

    @[JSON::Field(key: "InstanceId")]
    property instance_id : String | Nil

    @[JSON::Field(key: "AssociationId")]
    property association_id : String | Nil

    @[JSON::Field(key: "AssociationVersion")]
    property association_version : String | Nil

    def initialize(
      @name : String | Nil = nil,
      @instance_id : String | Nil = nil,
      @association_id : String | Nil = nil,
      @association_version : String | Nil = nil
    )
    end
  end
end
