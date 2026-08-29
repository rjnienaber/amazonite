private alias AS = Amazonite::SqsV1

module Amazonite::SqsV1
  enum MessageSystemAttributeNameForSends
    AwsTraceHeader

    def self.to_json(e : MessageSystemAttributeNameForSends, json : JSON::Builder) : Nil
      value = case e
              when AS::MessageSystemAttributeNameForSends::AwsTraceHeader then "AWSTraceHeader"
              else
                raise Exception.new("unknown enum value for 'MessageSystemAttributeNameForSends' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AS::MessageSystemAttributeNameForSends
      value = pull.read_string
      case value
      when "AWSTraceHeader" then AS::MessageSystemAttributeNameForSends::AwsTraceHeader
      else
        raise Exception.new("unknown enum value for 'MessageSystemAttributeNameForSends' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AS::MessageSystemAttributeNameForSends::AwsTraceHeader then "AWSTraceHeader"
      else
        raise Exception.new("unknown enum value for 'MessageSystemAttributeNameForSends' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AS::MessageSystemAttributeNameForSends?
      case key
      when "AWSTraceHeader" then AS::MessageSystemAttributeNameForSends::AwsTraceHeader
      else
        nil
      end
    end
  end
end
