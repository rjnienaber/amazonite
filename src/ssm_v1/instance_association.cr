private alias Core = Amazonite::Core

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

    def validate! : Nil
      if value = @association_id
        raise Core::ValidationError.new("AssociationId does not match the required pattern") unless value.matches?(Regex.new("^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$"))
      end

      if value = @instance_id
        raise Core::ValidationError.new("InstanceId does not match the required pattern") unless value.matches?(Regex.new("^(^i-(\\w{8}|\\w{17})$)|(^mi-\\w{17}$)$"))
      end

      if value = @content
        raise Core::ValidationError.new("Content length must be >= 1") if value.size < 1
      end

      if value = @association_version
        raise Core::ValidationError.new("AssociationVersion does not match the required pattern") unless value.matches?(Regex.new("^([$]LATEST)|([1-9][0-9]*)$"))
      end
    end

    def_equals_and_hash(@association_id, @instance_id, @content, @association_version)
  end
end
