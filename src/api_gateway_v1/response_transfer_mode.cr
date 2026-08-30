private alias AAG = Amazonite::ApiGatewayV1

module Amazonite::ApiGatewayV1
  enum ResponseTransferMode
    Buffered
    Stream

    def self.to_json(e : ResponseTransferMode, json : JSON::Builder) : Nil
      value = case e
              when AAG::ResponseTransferMode::Buffered then "BUFFERED"
              when AAG::ResponseTransferMode::Stream   then "STREAM"
              else
                raise Exception.new("unknown enum value for 'ResponseTransferMode' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AAG::ResponseTransferMode
      value = pull.read_string
      case value
      when "BUFFERED" then AAG::ResponseTransferMode::Buffered
      when "STREAM"   then AAG::ResponseTransferMode::Stream
      else
        raise Exception.new("unknown enum value for 'ResponseTransferMode' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AAG::ResponseTransferMode::Buffered then "BUFFERED"
      when AAG::ResponseTransferMode::Stream   then "STREAM"
      else
        raise Exception.new("unknown enum value for 'ResponseTransferMode' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AAG::ResponseTransferMode?
      case key
      when "BUFFERED" then AAG::ResponseTransferMode::Buffered
      when "STREAM"   then AAG::ResponseTransferMode::Stream
      else
        nil
      end
    end
  end
end
