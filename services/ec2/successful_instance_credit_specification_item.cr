private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes the burstable performance instance whose credit option for CPU usage was successfully
  # modified.
  class SuccessfulInstanceCreditSpecificationItem
    # The ID of the instance.
    property instance_id : String | Nil

    def initialize(
      @instance_id : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @instance_id
        params << {"#{prefix}InstanceId", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        instance_id: Core::XMLValue.string(node.xpath_node("*[local-name()='instanceId']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@instance_id)
  end
end
