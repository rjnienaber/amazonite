private alias AAG = Amazonite::ApiGatewayV1

module Amazonite::ApiGatewayV1
  # The authorizer type. Valid values are `TOKEN` for a Lambda function using a single authorization
  # token submitted in a custom header, `REQUEST` for a Lambda function using incoming request
  # parameters, and `COGNITO_USER_POOLS` for using an Amazon Cognito user pool.
  enum AuthorizerType
    Token
    Request
    CognitoUserPools

    def self.to_json(e : AuthorizerType, json : JSON::Builder) : Nil
      value = case e
              when AAG::AuthorizerType::Token            then "TOKEN"
              when AAG::AuthorizerType::Request          then "REQUEST"
              when AAG::AuthorizerType::CognitoUserPools then "COGNITO_USER_POOLS"
              else
                raise Exception.new("unknown enum value for 'AuthorizerType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AAG::AuthorizerType
      value = pull.read_string
      case value
      when "TOKEN"              then AAG::AuthorizerType::Token
      when "REQUEST"            then AAG::AuthorizerType::Request
      when "COGNITO_USER_POOLS" then AAG::AuthorizerType::CognitoUserPools
      else
        raise Exception.new("unknown enum value for 'AuthorizerType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AAG::AuthorizerType::Token            then "TOKEN"
      when AAG::AuthorizerType::Request          then "REQUEST"
      when AAG::AuthorizerType::CognitoUserPools then "COGNITO_USER_POOLS"
      else
        raise Exception.new("unknown enum value for 'AuthorizerType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AAG::AuthorizerType?
      case key
      when "TOKEN"              then AAG::AuthorizerType::Token
      when "REQUEST"            then AAG::AuthorizerType::Request
      when "COGNITO_USER_POOLS" then AAG::AuthorizerType::CognitoUserPools
      else
        nil
      end
    end
  end
end
