private alias AS = Amazonite::S3

module Amazonite::S3
  enum SessionMode
    ReadOnly
    ReadWrite

    def self.to_json(e : SessionMode, json : JSON::Builder) : Nil
      json.string(e.to_s)
    end

    def self.from_json(pull : JSON::PullParser) : AS::SessionMode
      value = pull.read_string
      case value
      when "ReadOnly"  then AS::SessionMode::ReadOnly
      when "ReadWrite" then AS::SessionMode::ReadWrite
      else
        raise Exception.new("unknown enum value for 'SessionMode' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      to_s
    end

    def self.from_json_object_key?(key : String) : AS::SessionMode?
      case key
      when "ReadOnly"  then AS::SessionMode::ReadOnly
      when "ReadWrite" then AS::SessionMode::ReadWrite
      else
        nil
      end
    end
  end
end
