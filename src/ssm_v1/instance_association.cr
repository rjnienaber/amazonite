module Amazonite::SsmV1
  # One or more association documents on the managed node.
  class InstanceAssociation
    include JSON::Serializable

    # The association ID.
    @[JSON::Field(key: "AssociationId")]
    property association_id : String | Nil

    # The managed node ID.
    @[JSON::Field(key: "InstanceId")]
    property instance_id : String | Nil

    # The content of the association document for the managed nodes.
    @[JSON::Field(key: "Content")]
    property content : String | Nil

    # Version information for the association on the managed node.
    @[JSON::Field(key: "AssociationVersion")]
    property association_version : String | Nil

    def initialize(
      @association_id : String | Nil = nil,
      @instance_id : String | Nil = nil,
      @content : String | Nil = nil,
      @association_version : String | Nil = nil,
    )
    end

    def_equals_and_hash(@association_id, @instance_id, @content, @association_version)
  end
end
