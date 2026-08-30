private alias AAG = Amazonite::ApiGatewayV1

module Amazonite::ApiGatewayV1
  # An API Gateway VPC link for a RestApi to access resources in an Amazon Virtual Private Cloud
  # (VPC).
  class VpcLink
    include JSON::Serializable

    # The identifier of the VpcLink. It is used in an Integration to reference this VpcLink.
    @[JSON::Field(key: "id")]
    property id : String | Nil

    # The name used to label and identify the VPC link.
    @[JSON::Field(key: "name")]
    property name : String | Nil

    # The description of the VPC link.
    @[JSON::Field(key: "description")]
    property description : String | Nil

    # The ARN of the network load balancer of the VPC targeted by the VPC link. The network load
    # balancer must be owned by the same Amazon Web Services account of the API owner.
    @[JSON::Field(key: "targetArns")]
    property target_arns : Array(String) | Nil

    # The status of the VPC link. The valid values are `AVAILABLE`, `PENDING`, `DELETING`, or
    # `FAILED`. Deploying an API will wait if the status is `PENDING` and will fail if the status is
    # `DELETING`.
    @[JSON::Field(key: "status", converter: AAG::VpcLinkStatus)]
    property status : VpcLinkStatus | Nil

    # A description about the VPC link status.
    @[JSON::Field(key: "statusMessage")]
    property status_message : String | Nil

    # The collection of tags. Each tag element is associated with a given resource.
    @[JSON::Field(key: "tags")]
    property tags : Hash(String, String) | Nil

    def initialize(
      @id : String | Nil = nil,
      @name : String | Nil = nil,
      @description : String | Nil = nil,
      @target_arns : Array(String) | Nil = nil,
      @status : VpcLinkStatus | Nil = nil,
      @status_message : String | Nil = nil,
      @tags : Hash(String, String) | Nil = nil,
    )
    end
  end
end
