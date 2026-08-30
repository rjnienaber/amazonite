private alias Core = Amazonite::Core

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

    def validate! : Nil
      if value = @name
        raise Core::ValidationError.new("Name does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z0-9_\\-.:/]{3,128}$"))
      end

      if value = @instance_id
        raise Core::ValidationError.new("InstanceId does not match the required pattern") unless value.matches?(Regex.new("^(^i-(\\w{8}|\\w{17})$)|(^mi-\\w{17}$)$"))
      end

      if value = @association_id
        raise Core::ValidationError.new("AssociationId does not match the required pattern") unless value.matches?(Regex.new("^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$"))
      end

      if value = @association_version
        raise Core::ValidationError.new("AssociationVersion does not match the required pattern") unless value.matches?(Regex.new("^([$]LATEST)|([1-9][0-9]*)$"))
      end
    end

    def_equals_and_hash(@name, @instance_id, @association_id, @association_version)
  end
end
