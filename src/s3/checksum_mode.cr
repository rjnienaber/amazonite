private alias AS = Amazonite::S3

module Amazonite::S3
  enum ChecksumMode
    Enabled

    def self.to_json(e : ChecksumMode, json : JSON::Builder) : Nil
      value = case e
              when AS::ChecksumMode::Enabled then "ENABLED"
              else
                raise Exception.new("unknown enum value for 'ChecksumMode' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AS::ChecksumMode
      value = pull.read_string
      case value
      when "ENABLED" then AS::ChecksumMode::Enabled
      else
        raise Exception.new("unknown enum value for 'ChecksumMode' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AS::ChecksumMode::Enabled then "ENABLED"
      else
        raise Exception.new("unknown enum value for 'ChecksumMode' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AS::ChecksumMode?
      case key
      when "ENABLED" then AS::ChecksumMode::Enabled
      else
        nil
      end
    end
  end
end
