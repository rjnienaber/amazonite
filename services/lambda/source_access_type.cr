private alias AL = Amazonite::Lambda

module Amazonite::Lambda
  enum SourceAccessType
    BasicAuth
    VpcSubnet
    VpcSecurityGroup
    SaslScram512Auth
    SaslScram256Auth
    VirtualHost
    ClientCertificateTlsAuth
    ServerRootCaCertificate

    def self.to_json(e : SourceAccessType, json : JSON::Builder) : Nil
      value = case e
              when AL::SourceAccessType::BasicAuth                then "BASIC_AUTH"
              when AL::SourceAccessType::VpcSubnet                then "VPC_SUBNET"
              when AL::SourceAccessType::VpcSecurityGroup         then "VPC_SECURITY_GROUP"
              when AL::SourceAccessType::SaslScram512Auth         then "SASL_SCRAM_512_AUTH"
              when AL::SourceAccessType::SaslScram256Auth         then "SASL_SCRAM_256_AUTH"
              when AL::SourceAccessType::VirtualHost              then "VIRTUAL_HOST"
              when AL::SourceAccessType::ClientCertificateTlsAuth then "CLIENT_CERTIFICATE_TLS_AUTH"
              when AL::SourceAccessType::ServerRootCaCertificate  then "SERVER_ROOT_CA_CERTIFICATE"
              else
                raise Exception.new("unknown enum value for 'SourceAccessType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AL::SourceAccessType
      value = pull.read_string
      case value
      when "BASIC_AUTH"                  then AL::SourceAccessType::BasicAuth
      when "VPC_SUBNET"                  then AL::SourceAccessType::VpcSubnet
      when "VPC_SECURITY_GROUP"          then AL::SourceAccessType::VpcSecurityGroup
      when "SASL_SCRAM_512_AUTH"         then AL::SourceAccessType::SaslScram512Auth
      when "SASL_SCRAM_256_AUTH"         then AL::SourceAccessType::SaslScram256Auth
      when "VIRTUAL_HOST"                then AL::SourceAccessType::VirtualHost
      when "CLIENT_CERTIFICATE_TLS_AUTH" then AL::SourceAccessType::ClientCertificateTlsAuth
      when "SERVER_ROOT_CA_CERTIFICATE"  then AL::SourceAccessType::ServerRootCaCertificate
      else
        raise Exception.new("unknown enum value for 'SourceAccessType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AL::SourceAccessType::BasicAuth                then "BASIC_AUTH"
      when AL::SourceAccessType::VpcSubnet                then "VPC_SUBNET"
      when AL::SourceAccessType::VpcSecurityGroup         then "VPC_SECURITY_GROUP"
      when AL::SourceAccessType::SaslScram512Auth         then "SASL_SCRAM_512_AUTH"
      when AL::SourceAccessType::SaslScram256Auth         then "SASL_SCRAM_256_AUTH"
      when AL::SourceAccessType::VirtualHost              then "VIRTUAL_HOST"
      when AL::SourceAccessType::ClientCertificateTlsAuth then "CLIENT_CERTIFICATE_TLS_AUTH"
      when AL::SourceAccessType::ServerRootCaCertificate  then "SERVER_ROOT_CA_CERTIFICATE"
      else
        raise Exception.new("unknown enum value for 'SourceAccessType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AL::SourceAccessType?
      case key
      when "BASIC_AUTH"                  then AL::SourceAccessType::BasicAuth
      when "VPC_SUBNET"                  then AL::SourceAccessType::VpcSubnet
      when "VPC_SECURITY_GROUP"          then AL::SourceAccessType::VpcSecurityGroup
      when "SASL_SCRAM_512_AUTH"         then AL::SourceAccessType::SaslScram512Auth
      when "SASL_SCRAM_256_AUTH"         then AL::SourceAccessType::SaslScram256Auth
      when "VIRTUAL_HOST"                then AL::SourceAccessType::VirtualHost
      when "CLIENT_CERTIFICATE_TLS_AUTH" then AL::SourceAccessType::ClientCertificateTlsAuth
      when "SERVER_ROOT_CA_CERTIFICATE"  then AL::SourceAccessType::ServerRootCaCertificate
      else
        nil
      end
    end
  end
end
