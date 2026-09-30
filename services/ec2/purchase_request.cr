private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a request to purchase Scheduled Instances.
  class PurchaseRequest
    # The number of instances.
    property instance_count : Int32

    # The purchase token.
    property purchase_token : String

    def initialize(
      @instance_count : Int32,
      @purchase_token : String,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}InstanceCount", @instance_count.to_s}

      params << {"#{prefix}PurchaseToken", @purchase_token}
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        instance_count: Core::XMLValue.i32(node.xpath_node("*[local-name()='InstanceCount']")).not_nil!,
        purchase_token: Core::XMLValue.string(node.xpath_node("*[local-name()='PurchaseToken']")).not_nil!,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@instance_count, @purchase_token)
  end
end
