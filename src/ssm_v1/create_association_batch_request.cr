private alias Core = Amazonite::Core

module Amazonite::SsmV1
  class CreateAssociationBatchRequest
    include JSON::Serializable

    # One or more associations.
    @[JSON::Field(key: "Entries")]
    property entries : Array(CreateAssociationBatchRequestEntry) = [] of CreateAssociationBatchRequestEntry

    # A role used by association to take actions on your behalf. State Manager will assume this role
    # and call required APIs when dispatching configurations to nodes. If not specified, [
    # service-linked role for Systems
    # Manager](https://docs.aws.amazon.com/systems-manager/latest/userguide/using-service-linked-roles.html)
    # will be used by default.
    #
    # It is recommended that you define a custom IAM role so that you have full control of the
    # permissions that State Manager has when taking actions on your behalf.
    #
    # Service-linked role support in State Manager is being phased out. Associations relying on
    # service-linked role may require updates in the future to continue functioning properly.
    @[JSON::Field(key: "AssociationDispatchAssumeRole")]
    property association_dispatch_assume_role : String | Nil

    def initialize(
      @entries : Array(CreateAssociationBatchRequestEntry),
      @association_dispatch_assume_role : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @entries
        raise Core::ValidationError.new("Entries must have at least 1 item(s)") if value.size < 1
        value.each(&.validate!)
      end

      if value = @association_dispatch_assume_role
        raise Core::ValidationError.new("AssociationDispatchAssumeRole length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("AssociationDispatchAssumeRole length must be <= 512") if value.size > 512
        raise Core::ValidationError.new("AssociationDispatchAssumeRole does not match the required pattern") unless value.matches?(Regex.new("^arn:aws(-[^:]+)?:iam::[0-9]{12}:role/.+$"))
      end
    end

    def_equals_and_hash(@entries, @association_dispatch_assume_role)
  end
end
