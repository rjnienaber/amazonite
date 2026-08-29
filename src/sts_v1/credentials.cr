private alias Core = Amazonite::Core

module Amazonite::StsV1
  class Credentials
    property access_key_id : String

    property secret_access_key : String

    property session_token : String

    property expiration : Time

    def initialize(
      @access_key_id : String,
      @secret_access_key : String,
      @session_token : String,
      @expiration : Time,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}AccessKeyId", @access_key_id}

      params << {"#{prefix}SecretAccessKey", @secret_access_key}

      params << {"#{prefix}SessionToken", @session_token}

      params << {"#{prefix}Expiration", Core::QueryValue.time(@expiration)}
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        access_key_id: Core::XMLValue.string(node.xpath_node("*[local-name()='AccessKeyId']")).not_nil!,
        secret_access_key: Core::XMLValue.string(node.xpath_node("*[local-name()='SecretAccessKey']")).not_nil!,
        session_token: Core::XMLValue.string(node.xpath_node("*[local-name()='SessionToken']")).not_nil!,
        expiration: Core::XMLValue.time(node.xpath_node("*[local-name()='Expiration']")).not_nil!,
      )
    end
  end
end
