private alias Core = Amazonite::Core

module Amazonite::IamV1
  class VirtualMFADevice
    property serial_number : String

    property base_32_string_seed : Bytes | Nil

    property qr_code_png : Bytes | Nil

    property user : User | Nil

    property enable_date : Time | Nil

    property tags : Array(Tag) | Nil

    def initialize(
      @serial_number : String,
      @base_32_string_seed : Bytes | Nil = nil,
      @qr_code_png : Bytes | Nil = nil,
      @user : User | Nil = nil,
      @enable_date : Time | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}SerialNumber", @serial_number}

      if value = @base_32_string_seed
        params << {"#{prefix}Base32StringSeed", Core::QueryValue.bytes(value)}
      end

      if value = @qr_code_png
        params << {"#{prefix}QRCodePNG", Core::QueryValue.bytes(value)}
      end

      if value = @user
        params.concat(value.to_query_params("#{prefix}User."))
      end

      if value = @enable_date
        params << {"#{prefix}EnableDate", Core::QueryValue.time(value)}
      end

      (@tags || [] of Tag).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Tags.member.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        serial_number: Core::XMLValue.string(node.xpath_node("*[local-name()='SerialNumber']")).not_nil!,
        base_32_string_seed: Core::XMLValue.bytes(node.xpath_node("*[local-name()='Base32StringSeed']")),
        qr_code_png: Core::XMLValue.bytes(node.xpath_node("*[local-name()='QRCodePNG']")),
        user: node.xpath_node("*[local-name()='User']").try { |n| User.from_xml(n) },
        enable_date: Core::XMLValue.time(node.xpath_node("*[local-name()='EnableDate']")),
        tags: node.xpath_nodes("*[local-name()='Tags']/*[local-name()='member']").map { |n| Tag.from_xml(n) },
      )
    end
  end
end
