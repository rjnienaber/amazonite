private alias AS = Amazonite::S3

module Amazonite::S3
  enum FileHeaderInfo
    Use
    Ignore
    None

    def self.to_json(e : FileHeaderInfo, json : JSON::Builder) : Nil
      value = case e
              when AS::FileHeaderInfo::Use    then "USE"
              when AS::FileHeaderInfo::Ignore then "IGNORE"
              when AS::FileHeaderInfo::None   then "NONE"
              else
                raise Exception.new("unknown enum value for 'FileHeaderInfo' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AS::FileHeaderInfo
      value = pull.read_string
      case value
      when "USE"    then AS::FileHeaderInfo::Use
      when "IGNORE" then AS::FileHeaderInfo::Ignore
      when "NONE"   then AS::FileHeaderInfo::None
      else
        raise Exception.new("unknown enum value for 'FileHeaderInfo' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AS::FileHeaderInfo::Use    then "USE"
      when AS::FileHeaderInfo::Ignore then "IGNORE"
      when AS::FileHeaderInfo::None   then "NONE"
      else
        raise Exception.new("unknown enum value for 'FileHeaderInfo' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AS::FileHeaderInfo?
      case key
      when "USE"    then AS::FileHeaderInfo::Use
      when "IGNORE" then AS::FileHeaderInfo::Ignore
      when "NONE"   then AS::FileHeaderInfo::None
      else
        nil
      end
    end
  end
end
