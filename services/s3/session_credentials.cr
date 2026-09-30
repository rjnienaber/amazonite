private alias Core = Amazonite::Core

module Amazonite::S3
  # The established temporary security credentials of the session.
  #
  # **Directory buckets** - These session credentials are only supported for the authentication and
  # authorization of Zonal endpoint API operations on directory buckets.
  class SessionCredentials
    # A unique identifier that's associated with a secret access key. The access key ID and the secret
    # access key are used together to sign programmatic Amazon Web Services requests
    # cryptographically.
    property access_key_id : String

    # A key that's used with the access key ID to cryptographically sign programmatic Amazon Web
    # Services requests. Signing a request identifies the sender and prevents the request from being
    # altered.
    property secret_access_key : String

    # A part of the temporary security credentials. The session token is used to validate the
    # temporary security credentials.
    property session_token : String

    # Temporary security credentials expire after a specified interval. After temporary credentials
    # expire, any calls that you make with those credentials will fail. So you must generate a new set
    # of temporary credentials. Temporary credentials cannot be extended or refreshed beyond the
    # original specified interval.
    property expiration : Time

    def initialize(
      @access_key_id : String,
      @secret_access_key : String,
      @session_token : String,
      @expiration : Time,
    )
    end

    # `root` is the element this shape is serialized under, which restXml
    # takes from the member binding it as the request payload rather than
    # from the shape's own name - they differ often enough (S3 sends a
    # CompletedMultipartUpload as <CompleteMultipartUpload>) that the caller
    # has to supply it.
    def to_xml(root : String) : String
      XML.build(indent: nil) do |xml|
        xml.element(root) { build_xml(xml) }
      end
    end

    def build_xml(xml : XML::Builder) : Nil
      xml.element("AccessKeyId") { xml.text @access_key_id }

      xml.element("SecretAccessKey") { xml.text @secret_access_key }

      xml.element("SessionToken") { xml.text @session_token }

      xml.element("Expiration") { xml.text Core::QueryValue.time(@expiration) }
    end

    def self.from_xml(node : XML::Node) : self
      new(
        access_key_id: Core::XMLValue.string(node.xpath_node("*[local-name()='AccessKeyId']")).not_nil!,
        secret_access_key: Core::XMLValue.string(node.xpath_node("*[local-name()='SecretAccessKey']")).not_nil!,
        session_token: Core::XMLValue.string(node.xpath_node("*[local-name()='SessionToken']")).not_nil!,
        expiration: Core::XMLValue.time(node.xpath_node("*[local-name()='Expiration']")).not_nil!,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@access_key_id, @secret_access_key, @session_token, @expiration)
  end
end
