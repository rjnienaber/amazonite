private alias Core = Amazonite::Core

module Amazonite::Ssm
  class AssociateOpsItemRelatedItemRequest
    include JSON::Serializable

    # The ID of the OpsItem to which you want to associate a resource as a related item.
    @[JSON::Field(key: "OpsItemId")]
    property ops_item_id : String

    # The type of association that you want to create between an OpsItem and a resource. OpsCenter
    # supports `IsParentOf` and `RelatesTo` association types.
    @[JSON::Field(key: "AssociationType")]
    property association_type : String

    # The type of resource that you want to associate with an OpsItem. OpsCenter supports the
    # following types:
    #
    # `AWS::SSMIncidents::IncidentRecord`: an Incident Manager incident.
    #
    # `AWS::SSM::Document`: a Systems Manager (SSM) document.
    @[JSON::Field(key: "ResourceType")]
    property resource_type : String

    # The Amazon Resource Name (ARN) of the Amazon Web Services resource that you want to associate
    # with the OpsItem.
    @[JSON::Field(key: "ResourceUri")]
    property resource_uri : String

    def initialize(
      @ops_item_id : String,
      @association_type : String,
      @resource_type : String,
      @resource_uri : String,
    )
    end

    def validate! : Nil
      if value = @ops_item_id
        raise Core::ValidationError.new("OpsItemId does not match the required pattern") unless value.matches?(Regex.new("^(oi)-[0-9a-f]{12}$"))
      end
    end

    def_equals_and_hash(@ops_item_id, @association_type, @resource_type, @resource_uri)
  end
end
