private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # The maximum price per unit hour that you are willing to pay for a Spot Instance. We do not
  # recommend using this parameter because it can lead to increased interruptions. If you do not
  # specify this parameter, you will pay the current Spot price.
  #
  # If you specify a maximum price, your instances will be interrupted more frequently than if you
  # do not specify this parameter.
  class SpotPrice
    # The Availability Zone.
    property availability_zone : String | Nil

    # The ID of the Availability Zone.
    property availability_zone_id : String | Nil

    # The instance type.
    property instance_type : InstanceType | Nil

    # A general description of the AMI.
    property product_description : RIProductDescription | Nil

    # The maximum price per unit hour that you are willing to pay for a Spot Instance. We do not
    # recommend using this parameter because it can lead to increased interruptions. If you do not
    # specify this parameter, you will pay the current Spot price.
    #
    # If you specify a maximum price, your instances will be interrupted more frequently than if you
    # do not specify this parameter.
    property spot_price : String | Nil

    # The date and time the request was created, in UTC format (for example,
    # *YYYY*-*MM*-*DD*T*HH*:*MM*:*SS*Z).
    property timestamp : Time | Nil

    def initialize(
      @availability_zone : String | Nil = nil,
      @availability_zone_id : String | Nil = nil,
      @instance_type : InstanceType | Nil = nil,
      @product_description : RIProductDescription | Nil = nil,
      @spot_price : String | Nil = nil,
      @timestamp : Time | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @availability_zone
        params << {"#{prefix}AvailabilityZone", value}
      end

      if value = @availability_zone_id
        params << {"#{prefix}AvailabilityZoneId", value}
      end

      if value = @instance_type
        params << {"#{prefix}InstanceType", value.to_json_object_key}
      end

      if value = @product_description
        params << {"#{prefix}ProductDescription", value.to_json_object_key}
      end

      if value = @spot_price
        params << {"#{prefix}SpotPrice", value}
      end

      if value = @timestamp
        params << {"#{prefix}Timestamp", Core::QueryValue.time(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        availability_zone: Core::XMLValue.string(node.xpath_node("*[local-name()='availabilityZone']")),
        availability_zone_id: Core::XMLValue.string(node.xpath_node("*[local-name()='availabilityZoneId']")),
        instance_type: (n = node.xpath_node("*[local-name()='instanceType']")) ? AEC::InstanceType.from_json_object_key?(n.content) : nil,
        product_description: (n = node.xpath_node("*[local-name()='productDescription']")) ? AEC::RIProductDescription.from_json_object_key?(n.content) : nil,
        spot_price: Core::XMLValue.string(node.xpath_node("*[local-name()='spotPrice']")),
        timestamp: Core::XMLValue.time(node.xpath_node("*[local-name()='timestamp']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@availability_zone, @availability_zone_id, @instance_type, @product_description, @spot_price, @timestamp)
  end
end
