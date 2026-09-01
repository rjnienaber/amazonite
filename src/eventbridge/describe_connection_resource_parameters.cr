private alias Core = Amazonite::Core

module Amazonite::EventBridge
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

    def validate! : Nil
      if value = @resource_configuration_arn
        raise Core::ValidationError.new("ResourceConfigurationArn length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("ResourceConfigurationArn length must be <= 2048") if value.size > 2048
        raise Core::ValidationError.new("ResourceConfigurationArn does not match the required pattern") unless value.matches?(Regex.new("^(?:^arn:[a-z0-9\\-]+:vpc-lattice:[a-zA-Z0-9\\-]+:\\d{12}:resourceconfiguration/rcfg-[0-9a-z]{17}$|^$)$"))
      end

      if value = @resource_association_arn
        raise Core::ValidationError.new("ResourceAssociationArn length must be >= 17") if value.size < 17
        raise Core::ValidationError.new("ResourceAssociationArn length must be <= 2048") if value.size > 2048
        raise Core::ValidationError.new("ResourceAssociationArn does not match the required pattern") unless value.matches?(Regex.new("^arn:[a-z0-9\\\\-]+:vpc-lattice:[a-zA-Z0-9\\\\-]+:\\\\d{12}:servicenetworkresourceassociation/snra-[0-9a-z]{17}$"))
      end
    end

    def_equals_and_hash(@resource_configuration_arn, @resource_association_arn)
  end
end
