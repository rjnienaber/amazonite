private alias Core = Amazonite::Core

module Amazonite::IamV1
  class UpdateServerCertificateRequest
    # The name of the server certificate that you want to update.
    #
    # This parameter allows (through its [regex pattern](http://wikipedia.org/wiki/regex)) a string of
    # characters consisting of upper and lowercase alphanumeric characters with no spaces. You can
    # also include any of the following characters: _+=,.@-
    property server_certificate_name : String

    # The new path for the server certificate. Include this only if you are updating the server
    # certificate's path.
    #
    # This parameter allows (through its [regex pattern](http://wikipedia.org/wiki/regex)) a string of
    # characters consisting of either a forward slash (/) by itself or a string that must begin and
    # end with forward slashes. In addition, it can contain any ASCII character from the ! (`\u0021`)
    # through the DEL character (`\u007F`), including most punctuation characters, digits, and upper
    # and lowercased letters.
    property new_path : String | Nil

    # The new name for the server certificate. Include this only if you are updating the server
    # certificate's name. The name of the certificate cannot contain any spaces.
    #
    # This parameter allows (through its [regex pattern](http://wikipedia.org/wiki/regex)) a string of
    # characters consisting of upper and lowercase alphanumeric characters with no spaces. You can
    # also include any of the following characters: _+=,.@-
    property new_server_certificate_name : String | Nil

    def initialize(
      @server_certificate_name : String,
      @new_path : String | Nil = nil,
      @new_server_certificate_name : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}ServerCertificateName", @server_certificate_name}

      if value = @new_path
        params << {"#{prefix}NewPath", value}
      end

      if value = @new_server_certificate_name
        params << {"#{prefix}NewServerCertificateName", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        server_certificate_name: Core::XMLValue.string(node.xpath_node("*[local-name()='ServerCertificateName']")).not_nil!,
        new_path: Core::XMLValue.string(node.xpath_node("*[local-name()='NewPath']")),
        new_server_certificate_name: Core::XMLValue.string(node.xpath_node("*[local-name()='NewServerCertificateName']")),
      )
    end

    def validate! : Nil
      if value = @server_certificate_name
        raise Core::ValidationError.new("ServerCertificateName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("ServerCertificateName length must be <= 128") if value.size > 128
        raise Core::ValidationError.new("ServerCertificateName does not match the required pattern") unless value.matches?(Regex.new("^[\\w+=,.@-]+$"))
      end

      if value = @new_path
        raise Core::ValidationError.new("NewPath length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("NewPath length must be <= 512") if value.size > 512
        raise Core::ValidationError.new("NewPath does not match the required pattern") unless value.matches?(Regex.new("^(/)|(/[!-~]+/)$"))
      end

      if value = @new_server_certificate_name
        raise Core::ValidationError.new("NewServerCertificateName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("NewServerCertificateName length must be <= 128") if value.size > 128
        raise Core::ValidationError.new("NewServerCertificateName does not match the required pattern") unless value.matches?(Regex.new("^[\\w+=,.@-]+$"))
      end
    end

    def_equals_and_hash(@server_certificate_name, @new_path, @new_server_certificate_name)
  end
end
