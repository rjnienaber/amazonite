private alias AL = Amazonite::Lambda

module Amazonite::Lambda
  enum KafkaSchemaRegistryAuthType
    BasicAuth
    ClientCertificateTlsAuth
    ServerRootCaCertificate

    def self.to_json(e : KafkaSchemaRegistryAuthType, json : JSON::Builder) : Nil
      value = case e
              when AL::KafkaSchemaRegistryAuthType::BasicAuth                then "BASIC_AUTH"
              when AL::KafkaSchemaRegistryAuthType::ClientCertificateTlsAuth then "CLIENT_CERTIFICATE_TLS_AUTH"
              when AL::KafkaSchemaRegistryAuthType::ServerRootCaCertificate  then "SERVER_ROOT_CA_CERTIFICATE"
              else
                raise Exception.new("unknown enum value for 'KafkaSchemaRegistryAuthType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AL::KafkaSchemaRegistryAuthType
      value = pull.read_string
      case value
      when "BASIC_AUTH"                  then AL::KafkaSchemaRegistryAuthType::BasicAuth
      when "CLIENT_CERTIFICATE_TLS_AUTH" then AL::KafkaSchemaRegistryAuthType::ClientCertificateTlsAuth
      when "SERVER_ROOT_CA_CERTIFICATE"  then AL::KafkaSchemaRegistryAuthType::ServerRootCaCertificate
      else
        raise Exception.new("unknown enum value for 'KafkaSchemaRegistryAuthType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AL::KafkaSchemaRegistryAuthType::BasicAuth                then "BASIC_AUTH"
      when AL::KafkaSchemaRegistryAuthType::ClientCertificateTlsAuth then "CLIENT_CERTIFICATE_TLS_AUTH"
      when AL::KafkaSchemaRegistryAuthType::ServerRootCaCertificate  then "SERVER_ROOT_CA_CERTIFICATE"
      else
        raise Exception.new("unknown enum value for 'KafkaSchemaRegistryAuthType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AL::KafkaSchemaRegistryAuthType?
      case key
      when "BASIC_AUTH"                  then AL::KafkaSchemaRegistryAuthType::BasicAuth
      when "CLIENT_CERTIFICATE_TLS_AUTH" then AL::KafkaSchemaRegistryAuthType::ClientCertificateTlsAuth
      when "SERVER_ROOT_CA_CERTIFICATE"  then AL::KafkaSchemaRegistryAuthType::ServerRootCaCertificate
      else
        nil
      end
    end
  end
end
