module Amazonite::SsmV1
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
  end
end
