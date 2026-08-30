private alias AS = Amazonite::SnsV1
private alias Core = Amazonite::Core

module Amazonite::SnsV1
  # A list of phone numbers and their metadata.
  class PhoneNumberInformation
    # The date and time when the phone number was created.
    property created_at : Time | Nil

    # The phone number.
    property phone_number : String | Nil

    # The status of the phone number.
    property status : String | Nil

    # The two-character code for the country or region, in ISO 3166-1 alpha-2 format.
    property iso_2_country_code : String | Nil

    # The list of supported routes.
    property route_type : RouteType | Nil

    # The capabilities of each phone number.
    property number_capabilities : Array(NumberCapability) | Nil

    def initialize(
      @created_at : Time | Nil = nil,
      @phone_number : String | Nil = nil,
      @status : String | Nil = nil,
      @iso_2_country_code : String | Nil = nil,
      @route_type : RouteType | Nil = nil,
      @number_capabilities : Array(NumberCapability) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @created_at
        params << {"#{prefix}CreatedAt", Core::QueryValue.time(value)}
      end

      if value = @phone_number
        params << {"#{prefix}PhoneNumber", value}
      end

      if value = @status
        params << {"#{prefix}Status", value}
      end

      if value = @iso_2_country_code
        params << {"#{prefix}Iso2CountryCode", value}
      end

      if value = @route_type
        params << {"#{prefix}RouteType", value.to_json_object_key}
      end

      (@number_capabilities || [] of NumberCapability).each_with_index(1) do |item, i|
        params << {"#{prefix}NumberCapabilities.member.#{i}", item.to_json_object_key}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        created_at: Core::XMLValue.time(node.xpath_node("*[local-name()='CreatedAt']")),
        phone_number: Core::XMLValue.string(node.xpath_node("*[local-name()='PhoneNumber']")),
        status: Core::XMLValue.string(node.xpath_node("*[local-name()='Status']")),
        iso_2_country_code: Core::XMLValue.string(node.xpath_node("*[local-name()='Iso2CountryCode']")),
        route_type: (n = node.xpath_node("*[local-name()='RouteType']")) ? AS::RouteType.from_json_object_key?(n.content) : nil,
        number_capabilities: node.xpath_nodes("*[local-name()='NumberCapabilities']/*[local-name()='member']").compact_map { |n| AS::NumberCapability.from_json_object_key?(n.content) },
      )
    end

    def validate! : Nil
      if value = @iso_2_country_code
        raise Core::ValidationError.new("Iso2CountryCode length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("Iso2CountryCode length must be <= 2") if value.size > 2
        raise Core::ValidationError.new("Iso2CountryCode does not match the required pattern") unless value.matches?(Regex.new("^[A-Za-z]{2}$"))
      end
    end

    def_equals_and_hash(@created_at, @phone_number, @status, @iso_2_country_code, @route_type, @number_capabilities)
  end
end
