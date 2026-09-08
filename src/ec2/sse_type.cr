private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum SSEType
    SseEbs
    SseKms
    None

    def self.to_json(e : SSEType, json : JSON::Builder) : Nil
      value = case e
              when AEC::SSEType::SseEbs then "sse-ebs"
              when AEC::SSEType::SseKms then "sse-kms"
              when AEC::SSEType::None   then "none"
              else
                raise Exception.new("unknown enum value for 'SSEType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::SSEType
      value = pull.read_string
      case value
      when "sse-ebs" then AEC::SSEType::SseEbs
      when "sse-kms" then AEC::SSEType::SseKms
      when "none"    then AEC::SSEType::None
      else
        raise Exception.new("unknown enum value for 'SSEType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::SSEType::SseEbs then "sse-ebs"
      when AEC::SSEType::SseKms then "sse-kms"
      when AEC::SSEType::None   then "none"
      else
        raise Exception.new("unknown enum value for 'SSEType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::SSEType?
      case key
      when "sse-ebs" then AEC::SSEType::SseEbs
      when "sse-kms" then AEC::SSEType::SseKms
      when "none"    then AEC::SSEType::None
      else
        nil
      end
    end
  end
end
