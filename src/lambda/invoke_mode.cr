private alias AL = Amazonite::Lambda

module Amazonite::Lambda
  enum InvokeMode
    Buffered
    ResponseStream

    def self.to_json(e : InvokeMode, json : JSON::Builder) : Nil
      value = case e
              when AL::InvokeMode::Buffered       then "BUFFERED"
              when AL::InvokeMode::ResponseStream then "RESPONSE_STREAM"
              else
                raise Exception.new("unknown enum value for 'InvokeMode' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AL::InvokeMode
      value = pull.read_string
      case value
      when "BUFFERED"        then AL::InvokeMode::Buffered
      when "RESPONSE_STREAM" then AL::InvokeMode::ResponseStream
      else
        raise Exception.new("unknown enum value for 'InvokeMode' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AL::InvokeMode::Buffered       then "BUFFERED"
      when AL::InvokeMode::ResponseStream then "RESPONSE_STREAM"
      else
        raise Exception.new("unknown enum value for 'InvokeMode' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AL::InvokeMode?
      case key
      when "BUFFERED"        then AL::InvokeMode::Buffered
      when "RESPONSE_STREAM" then AL::InvokeMode::ResponseStream
      else
        nil
      end
    end
  end
end
