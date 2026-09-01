private alias AEB = Amazonite::EventBridge

module Amazonite::EventBridge
  enum ConnectionOAuthHttpMethod
    Get
    Post
    Put

    def self.to_json(e : ConnectionOAuthHttpMethod, json : JSON::Builder) : Nil
      value = case e
              when AEB::ConnectionOAuthHttpMethod::Get  then "GET"
              when AEB::ConnectionOAuthHttpMethod::Post then "POST"
              when AEB::ConnectionOAuthHttpMethod::Put  then "PUT"
              else
                raise Exception.new("unknown enum value for 'ConnectionOAuthHttpMethod' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEB::ConnectionOAuthHttpMethod
      value = pull.read_string
      case value
      when "GET"  then AEB::ConnectionOAuthHttpMethod::Get
      when "POST" then AEB::ConnectionOAuthHttpMethod::Post
      when "PUT"  then AEB::ConnectionOAuthHttpMethod::Put
      else
        raise Exception.new("unknown enum value for 'ConnectionOAuthHttpMethod' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEB::ConnectionOAuthHttpMethod::Get  then "GET"
      when AEB::ConnectionOAuthHttpMethod::Post then "POST"
      when AEB::ConnectionOAuthHttpMethod::Put  then "PUT"
      else
        raise Exception.new("unknown enum value for 'ConnectionOAuthHttpMethod' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEB::ConnectionOAuthHttpMethod?
      case key
      when "GET"  then AEB::ConnectionOAuthHttpMethod::Get
      when "POST" then AEB::ConnectionOAuthHttpMethod::Post
      when "PUT"  then AEB::ConnectionOAuthHttpMethod::Put
      else
        nil
      end
    end
  end
end
