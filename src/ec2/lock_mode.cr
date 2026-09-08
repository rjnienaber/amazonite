private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum LockMode
    Compliance
    Governance

    def self.to_json(e : LockMode, json : JSON::Builder) : Nil
      value = case e
              when AEC::LockMode::Compliance then "compliance"
              when AEC::LockMode::Governance then "governance"
              else
                raise Exception.new("unknown enum value for 'LockMode' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::LockMode
      value = pull.read_string
      case value
      when "compliance" then AEC::LockMode::Compliance
      when "governance" then AEC::LockMode::Governance
      else
        raise Exception.new("unknown enum value for 'LockMode' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::LockMode::Compliance then "compliance"
      when AEC::LockMode::Governance then "governance"
      else
        raise Exception.new("unknown enum value for 'LockMode' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::LockMode?
      case key
      when "compliance" then AEC::LockMode::Compliance
      when "governance" then AEC::LockMode::Governance
      else
        nil
      end
    end
  end
end
