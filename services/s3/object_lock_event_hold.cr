private alias AS = Amazonite::S3

module Amazonite::S3
  enum ObjectLockEventHold
    On
    Off

    def self.to_json(e : ObjectLockEventHold, json : JSON::Builder) : Nil
      value = case e
              when AS::ObjectLockEventHold::On  then "ON"
              when AS::ObjectLockEventHold::Off then "OFF"
              else
                raise Exception.new("unknown enum value for 'ObjectLockEventHold' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AS::ObjectLockEventHold
      value = pull.read_string
      case value
      when "ON"  then AS::ObjectLockEventHold::On
      when "OFF" then AS::ObjectLockEventHold::Off
      else
        raise Exception.new("unknown enum value for 'ObjectLockEventHold' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AS::ObjectLockEventHold::On  then "ON"
      when AS::ObjectLockEventHold::Off then "OFF"
      else
        raise Exception.new("unknown enum value for 'ObjectLockEventHold' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AS::ObjectLockEventHold?
      case key
      when "ON"  then AS::ObjectLockEventHold::On
      when "OFF" then AS::ObjectLockEventHold::Off
      else
        nil
      end
    end
  end
end
