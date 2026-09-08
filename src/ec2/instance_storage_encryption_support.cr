private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum InstanceStorageEncryptionSupport
    Unsupported
    Required

    def self.to_json(e : InstanceStorageEncryptionSupport, json : JSON::Builder) : Nil
      value = case e
              when AEC::InstanceStorageEncryptionSupport::Unsupported then "unsupported"
              when AEC::InstanceStorageEncryptionSupport::Required    then "required"
              else
                raise Exception.new("unknown enum value for 'InstanceStorageEncryptionSupport' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::InstanceStorageEncryptionSupport
      value = pull.read_string
      case value
      when "unsupported" then AEC::InstanceStorageEncryptionSupport::Unsupported
      when "required"    then AEC::InstanceStorageEncryptionSupport::Required
      else
        raise Exception.new("unknown enum value for 'InstanceStorageEncryptionSupport' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::InstanceStorageEncryptionSupport::Unsupported then "unsupported"
      when AEC::InstanceStorageEncryptionSupport::Required    then "required"
      else
        raise Exception.new("unknown enum value for 'InstanceStorageEncryptionSupport' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::InstanceStorageEncryptionSupport?
      case key
      when "unsupported" then AEC::InstanceStorageEncryptionSupport::Unsupported
      when "required"    then AEC::InstanceStorageEncryptionSupport::Required
      else
        nil
      end
    end
  end
end
