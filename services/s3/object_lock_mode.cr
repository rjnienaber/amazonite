private alias AS = Amazonite::S3

module Amazonite::S3
  enum ObjectLockMode
    Governance
    Compliance

    def self.to_json(e : ObjectLockMode, json : JSON::Builder) : Nil
      value = case e
              when AS::ObjectLockMode::Governance then "GOVERNANCE"
              when AS::ObjectLockMode::Compliance then "COMPLIANCE"
              else
                raise Exception.new("unknown enum value for 'ObjectLockMode' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AS::ObjectLockMode
      value = pull.read_string
      case value
      when "GOVERNANCE" then AS::ObjectLockMode::Governance
      when "COMPLIANCE" then AS::ObjectLockMode::Compliance
      else
        raise Exception.new("unknown enum value for 'ObjectLockMode' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AS::ObjectLockMode::Governance then "GOVERNANCE"
      when AS::ObjectLockMode::Compliance then "COMPLIANCE"
      else
        raise Exception.new("unknown enum value for 'ObjectLockMode' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AS::ObjectLockMode?
      case key
      when "GOVERNANCE" then AS::ObjectLockMode::Governance
      when "COMPLIANCE" then AS::ObjectLockMode::Compliance
      else
        nil
      end
    end
  end
end
