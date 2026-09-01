private alias Core = Amazonite::Core

module Amazonite::Ssm
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

    def validate! : Nil
      if value = @name
        raise Core::ValidationError.new("Name does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z0-9_\\-.:/]{3,128}$"))
      end

      if value = @instance_id
        raise Core::ValidationError.new("InstanceId does not match the required pattern") unless value.matches?(Regex.new("^(^i-(\\w{8}|\\w{17})$)|(^mi-\\w{17}$)$"))
      end

      if value = @association_status
        value.validate!
      end
    end

    def_equals_and_hash(@name, @instance_id, @association_status)
  end
end
