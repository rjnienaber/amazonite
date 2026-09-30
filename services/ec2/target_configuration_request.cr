private alias Core = Amazonite::Core

module Amazonite::EC2
  # Details about the target configuration.
  class TargetConfigurationRequest
    # The number of instances the Convertible Reserved Instance offering can be applied to. This
    # parameter is reserved and cannot be specified in a request
    property instance_count : Int32 | Nil

    # The Convertible Reserved Instance offering ID.
    property offering_id : String

    def initialize(
      @offering_id : String,
      @instance_count : Int32 | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @instance_count
        params << {"#{prefix}InstanceCount", value.to_s}
      end

      params << {"#{prefix}OfferingId", @offering_id}
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        instance_count: Core::XMLValue.i32(node.xpath_node("*[local-name()='InstanceCount']")),
        offering_id: Core::XMLValue.string(node.xpath_node("*[local-name()='OfferingId']")).not_nil!,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@instance_count, @offering_id)
  end
end
