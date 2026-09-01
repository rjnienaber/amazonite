private alias Core = Amazonite::Core

module Amazonite::Iam
  class CreateOpenIDConnectProviderRequest
    # The URL of the identity provider. The URL must begin with `https://` and should correspond to
    # the `iss` claim in the provider's OpenID Connect ID tokens. Per the OIDC standard, path
    # components are allowed but query parameters are not. Typically the URL consists of only a
    # hostname, like `https://server.example.org` or `https://example.com`. The URL should not contain
    # a port number.
    #
    # You cannot register the same provider multiple times in a single Amazon Web Services account. If
    # you try to submit a URL that has already been used for an OpenID Connect provider in the Amazon
    # Web Services account, you will get an error.
    property url : String

    # Provides a list of client IDs, also known as audiences. When a mobile or web app registers with
    # an OpenID Connect provider, they establish a value that identifies the application. This is the
    # value that's sent as the `client_id` parameter on OAuth requests.
    #
    # You can register multiple client IDs with the same provider. For example, you might have
    # multiple applications that use the same OIDC provider. You cannot register more than 100 client
    # IDs with a single IAM OIDC provider.
    #
    # There is no defined format for a client ID. The `CreateOpenIDConnectProviderRequest` operation
    # accepts client IDs up to 255 characters long.
    property client_id_list : Array(String) | Nil

    # A list of server certificate thumbprints for the OpenID Connect (OIDC) identity provider's
    # server certificates. Typically this list includes only one entry. However, IAM lets you have up
    # to five thumbprints for an OIDC provider. This lets you maintain multiple thumbprints if the
    # identity provider is rotating certificates.
    #
    # This parameter is optional. If it is not included, IAM will retrieve and use the top
    # intermediate certificate authority (CA) thumbprint of the OpenID Connect identity provider
    # server certificate.
    #
    # The server certificate thumbprint is the hex-encoded SHA-1 hash value of the X.509 certificate
    # used by the domain where the OpenID Connect provider makes its keys available. It is always a
    # 40-character string.
    #
    # For example, assume that the OIDC provider is `server.example.com` and the provider stores its
    # keys at https://keys.server.example.com/openid-connect. In that case, the thumbprint string
    # would be the hex-encoded SHA-1 hash value of the certificate used by
    # `https://keys.server.example.com.`
    #
    # For more information about obtaining the OIDC provider thumbprint, see [Obtaining the thumbprint
    # for an OpenID Connect
    # provider](https://docs.aws.amazon.com/IAM/latest/UserGuide/identity-providers-oidc-obtain-thumbprint.html)
    # in the *IAM user Guide*.
    #
    # If your OIDC provider's discovery endpoint and JWKS endpoint (`jwks_uri`) use different
    # certificates or hosts, include the thumbprints for both endpoints in this list.
    property thumbprint_list : Array(String) | Nil

    # A list of tags that you want to attach to the new IAM OpenID Connect (OIDC) provider. Each tag
    # consists of a key name and an associated value. For more information about tagging, see [Tagging
    # IAM resources](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html) in the *IAM User
    # Guide*.
    #
    # If any one of the tags is invalid or if you exceed the allowed maximum number of tags, then the
    # entire request fails and the resource is not created.
    property tags : Array(Tag) | Nil

    def initialize(
      @url : String,
      @client_id_list : Array(String) | Nil = nil,
      @thumbprint_list : Array(String) | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}Url", @url}

      (@client_id_list || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}ClientIDList.member.#{i}", item}
      end

      (@thumbprint_list || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}ThumbprintList.member.#{i}", item}
      end

      (@tags || [] of Tag).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Tags.member.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        url: Core::XMLValue.string(node.xpath_node("*[local-name()='Url']")).not_nil!,
        client_id_list: node.xpath_nodes("*[local-name()='ClientIDList']/*[local-name()='member']").map { |n| n.content },
        thumbprint_list: node.xpath_nodes("*[local-name()='ThumbprintList']/*[local-name()='member']").map { |n| n.content },
        tags: node.xpath_nodes("*[local-name()='Tags']/*[local-name()='member']").map { |n| Tag.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @url
        raise Core::ValidationError.new("Url length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("Url length must be <= 255") if value.size > 255
      end

      if value = @tags
        raise Core::ValidationError.new("Tags must have at least 0 item(s)") if value.size < 0
        raise Core::ValidationError.new("Tags must have at most 50 item(s)") if value.size > 50
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@url, @client_id_list, @thumbprint_list, @tags)
  end
end
