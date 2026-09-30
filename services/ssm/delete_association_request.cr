private alias Core = Amazonite::Core

module Amazonite::Ssm
  class DeleteAssociationRequest
    include JSON::Serializable

    # The name of the SSM document.
    @[JSON::Field(key: "Name")]
    property name : String | Nil

    # The managed node ID.
    #
    # `InstanceId` has been deprecated. To specify a managed node ID for an association, use the
    # `Targets` parameter. Requests that include the parameter `InstanceID` with Systems Manager
    # documents (SSM documents) that use schema version 2.0 or later will fail. In addition, if you
    # use the parameter `InstanceId`, you can't use the parameters `AssociationName`,
    # `DocumentVersion`, `MaxErrors`, `MaxConcurrency`, `OutputLocation`, or `ScheduleExpression`. To
    # use these parameters, you must use the `Targets` parameter.
    @[JSON::Field(key: "InstanceId")]
    property instance_id : String | Nil

    # The association ID that you want to delete.
    @[JSON::Field(key: "AssociationId")]
    property association_id : String | Nil

    def initialize(
      @name : String | Nil = nil,
      @instance_id : String | Nil = nil,
      @association_id : String | Nil = nil,
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
    end

    def_equals_and_hash(@name, @instance_id, @association_id)
  end
end
