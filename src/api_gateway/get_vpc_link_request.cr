module Amazonite::ApiGateway
  # Gets a specified VPC link under the caller's account in a region.
  class GetVpcLinkRequest
    include JSON::Serializable

    # The identifier of the VpcLink. It is used in an Integration to reference this VpcLink.
    @[JSON::Field(key: "vpcLinkId", ignore: true)]
    property vpc_link_id : String = ""

    def initialize(
      @vpc_link_id : String,
    )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@vpc_link_id)
  end
end
