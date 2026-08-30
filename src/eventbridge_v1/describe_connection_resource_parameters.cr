module Amazonite::EventBridgeV1
  # The parameters for EventBridge to use when invoking the resource endpoint.
  class DescribeConnectionResourceParameters
    include JSON::Serializable

    # The Amazon Resource Name (ARN) of the resource configuration for the private API.
    @[JSON::Field(key: "ResourceConfigurationArn")]
    property resource_configuration_arn : String

    # For connections to private APIs, the Amazon Resource Name (ARN) of the resource association
    # EventBridge created between the connection and the private API's resource configuration.
    #
    # For more information, see [ Managing service network resource associations for
    # connections](https://docs.aws.amazon.com/eventbridge/latest/userguide/connection-private.html#connection-private-snra)
    # in the * *Amazon EventBridge User Guide* *.
    @[JSON::Field(key: "ResourceAssociationArn")]
    property resource_association_arn : String

    def initialize(
      @resource_configuration_arn : String,
      @resource_association_arn : String,
    )
    end
  end
end
