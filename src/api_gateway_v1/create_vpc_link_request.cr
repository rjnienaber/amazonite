module Amazonite::ApiGatewayV1
  # Creates a VPC link, under the caller's account in a selected region, in an asynchronous
  # operation that typically takes 2-4 minutes to complete and become operational. The caller must
  # have permissions to create and update VPC Endpoint services.
  class CreateVpcLinkRequest
    include JSON::Serializable

    # The name used to label and identify the VPC link.
    @[JSON::Field(key: "name")]
    property name : String

    # The description of the VPC link.
    @[JSON::Field(key: "description")]
    property description : String | Nil

    # The ARN of the network load balancer of the VPC targeted by the VPC link. The network load
    # balancer must be owned by the same Amazon Web Services account of the API owner.
    @[JSON::Field(key: "targetArns")]
    property target_arns : Array(String) = [] of String

    # The key-value map of strings. The valid character set is [a-zA-Z+-=._:/]. The tag key can be up
    # to 128 characters and must not start with `aws:`. The tag value can be up to 256 characters.
    @[JSON::Field(key: "tags")]
    property tags : Hash(String, String) | Nil

    def initialize(
      @name : String,
      @target_arns : Array(String),
      @description : String | Nil = nil,
      @tags : Hash(String, String) | Nil = nil,
    )
    end
  end
end
