private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a message about an Availability Zone, Local Zone, or Wavelength Zone.
  class AvailabilityZoneMessage
    # The message about the Availability Zone, Local Zone, or Wavelength Zone.
    property message : String | Nil

    def initialize(
      @message : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @message
        params << {"#{prefix}Message", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        message: Core::XMLValue.string(node.xpath_node("*[local-name()='message']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@message)
  end
end
