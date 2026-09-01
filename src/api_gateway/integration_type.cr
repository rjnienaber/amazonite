private alias AAG = Amazonite::ApiGateway

module Amazonite::ApiGateway
  # The integration type. The valid value is `HTTP` for integrating an API method with an HTTP
  # backend; `AWS` with any Amazon Web Services service endpoints; `MOCK` for testing without
  # actually invoking the backend; `HTTP_PROXY` for integrating with the HTTP proxy integration;
  # `AWS_PROXY` for integrating with the Lambda proxy integration.
  enum IntegrationType
    Http
    Aws
    Mock
    HttpProxy
    AwsProxy

    def self.to_json(e : IntegrationType, json : JSON::Builder) : Nil
      value = case e
              when AAG::IntegrationType::Http      then "HTTP"
              when AAG::IntegrationType::Aws       then "AWS"
              when AAG::IntegrationType::Mock      then "MOCK"
              when AAG::IntegrationType::HttpProxy then "HTTP_PROXY"
              when AAG::IntegrationType::AwsProxy  then "AWS_PROXY"
              else
                raise Exception.new("unknown enum value for 'IntegrationType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AAG::IntegrationType
      value = pull.read_string
      case value
      when "HTTP"       then AAG::IntegrationType::Http
      when "AWS"        then AAG::IntegrationType::Aws
      when "MOCK"       then AAG::IntegrationType::Mock
      when "HTTP_PROXY" then AAG::IntegrationType::HttpProxy
      when "AWS_PROXY"  then AAG::IntegrationType::AwsProxy
      else
        raise Exception.new("unknown enum value for 'IntegrationType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AAG::IntegrationType::Http      then "HTTP"
      when AAG::IntegrationType::Aws       then "AWS"
      when AAG::IntegrationType::Mock      then "MOCK"
      when AAG::IntegrationType::HttpProxy then "HTTP_PROXY"
      when AAG::IntegrationType::AwsProxy  then "AWS_PROXY"
      else
        raise Exception.new("unknown enum value for 'IntegrationType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AAG::IntegrationType?
      case key
      when "HTTP"       then AAG::IntegrationType::Http
      when "AWS"        then AAG::IntegrationType::Aws
      when "MOCK"       then AAG::IntegrationType::Mock
      when "HTTP_PROXY" then AAG::IntegrationType::HttpProxy
      when "AWS_PROXY"  then AAG::IntegrationType::AwsProxy
      else
        nil
      end
    end
  end
end
