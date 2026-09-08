private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum ClientVpnAuthenticationType
    CertificateAuthentication
    DirectoryServiceAuthentication
    FederatedAuthentication

    def self.to_json(e : ClientVpnAuthenticationType, json : JSON::Builder) : Nil
      value = case e
              when AEC::ClientVpnAuthenticationType::CertificateAuthentication      then "certificate-authentication"
              when AEC::ClientVpnAuthenticationType::DirectoryServiceAuthentication then "directory-service-authentication"
              when AEC::ClientVpnAuthenticationType::FederatedAuthentication        then "federated-authentication"
              else
                raise Exception.new("unknown enum value for 'ClientVpnAuthenticationType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::ClientVpnAuthenticationType
      value = pull.read_string
      case value
      when "certificate-authentication"       then AEC::ClientVpnAuthenticationType::CertificateAuthentication
      when "directory-service-authentication" then AEC::ClientVpnAuthenticationType::DirectoryServiceAuthentication
      when "federated-authentication"         then AEC::ClientVpnAuthenticationType::FederatedAuthentication
      else
        raise Exception.new("unknown enum value for 'ClientVpnAuthenticationType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::ClientVpnAuthenticationType::CertificateAuthentication      then "certificate-authentication"
      when AEC::ClientVpnAuthenticationType::DirectoryServiceAuthentication then "directory-service-authentication"
      when AEC::ClientVpnAuthenticationType::FederatedAuthentication        then "federated-authentication"
      else
        raise Exception.new("unknown enum value for 'ClientVpnAuthenticationType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::ClientVpnAuthenticationType?
      case key
      when "certificate-authentication"       then AEC::ClientVpnAuthenticationType::CertificateAuthentication
      when "directory-service-authentication" then AEC::ClientVpnAuthenticationType::DirectoryServiceAuthentication
      when "federated-authentication"         then AEC::ClientVpnAuthenticationType::FederatedAuthentication
      else
        nil
      end
    end
  end
end
