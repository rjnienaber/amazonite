private alias AS = Amazonite::S3

module Amazonite::S3
  enum ObjectLockEnabled
    Enabled

    def self.to_json(e : ObjectLockEnabled, json : JSON::Builder) : Nil
      json.string(e.to_s)
    end

    def self.from_json(pull : JSON::PullParser) : AS::ObjectLockEnabled
      value = pull.read_string
      case value
      when "Enabled" then AS::ObjectLockEnabled::Enabled
      else
        raise Exception.new("unknown enum value for 'ObjectLockEnabled' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      to_s
    end

    def self.from_json_object_key?(key : String) : AS::ObjectLockEnabled?
      case key
      when "Enabled" then AS::ObjectLockEnabled::Enabled
      else
        nil
      end
    end
  end
end
