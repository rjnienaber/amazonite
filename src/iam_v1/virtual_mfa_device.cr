private alias Core = Amazonite::Core

module Amazonite::IamV1
  # Contains information about a virtual MFA device.
  class VirtualMFADevice
    # The serial number associated with `VirtualMFADevice`.
    property serial_number : String

    # The base32 seed defined as specified in [RFC3548](https://tools.ietf.org/html/rfc3548.txt). The
    # `Base32StringSeed` is base32-encoded.
    property base_32_string_seed : Bytes | Nil

    # A QR code PNG image that encodes
    # `otpauth://totp/$virtualMFADeviceName@$AccountName?secret=$Base32String` where
    # `$virtualMFADeviceName` is one of the create call arguments. `AccountName` is the user name if
    # set (otherwise, the account ID otherwise), and `Base32String` is the seed in base32 format. The
    # `Base32String` value is base64-encoded.
    property qr_code_png : Bytes | Nil

    # The IAM user associated with this virtual MFA device.
    property user : User | Nil

    # The date and time on which the virtual MFA device was enabled.
    property enable_date : Time | Nil

    # A list of tags that are attached to the virtual MFA device. For more information about tagging,
    # see [Tagging IAM resources](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html) in
    # the *IAM User Guide*.
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

    def validate! : Nil
      if value = @serial_number
        raise Core::ValidationError.new("SerialNumber length must be >= 9") if value.size < 9
        raise Core::ValidationError.new("SerialNumber length must be <= 256") if value.size > 256
        raise Core::ValidationError.new("SerialNumber does not match the required pattern") unless value.matches?(Regex.new("^[\\w+=/:,.@-]+$"))
      end

      if value = @user
        value.validate!
      end

      if value = @tags
        raise Core::ValidationError.new("Tags must have at least 0 item(s)") if value.size < 0
        raise Core::ValidationError.new("Tags must have at most 50 item(s)") if value.size > 50
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@serial_number, @base_32_string_seed, @qr_code_png, @user, @enable_date, @tags)
  end
end
