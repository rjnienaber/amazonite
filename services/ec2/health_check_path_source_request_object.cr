private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes the source for a health check path in a request. The source defines the subnet and
  # security group where a health check elastic network interface (ENI) is created to originate
  # health check traffic.
  class HealthCheckPathSourceRequestObject
    # The ID of the subnet for the source.
    property subnet_id : String | Nil

    # The ID of the security group for the source.
    property security_group_id : String | Nil

    def initialize(
      @subnet_id : String | Nil = nil,
      @security_group_id : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @subnet_id
        params << {"#{prefix}SubnetId", value}
      end

      if value = @security_group_id
        params << {"#{prefix}SecurityGroupId", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        subnet_id: Core::XMLValue.string(node.xpath_node("*[local-name()='SubnetId']")),
        security_group_id: Core::XMLValue.string(node.xpath_node("*[local-name()='SecurityGroupId']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@subnet_id, @security_group_id)
  end
end
