private alias Core = Amazonite::Core

module Amazonite::Iam
  class UploadServerCertificateRequest
    # The path for the server certificate. For more information about paths, see [IAM
    # identifiers](https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html) in the
    # *IAM User Guide*.
    #
    # This parameter is optional. If it is not included, it defaults to a slash (/). This parameter
    # allows (through its [regex pattern](http://wikipedia.org/wiki/regex)) a string of characters
    # consisting of either a forward slash (/) by itself or a string that must begin and end with
    # forward slashes. In addition, it can contain any ASCII character from the ! (`\u0021`) through
    # the DEL character (`\u007F`), including most punctuation characters, digits, and upper and
    # lowercased letters.
    #
    # If you are uploading a server certificate specifically for use with Amazon CloudFront
    # distributions, you must specify a path using the `path` parameter. The path must begin with
    # `/cloudfront` and must include a trailing slash (for example, `/cloudfront/test/`).
    property path : String | Nil

    # The name for the server certificate. Do not include the path in this value. The name of the
    # certificate cannot contain any spaces.
    #
    # This parameter allows (through its [regex pattern](http://wikipedia.org/wiki/regex)) a string of
    # characters consisting of upper and lowercase alphanumeric characters with no spaces. You can
    # also include any of the following characters: _+=,.@-
    property server_certificate_name : String

    # The contents of the public key certificate in PEM-encoded format.
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

    # The contents of the private key in PEM-encoded format.
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
    property private_key : String

    # The contents of the certificate chain. This is typically a concatenation of the PEM-encoded
    # public key certificates of the chain.
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
    property certificate_chain : String | Nil

    # A list of tags that you want to attach to the new IAM server certificate resource. Each tag
    # consists of a key name and an associated value. For more information about tagging, see [Tagging
    # IAM resources](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html) in the *IAM User
    # Guide*.
    #
    # If any one of the tags is invalid or if you exceed the allowed maximum number of tags, then the
    # entire request fails and the resource is not created.
    property tags : Array(Tag) | Nil

    def initialize(
      @server_certificate_name : String,
      @certificate_body : String,
      @private_key : String,
      @path : String | Nil = nil,
      @certificate_chain : String | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @path
        params << {"#{prefix}Path", value}
      end

      params << {"#{prefix}ServerCertificateName", @server_certificate_name}

      params << {"#{prefix}CertificateBody", @certificate_body}

      params << {"#{prefix}PrivateKey", @private_key}

      if value = @certificate_chain
        params << {"#{prefix}CertificateChain", value}
      end

      (@tags || [] of Tag).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Tags.member.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        path: Core::XMLValue.string(node.xpath_node("*[local-name()='Path']")),
        server_certificate_name: Core::XMLValue.string(node.xpath_node("*[local-name()='ServerCertificateName']")).not_nil!,
        certificate_body: Core::XMLValue.string(node.xpath_node("*[local-name()='CertificateBody']")).not_nil!,
        private_key: Core::XMLValue.string(node.xpath_node("*[local-name()='PrivateKey']")).not_nil!,
        certificate_chain: Core::XMLValue.string(node.xpath_node("*[local-name()='CertificateChain']")),
        tags: node.xpath_nodes("*[local-name()='Tags']/*[local-name()='member']").map { |n| Tag.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @path
        raise Core::ValidationError.new("Path length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("Path length must be <= 512") if value.size > 512
        raise Core::ValidationError.new("Path does not match the required pattern") unless value.matches?(Regex.new("^(/)|(/[!-~]+/)$"))
      end

      if value = @server_certificate_name
        raise Core::ValidationError.new("ServerCertificateName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("ServerCertificateName length must be <= 128") if value.size > 128
        raise Core::ValidationError.new("ServerCertificateName does not match the required pattern") unless value.matches?(Regex.new("^[\\w+=,.@-]+$"))
      end

      if value = @certificate_body
        raise Core::ValidationError.new("CertificateBody length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("CertificateBody length must be <= 16384") if value.size > 16384
        raise Core::ValidationError.new("CertificateBody does not match the required pattern") unless value.matches?(Regex.new("^[\t\n\r -ÿ]+$"))
      end

      if value = @private_key
        raise Core::ValidationError.new("PrivateKey length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("PrivateKey length must be <= 16384") if value.size > 16384
        raise Core::ValidationError.new("PrivateKey does not match the required pattern") unless value.matches?(Regex.new("^[\t\n\r -ÿ]+$"))
      end

      if value = @certificate_chain
        raise Core::ValidationError.new("CertificateChain length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("CertificateChain length must be <= 2097152") if value.size > 2097152
        raise Core::ValidationError.new("CertificateChain does not match the required pattern") unless value.matches?(Regex.new("^[\t\n\r -ÿ]+$"))
      end

      if value = @tags
        raise Core::ValidationError.new("Tags must have at least 0 item(s)") if value.size < 0
        raise Core::ValidationError.new("Tags must have at most 50 item(s)") if value.size > 50
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@path, @server_certificate_name, @certificate_body, @private_key, @certificate_chain, @tags)
  end
end
