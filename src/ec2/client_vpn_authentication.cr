private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes the authentication methods used by a Client VPN endpoint. For more information, see
  # [Authentication](https://docs.aws.amazon.com/vpn/latest/clientvpn-admin/client-authentication.html)
  # in the *Client VPN Administrator Guide*.
  class ClientVpnAuthentication
    # The authentication type used.
    property type : ClientVpnAuthenticationType | Nil

    # Information about the Active Directory, if applicable.
    property active_directory : DirectoryServiceAuthentication | Nil

    # Information about the authentication certificates, if applicable.
    property mutual_authentication : CertificateAuthentication | Nil

    # Information about the IAM SAML identity provider, if applicable.
    property federated_authentication : FederatedAuthentication | Nil

    def initialize(
      @type : ClientVpnAuthenticationType | Nil = nil,
      @active_directory : DirectoryServiceAuthentication | Nil = nil,
      @mutual_authentication : CertificateAuthentication | Nil = nil,
      @federated_authentication : FederatedAuthentication | Nil = nil,
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
        type: (n = node.xpath_node("*[local-name()='type']")) ? AEC::ClientVpnAuthenticationType.from_json_object_key?(n.content) : nil,
        active_directory: node.xpath_node("*[local-name()='activeDirectory']").try { |n| DirectoryServiceAuthentication.from_xml(n) },
        mutual_authentication: node.xpath_node("*[local-name()='mutualAuthentication']").try { |n| CertificateAuthentication.from_xml(n) },
        federated_authentication: node.xpath_node("*[local-name()='federatedAuthentication']").try { |n| FederatedAuthentication.from_xml(n) },
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
