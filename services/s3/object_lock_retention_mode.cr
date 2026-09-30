private alias AS = Amazonite::S3

module Amazonite::S3
  enum ObjectLockRetentionMode
    Governance
    Compliance

    def self.to_json(e : ObjectLockRetentionMode, json : JSON::Builder) : Nil
      value = case e
              when AS::ObjectLockRetentionMode::Governance then "GOVERNANCE"
              when AS::ObjectLockRetentionMode::Compliance then "COMPLIANCE"
              else
                raise Exception.new("unknown enum value for 'ObjectLockRetentionMode' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AS::ObjectLockRetentionMode
      value = pull.read_string
      case value
      when "GOVERNANCE" then AS::ObjectLockRetentionMode::Governance
      when "COMPLIANCE" then AS::ObjectLockRetentionMode::Compliance
      else
        raise Exception.new("unknown enum value for 'ObjectLockRetentionMode' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AS::ObjectLockRetentionMode::Governance then "GOVERNANCE"
      when AS::ObjectLockRetentionMode::Compliance then "COMPLIANCE"
      else
        raise Exception.new("unknown enum value for 'ObjectLockRetentionMode' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AS::ObjectLockRetentionMode?
      case key
      when "GOVERNANCE" then AS::ObjectLockRetentionMode::Governance
      when "COMPLIANCE" then AS::ObjectLockRetentionMode::Compliance
      else
        nil
      end
    end
  end
end
