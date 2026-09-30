private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes an address range of an IPv4 address pool.
  class PublicIpv4PoolRange
    # The first IP address in the range.
    property first_address : String | Nil

    # The last IP address in the range.
    property last_address : String | Nil

    # The number of addresses in the range.
    property address_count : Int32 | Nil

    # The number of available addresses in the range.
    property available_address_count : Int32 | Nil

    def initialize(
      @first_address : String | Nil = nil,
      @last_address : String | Nil = nil,
      @address_count : Int32 | Nil = nil,
      @available_address_count : Int32 | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @first_address
        params << {"#{prefix}FirstAddress", value}
      end

      if value = @last_address
        params << {"#{prefix}LastAddress", value}
      end

      if value = @address_count
        params << {"#{prefix}AddressCount", value.to_s}
      end

      if value = @available_address_count
        params << {"#{prefix}AvailableAddressCount", value.to_s}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        first_address: Core::XMLValue.string(node.xpath_node("*[local-name()='firstAddress']")),
        last_address: Core::XMLValue.string(node.xpath_node("*[local-name()='lastAddress']")),
        address_count: Core::XMLValue.i32(node.xpath_node("*[local-name()='addressCount']")),
        available_address_count: Core::XMLValue.i32(node.xpath_node("*[local-name()='availableAddressCount']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@first_address, @last_address, @address_count, @available_address_count)
  end
end
