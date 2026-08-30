private alias Core = Amazonite::Core

module Amazonite::IamV1
  class GetMFADeviceResponse
    # The friendly name identifying the user.
    property user_name : String | Nil

    # Serial number that uniquely identifies the MFA device. For this API, we only accept FIDO
    # security key [ARNs](https://docs.aws.amazon.com/IAM/latest/UserGuide/reference-arns.html).
    property serial_number : String

    # The date that a specified user's MFA device was first enabled.
    property enable_date : Time | Nil

    # The certifications of a specified user's MFA device. We currently provide FIPS-140-2,
    # FIPS-140-3, and FIDO certification levels obtained from [ FIDO Alliance Metadata Service
    # (MDS)](https://fidoalliance.org/metadata/).
    property certifications : Hash(String, String) | Nil

    def initialize(
      @serial_number : String,
      @user_name : String | Nil = nil,
      @enable_date : Time | Nil = nil,
      @certifications : Hash(String, String) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @user_name
        params << {"#{prefix}UserName", value}
      end

      params << {"#{prefix}SerialNumber", @serial_number}

      if value = @enable_date
        params << {"#{prefix}EnableDate", Core::QueryValue.time(value)}
      end

      (@certifications || {} of String => String).each_with_index(1) do |(key, value), i|
        params << {"#{prefix}Certifications.entry.#{i}.key", key}
        params << {"#{prefix}Certifications.entry.#{i}.value", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        user_name: Core::XMLValue.string(node.xpath_node("*[local-name()='UserName']")),
        serial_number: Core::XMLValue.string(node.xpath_node("*[local-name()='SerialNumber']")).not_nil!,
        enable_date: Core::XMLValue.time(node.xpath_node("*[local-name()='EnableDate']")),
        certifications: node.xpath_nodes("*[local-name()='Certifications']/*[local-name()='entry']").each_with_object({} of String => String) { |entry, hash| hash[entry.xpath_node("*[local-name()='key']").not_nil!.content] = entry.xpath_node("*[local-name()='value']").not_nil!.content },
      )
    end

    def validate! : Nil
      if value = @user_name
        raise Core::ValidationError.new("UserName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("UserName length must be <= 64") if value.size > 64
        raise Core::ValidationError.new("UserName does not match the required pattern") unless value.matches?(Regex.new("^[\\w+=,.@-]+$"))
      end

      if value = @serial_number
        raise Core::ValidationError.new("SerialNumber length must be >= 9") if value.size < 9
        raise Core::ValidationError.new("SerialNumber length must be <= 256") if value.size > 256
        raise Core::ValidationError.new("SerialNumber does not match the required pattern") unless value.matches?(Regex.new("^[\\w+=/:,.@-]+$"))
      end
    end

    def_equals_and_hash(@user_name, @serial_number, @enable_date, @certifications)
  end
end
