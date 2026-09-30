private alias AS = Amazonite::S3

module Amazonite::S3
  enum ObjectLockLegalHoldStatus
    On
    Off

    def self.to_json(e : ObjectLockLegalHoldStatus, json : JSON::Builder) : Nil
      value = case e
              when AS::ObjectLockLegalHoldStatus::On  then "ON"
              when AS::ObjectLockLegalHoldStatus::Off then "OFF"
              else
                raise Exception.new("unknown enum value for 'ObjectLockLegalHoldStatus' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AS::ObjectLockLegalHoldStatus
      value = pull.read_string
      case value
      when "ON"  then AS::ObjectLockLegalHoldStatus::On
      when "OFF" then AS::ObjectLockLegalHoldStatus::Off
      else
        raise Exception.new("unknown enum value for 'ObjectLockLegalHoldStatus' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AS::ObjectLockLegalHoldStatus::On  then "ON"
      when AS::ObjectLockLegalHoldStatus::Off then "OFF"
      else
        raise Exception.new("unknown enum value for 'ObjectLockLegalHoldStatus' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AS::ObjectLockLegalHoldStatus?
      case key
      when "ON"  then AS::ObjectLockLegalHoldStatus::On
      when "OFF" then AS::ObjectLockLegalHoldStatus::Off
      else
        nil
      end
    end
  end
end
