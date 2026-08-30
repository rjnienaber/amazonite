private alias Core = Amazonite::Core

module Amazonite::IamV1
  class UploadSigningCertificateRequest
    # The name of the user the signing certificate is for.
    #
    # This parameter allows (through its [regex pattern](http://wikipedia.org/wiki/regex)) a string of
    # characters consisting of upper and lowercase alphanumeric characters with no spaces. You can
    # also include any of the following characters: _+=,.@-
    property user_name : String | Nil

    # The contents of the signing certificate.
    #
    # The [regex pattern](http://wikipedia.org/wiki/regex) used to validate this parameter is a string
    # of characters consisting of the following:
    #
    # - Any printable ASCII character ranging from the space character (`\u0020`) through the end of
    # the ASCII character range
    #
    # - The printable characters in the Basic Latin and Latin-1 Supplement character set (through
    # `\u00FF`)
    #
    # - The special characters tab (`\u0009`), line feed (`\u000A`), and carriage return (`\u000D`)
    property certificate_body : String

    def initialize(
      @certificate_body : String,
      @user_name : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @user_name
        params << {"#{prefix}UserName", value}
      end

      params << {"#{prefix}CertificateBody", @certificate_body}
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        user_name: Core::XMLValue.string(node.xpath_node("*[local-name()='UserName']")),
        certificate_body: Core::XMLValue.string(node.xpath_node("*[local-name()='CertificateBody']")).not_nil!,
      )
    end

    def validate! : Nil
      if value = @user_name
        raise Core::ValidationError.new("UserName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("UserName length must be <= 128") if value.size > 128
        raise Core::ValidationError.new("UserName does not match the required pattern") unless value.matches?(Regex.new("^[\\w+=,.@-]+$"))
      end

      if value = @certificate_body
        raise Core::ValidationError.new("CertificateBody length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("CertificateBody length must be <= 16384") if value.size > 16384
        raise Core::ValidationError.new("CertificateBody does not match the required pattern") unless value.matches?(Regex.new("^[\t\n\r -ÿ]+$"))
      end
    end

    def_equals_and_hash(@user_name, @certificate_body)
  end
end
