private alias Core = Amazonite::Core

module Amazonite::EC2
  # Information about the Convertible Reserved Instance offering.
  class TargetConfiguration
    # The number of instances the Convertible Reserved Instance offering can be applied to. This
    # parameter is reserved and cannot be specified in a request
    property instance_count : Int32 | Nil

    # The ID of the Convertible Reserved Instance offering.
    property offering_id : String | Nil

    def initialize(
      @instance_count : Int32 | Nil = nil,
      @offering_id : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @instance_count
        params << {"#{prefix}InstanceCount", value.to_s}
      end

      if value = @offering_id
        params << {"#{prefix}OfferingId", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        instance_count: Core::XMLValue.i32(node.xpath_node("*[local-name()='instanceCount']")),
        offering_id: Core::XMLValue.string(node.xpath_node("*[local-name()='offeringId']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@instance_count, @offering_id)
  end
end
