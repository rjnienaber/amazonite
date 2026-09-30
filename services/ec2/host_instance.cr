private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes an instance running on a Dedicated Host.
  class HostInstance
    # The ID of instance that is running on the Dedicated Host.
    property instance_id : String | Nil

    # The instance type (for example, `m3.medium`) of the running instance.
    property instance_type : String | Nil

    # The ID of the Amazon Web Services account that owns the instance.
    property owner_id : String | Nil

    def initialize(
      @instance_id : String | Nil = nil,
      @instance_type : String | Nil = nil,
      @owner_id : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @instance_id
        params << {"#{prefix}InstanceId", value}
      end

      if value = @instance_type
        params << {"#{prefix}InstanceType", value}
      end

      if value = @owner_id
        params << {"#{prefix}OwnerId", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        instance_id: Core::XMLValue.string(node.xpath_node("*[local-name()='instanceId']")),
        instance_type: Core::XMLValue.string(node.xpath_node("*[local-name()='instanceType']")),
        owner_id: Core::XMLValue.string(node.xpath_node("*[local-name()='ownerId']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@instance_id, @instance_type, @owner_id)
  end
end
