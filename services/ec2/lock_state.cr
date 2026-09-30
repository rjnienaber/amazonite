private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum LockState
    Compliance
    Governance
    ComplianceCooloff
    Expired

    def self.to_json(e : LockState, json : JSON::Builder) : Nil
      value = case e
              when AEC::LockState::Compliance        then "compliance"
              when AEC::LockState::Governance        then "governance"
              when AEC::LockState::ComplianceCooloff then "compliance-cooloff"
              when AEC::LockState::Expired           then "expired"
              else
                raise Exception.new("unknown enum value for 'LockState' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::LockState
      value = pull.read_string
      case value
      when "compliance"         then AEC::LockState::Compliance
      when "governance"         then AEC::LockState::Governance
      when "compliance-cooloff" then AEC::LockState::ComplianceCooloff
      when "expired"            then AEC::LockState::Expired
      else
        raise Exception.new("unknown enum value for 'LockState' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::LockState::Compliance        then "compliance"
      when AEC::LockState::Governance        then "governance"
      when AEC::LockState::ComplianceCooloff then "compliance-cooloff"
      when AEC::LockState::Expired           then "expired"
      else
        raise Exception.new("unknown enum value for 'LockState' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::LockState?
      case key
      when "compliance"         then AEC::LockState::Compliance
      when "governance"         then AEC::LockState::Governance
      when "compliance-cooloff" then AEC::LockState::ComplianceCooloff
      when "expired"            then AEC::LockState::Expired
      else
        nil
      end
    end
  end
end
