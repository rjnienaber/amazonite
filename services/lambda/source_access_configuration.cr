private alias AL = Amazonite::Lambda
private alias Core = Amazonite::Core

module Amazonite::Lambda
  # To secure and define access to your event source, you can specify the authentication protocol,
  # VPC components, or virtual host.
  class SourceAccessConfiguration
    include JSON::Serializable

    # The type of authentication protocol, VPC components, or virtual host for your event source. For
    # example: `"Type":"SASL_SCRAM_512_AUTH"`.
    #
    # - `BASIC_AUTH` – (Amazon MQ) The Secrets Manager secret that stores your broker credentials.
    #
    # - `BASIC_AUTH` – (Self-managed Apache Kafka) The Secrets Manager ARN of your secret key used for
    # SASL/PLAIN authentication of your Apache Kafka brokers.
    #
    # - `VPC_SUBNET` – (Self-managed Apache Kafka) The subnets associated with your VPC. Lambda
    # connects to these subnets to fetch data from your self-managed Apache Kafka cluster.
    #
    # - `VPC_SECURITY_GROUP` – (Self-managed Apache Kafka) The VPC security group used to manage
    # access to your self-managed Apache Kafka brokers.
    #
    # - `SASL_SCRAM_256_AUTH` – (Self-managed Apache Kafka) The Secrets Manager ARN of your secret key
    # used for SASL SCRAM-256 authentication of your self-managed Apache Kafka brokers.
    #
    # - `SASL_SCRAM_512_AUTH` – (Amazon MSK, Self-managed Apache Kafka) The Secrets Manager ARN of
    # your secret key used for SASL SCRAM-512 authentication of your self-managed Apache Kafka
    # brokers.
    #
    # - `VIRTUAL_HOST` –- (RabbitMQ) The name of the virtual host in your RabbitMQ broker. Lambda uses
    # this RabbitMQ host as the event source. This property cannot be specified in an
    # UpdateEventSourceMapping API call.
    #
    # - `CLIENT_CERTIFICATE_TLS_AUTH` – (Amazon MSK, self-managed Apache Kafka) The Secrets Manager
    # ARN of your secret key containing the certificate chain (X.509 PEM), private key (PKCS#8 PEM),
    # and private key password (optional) used for mutual TLS authentication of your MSK/Apache Kafka
    # brokers.
    #
    # - `SERVER_ROOT_CA_CERTIFICATE` – (Self-managed Apache Kafka) The Secrets Manager ARN of your
    # secret key containing the root CA certificate (X.509 PEM) used for TLS encryption of your Apache
    # Kafka brokers.
    @[JSON::Field(key: "Type", converter: AL::SourceAccessType)]
    property type : SourceAccessType | Nil

    # The value for your chosen configuration in `Type`. For example: `"URI":
    # "arn:aws:secretsmanager:us-east-1:01234567890:secret:MyBrokerSecretName"`.
    @[JSON::Field(key: "URI")]
    property uri : String | Nil

    def initialize(
      @type : SourceAccessType | Nil = nil,
      @uri : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @uri
        raise Core::ValidationError.new("URI length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("URI length must be <= 200") if value.size > 200
        raise Core::ValidationError.new("URI does not match the required pattern") unless value.matches?(Regex.new("^[ a-zA-Z0-9-\\/*:_+=.@-]*$"))
      end
    end

    def_equals_and_hash(@type, @uri)
  end
end
