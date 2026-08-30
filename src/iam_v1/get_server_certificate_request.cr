private alias Core = Amazonite::Core

module Amazonite::IamV1
  class GetServerCertificateRequest
    # The name of the server certificate you want to retrieve information about.
    #
    # This parameter allows (through its [regex pattern](http://wikipedia.org/wiki/regex)) a string of
    # characters consisting of upper and lowercase alphanumeric characters with no spaces. You can
    # also include any of the following characters: _+=,.@-
    property server_certificate_name : String

    def initialize(
      @server_certificate_name : String,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}ServerCertificateName", @server_certificate_name}
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        server_certificate_name: Core::XMLValue.string(node.xpath_node("*[local-name()='ServerCertificateName']")).not_nil!,
      )
    end

    def validate! : Nil
      if value = @server_certificate_name
        raise Core::ValidationError.new("ServerCertificateName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("ServerCertificateName length must be <= 128") if value.size > 128
        raise Core::ValidationError.new("ServerCertificateName does not match the required pattern") unless value.matches?(Regex.new("^[\\w+=,.@-]+$"))
      end
    end

    def_equals_and_hash(@server_certificate_name)
  end
end
