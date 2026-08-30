private alias Core = Amazonite::Core

module Amazonite::IamV1
  class DeleteSigningCertificateRequest
    # The name of the user the signing certificate belongs to.
    #
    # This parameter allows (through its [regex pattern](http://wikipedia.org/wiki/regex)) a string of
    # characters consisting of upper and lowercase alphanumeric characters with no spaces. You can
    # also include any of the following characters: _+=,.@-
    property user_name : String | Nil

    # The ID of the signing certificate to delete.
    #
    # The format of this parameter, as described by its [regex](http://wikipedia.org/wiki/regex)
    # pattern, is a string of characters that can be upper- or lower-cased letters or digits.
    property certificate_id : String

    def initialize(
      @certificate_id : String,
      @user_name : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @user_name
        params << {"#{prefix}UserName", value}
      end

      params << {"#{prefix}CertificateId", @certificate_id}
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        user_name: Core::XMLValue.string(node.xpath_node("*[local-name()='UserName']")),
        certificate_id: Core::XMLValue.string(node.xpath_node("*[local-name()='CertificateId']")).not_nil!,
      )
    end

    def validate! : Nil
      if value = @user_name
        raise Core::ValidationError.new("UserName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("UserName length must be <= 128") if value.size > 128
        raise Core::ValidationError.new("UserName does not match the required pattern") unless value.matches?(Regex.new("^[\\w+=,.@-]+$"))
      end

      if value = @certificate_id
        raise Core::ValidationError.new("CertificateId length must be >= 24") if value.size < 24
        raise Core::ValidationError.new("CertificateId length must be <= 128") if value.size > 128
        raise Core::ValidationError.new("CertificateId does not match the required pattern") unless value.matches?(Regex.new("^[\\w]+$"))
      end
    end

    def_equals_and_hash(@user_name, @certificate_id)
  end
end
