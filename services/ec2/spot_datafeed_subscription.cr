private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes the data feed for a Spot Instance.
  class SpotDatafeedSubscription
    # The name of the Amazon S3 bucket where the Spot Instance data feed is located.
    property bucket : String | Nil

    # The fault codes for the Spot Instance request, if any.
    property fault : SpotInstanceStateFault | Nil

    # The Amazon Web Services account ID of the account.
    property owner_id : String | Nil

    # The prefix for the data feed files.
    property prefix : String | Nil

    # The state of the Spot Instance data feed subscription.
    property state : DatafeedSubscriptionState | Nil

    def initialize(
      @bucket : String | Nil = nil,
      @fault : SpotInstanceStateFault | Nil = nil,
      @owner_id : String | Nil = nil,
      @prefix : String | Nil = nil,
      @state : DatafeedSubscriptionState | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @bucket
        params << {"#{prefix}Bucket", value}
      end

      if value = @fault
        params.concat(value.to_query_params("#{prefix}Fault."))
      end

      if value = @owner_id
        params << {"#{prefix}OwnerId", value}
      end

      if value = @prefix
        params << {"#{prefix}Prefix", value}
      end

      if value = @state
        params << {"#{prefix}State", value.to_json_object_key}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        bucket: Core::XMLValue.string(node.xpath_node("*[local-name()='bucket']")),
        fault: node.xpath_node("*[local-name()='fault']").try { |n| SpotInstanceStateFault.from_xml(n) },
        owner_id: Core::XMLValue.string(node.xpath_node("*[local-name()='ownerId']")),
        prefix: Core::XMLValue.string(node.xpath_node("*[local-name()='prefix']")),
        state: (n = node.xpath_node("*[local-name()='state']")) ? AEC::DatafeedSubscriptionState.from_json_object_key?(n.content) : nil,
      )
    end

    def validate! : Nil
      if value = @fault
        value.validate!
      end
    end

    def_equals_and_hash(@bucket, @fault, @owner_id, @prefix, @state)
  end
end
