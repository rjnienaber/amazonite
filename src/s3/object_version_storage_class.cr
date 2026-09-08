private alias AS = Amazonite::S3

module Amazonite::S3
  enum ObjectVersionStorageClass
    Standard

    def self.to_json(e : ObjectVersionStorageClass, json : JSON::Builder) : Nil
      value = case e
              when AS::ObjectVersionStorageClass::Standard then "STANDARD"
              else
                raise Exception.new("unknown enum value for 'ObjectVersionStorageClass' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AS::ObjectVersionStorageClass
      value = pull.read_string
      case value
      when "STANDARD" then AS::ObjectVersionStorageClass::Standard
      else
        raise Exception.new("unknown enum value for 'ObjectVersionStorageClass' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AS::ObjectVersionStorageClass::Standard then "STANDARD"
      else
        raise Exception.new("unknown enum value for 'ObjectVersionStorageClass' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AS::ObjectVersionStorageClass?
      case key
      when "STANDARD" then AS::ObjectVersionStorageClass::Standard
      else
        nil
      end
    end
  end
end
