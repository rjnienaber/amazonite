private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes the authentication method to be used by a Client VPN endpoint. For more information,
  # see
  # [Authentication](https://docs.aws.amazon.com/vpn/latest/clientvpn-admin/authentication-authrization.html#client-authentication)
  # in the *Client VPN Administrator Guide*.
  class ClientVpnAuthenticationRequest
    # The type of client authentication to be used.
    property type : ClientVpnAuthenticationType | Nil

    # Information about the Active Directory to be used, if applicable. You must provide this
    # information if **Type** is `directory-service-authentication`.
    property active_directory : DirectoryServiceAuthenticationRequest | Nil

    # Information about the authentication certificates to be used, if applicable. You must provide
    # this information if **Type** is `certificate-authentication`.
    property mutual_authentication : CertificateAuthenticationRequest | Nil

    # Information about the IAM SAML identity provider to be used, if applicable. You must provide
    # this information if **Type** is `federated-authentication`.
    property federated_authentication : FederatedAuthenticationRequest | Nil

    def initialize(
      @type : ClientVpnAuthenticationType | Nil = nil,
      @active_directory : DirectoryServiceAuthenticationRequest | Nil = nil,
      @mutual_authentication : CertificateAuthenticationRequest | Nil = nil,
      @federated_authentication : FederatedAuthenticationRequest | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @type
        params << {"#{prefix}Type", value.to_json_object_key}
      end

      if value = @active_directory
        params.concat(value.to_query_params("#{prefix}ActiveDirectory."))
      end

      if value = @mutual_authentication
        params.concat(value.to_query_params("#{prefix}MutualAuthentication."))
      end

      if value = @federated_authentication
        params.concat(value.to_query_params("#{prefix}FederatedAuthentication."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        type: (n = node.xpath_node("*[local-name()='Type']")) ? AEC::ClientVpnAuthenticationType.from_json_object_key?(n.content) : nil,
        active_directory: node.xpath_node("*[local-name()='ActiveDirectory']").try { |n| DirectoryServiceAuthenticationRequest.from_xml(n) },
        mutual_authentication: node.xpath_node("*[local-name()='MutualAuthentication']").try { |n| CertificateAuthenticationRequest.from_xml(n) },
        federated_authentication: node.xpath_node("*[local-name()='FederatedAuthentication']").try { |n| FederatedAuthenticationRequest.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @active_directory
        value.validate!
      end

      if value = @mutual_authentication
        value.validate!
      end

      if value = @federated_authentication
        value.validate!
      end
    end

    def_equals_and_hash(@type, @active_directory, @mutual_authentication, @federated_authentication)
  end
end
