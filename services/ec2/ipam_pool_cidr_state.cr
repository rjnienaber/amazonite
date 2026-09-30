private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum IpamPoolCidrState
    PendingProvision
    Provisioned
    FailedProvision
    PendingDeprovision
    Deprovisioned
    FailedDeprovision
    PendingImport
    FailedImport

    def self.to_json(e : IpamPoolCidrState, json : JSON::Builder) : Nil
      value = case e
              when AEC::IpamPoolCidrState::PendingProvision   then "pending-provision"
              when AEC::IpamPoolCidrState::Provisioned        then "provisioned"
              when AEC::IpamPoolCidrState::FailedProvision    then "failed-provision"
              when AEC::IpamPoolCidrState::PendingDeprovision then "pending-deprovision"
              when AEC::IpamPoolCidrState::Deprovisioned      then "deprovisioned"
              when AEC::IpamPoolCidrState::FailedDeprovision  then "failed-deprovision"
              when AEC::IpamPoolCidrState::PendingImport      then "pending-import"
              when AEC::IpamPoolCidrState::FailedImport       then "failed-import"
              else
                raise Exception.new("unknown enum value for 'IpamPoolCidrState' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::IpamPoolCidrState
      value = pull.read_string
      case value
      when "pending-provision"   then AEC::IpamPoolCidrState::PendingProvision
      when "provisioned"         then AEC::IpamPoolCidrState::Provisioned
      when "failed-provision"    then AEC::IpamPoolCidrState::FailedProvision
      when "pending-deprovision" then AEC::IpamPoolCidrState::PendingDeprovision
      when "deprovisioned"       then AEC::IpamPoolCidrState::Deprovisioned
      when "failed-deprovision"  then AEC::IpamPoolCidrState::FailedDeprovision
      when "pending-import"      then AEC::IpamPoolCidrState::PendingImport
      when "failed-import"       then AEC::IpamPoolCidrState::FailedImport
      else
        raise Exception.new("unknown enum value for 'IpamPoolCidrState' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::IpamPoolCidrState::PendingProvision   then "pending-provision"
      when AEC::IpamPoolCidrState::Provisioned        then "provisioned"
      when AEC::IpamPoolCidrState::FailedProvision    then "failed-provision"
      when AEC::IpamPoolCidrState::PendingDeprovision then "pending-deprovision"
      when AEC::IpamPoolCidrState::Deprovisioned      then "deprovisioned"
      when AEC::IpamPoolCidrState::FailedDeprovision  then "failed-deprovision"
      when AEC::IpamPoolCidrState::PendingImport      then "pending-import"
      when AEC::IpamPoolCidrState::FailedImport       then "failed-import"
      else
        raise Exception.new("unknown enum value for 'IpamPoolCidrState' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::IpamPoolCidrState?
      case key
      when "pending-provision"   then AEC::IpamPoolCidrState::PendingProvision
      when "provisioned"         then AEC::IpamPoolCidrState::Provisioned
      when "failed-provision"    then AEC::IpamPoolCidrState::FailedProvision
      when "pending-deprovision" then AEC::IpamPoolCidrState::PendingDeprovision
      when "deprovisioned"       then AEC::IpamPoolCidrState::Deprovisioned
      when "failed-deprovision"  then AEC::IpamPoolCidrState::FailedDeprovision
      when "pending-import"      then AEC::IpamPoolCidrState::PendingImport
      when "failed-import"       then AEC::IpamPoolCidrState::FailedImport
      else
        nil
      end
    end
  end
end
