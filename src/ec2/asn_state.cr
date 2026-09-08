private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum AsnState
    Deprovisioned
    FailedDeprovision
    FailedProvision
    PendingDeprovision
    PendingProvision
    Provisioned

    def self.to_json(e : AsnState, json : JSON::Builder) : Nil
      value = case e
              when AEC::AsnState::Deprovisioned      then "deprovisioned"
              when AEC::AsnState::FailedDeprovision  then "failed-deprovision"
              when AEC::AsnState::FailedProvision    then "failed-provision"
              when AEC::AsnState::PendingDeprovision then "pending-deprovision"
              when AEC::AsnState::PendingProvision   then "pending-provision"
              when AEC::AsnState::Provisioned        then "provisioned"
              else
                raise Exception.new("unknown enum value for 'AsnState' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::AsnState
      value = pull.read_string
      case value
      when "deprovisioned"       then AEC::AsnState::Deprovisioned
      when "failed-deprovision"  then AEC::AsnState::FailedDeprovision
      when "failed-provision"    then AEC::AsnState::FailedProvision
      when "pending-deprovision" then AEC::AsnState::PendingDeprovision
      when "pending-provision"   then AEC::AsnState::PendingProvision
      when "provisioned"         then AEC::AsnState::Provisioned
      else
        raise Exception.new("unknown enum value for 'AsnState' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::AsnState::Deprovisioned      then "deprovisioned"
      when AEC::AsnState::FailedDeprovision  then "failed-deprovision"
      when AEC::AsnState::FailedProvision    then "failed-provision"
      when AEC::AsnState::PendingDeprovision then "pending-deprovision"
      when AEC::AsnState::PendingProvision   then "pending-provision"
      when AEC::AsnState::Provisioned        then "provisioned"
      else
        raise Exception.new("unknown enum value for 'AsnState' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::AsnState?
      case key
      when "deprovisioned"       then AEC::AsnState::Deprovisioned
      when "failed-deprovision"  then AEC::AsnState::FailedDeprovision
      when "failed-provision"    then AEC::AsnState::FailedProvision
      when "pending-deprovision" then AEC::AsnState::PendingDeprovision
      when "pending-provision"   then AEC::AsnState::PendingProvision
      when "provisioned"         then AEC::AsnState::Provisioned
      else
        nil
      end
    end
  end
end
