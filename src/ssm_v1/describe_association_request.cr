module Amazonite::SsmV1
  class DescribeAssociationRequest
    include JSON::Serializable

    # The name of the SSM document.
    @[JSON::Field(key: "Name")]
    property name : String | Nil

    # The managed node ID.
    @[JSON::Field(key: "InstanceId")]
    property instance_id : String | Nil

    # The association ID for which you want information.
    @[JSON::Field(key: "AssociationId")]
    property association_id : String | Nil

    # Specify the association version to retrieve. To view the latest version, either specify
    # `$LATEST` for this parameter, or omit this parameter. To view a list of all associations for a
    # managed node, use ListAssociations. To get a list of versions for a specific association, use
    # ListAssociationVersions.
    @[JSON::Field(key: "AssociationVersion")]
    property association_version : String | Nil

    def initialize(
      @name : String | Nil = nil,
      @instance_id : String | Nil = nil,
      @association_id : String | Nil = nil,
      @association_version : String | Nil = nil,
    )
    end
  end
end
