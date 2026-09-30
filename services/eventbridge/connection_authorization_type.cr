private alias AEB = Amazonite::EventBridge

module Amazonite::EventBridge
  enum ConnectionAuthorizationType
    Basic
    OauthClientCredentials
    ApiKey

    def self.to_json(e : ConnectionAuthorizationType, json : JSON::Builder) : Nil
      value = case e
              when AEB::ConnectionAuthorizationType::Basic                  then "BASIC"
              when AEB::ConnectionAuthorizationType::OauthClientCredentials then "OAUTH_CLIENT_CREDENTIALS"
              when AEB::ConnectionAuthorizationType::ApiKey                 then "API_KEY"
              else
                raise Exception.new("unknown enum value for 'ConnectionAuthorizationType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEB::ConnectionAuthorizationType
      value = pull.read_string
      case value
      when "BASIC"                    then AEB::ConnectionAuthorizationType::Basic
      when "OAUTH_CLIENT_CREDENTIALS" then AEB::ConnectionAuthorizationType::OauthClientCredentials
      when "API_KEY"                  then AEB::ConnectionAuthorizationType::ApiKey
      else
        raise Exception.new("unknown enum value for 'ConnectionAuthorizationType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEB::ConnectionAuthorizationType::Basic                  then "BASIC"
      when AEB::ConnectionAuthorizationType::OauthClientCredentials then "OAUTH_CLIENT_CREDENTIALS"
      when AEB::ConnectionAuthorizationType::ApiKey                 then "API_KEY"
      else
        raise Exception.new("unknown enum value for 'ConnectionAuthorizationType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEB::ConnectionAuthorizationType?
      case key
      when "BASIC"                    then AEB::ConnectionAuthorizationType::Basic
      when "OAUTH_CLIENT_CREDENTIALS" then AEB::ConnectionAuthorizationType::OauthClientCredentials
      when "API_KEY"                  then AEB::ConnectionAuthorizationType::ApiKey
      else
        nil
      end
    end
  end
end
