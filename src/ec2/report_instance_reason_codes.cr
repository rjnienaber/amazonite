private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum ReportInstanceReasonCodes
    InstanceStuckInState
    Unresponsive
    NotAcceptingCredentials
    PasswordNotAvailable
    PerformanceNetwork
    PerformanceInstanceStore
    PerformanceEbsVolume
    PerformanceOther
    Other

    def self.to_json(e : ReportInstanceReasonCodes, json : JSON::Builder) : Nil
      value = case e
              when AEC::ReportInstanceReasonCodes::InstanceStuckInState     then "instance-stuck-in-state"
              when AEC::ReportInstanceReasonCodes::Unresponsive             then "unresponsive"
              when AEC::ReportInstanceReasonCodes::NotAcceptingCredentials  then "not-accepting-credentials"
              when AEC::ReportInstanceReasonCodes::PasswordNotAvailable     then "password-not-available"
              when AEC::ReportInstanceReasonCodes::PerformanceNetwork       then "performance-network"
              when AEC::ReportInstanceReasonCodes::PerformanceInstanceStore then "performance-instance-store"
              when AEC::ReportInstanceReasonCodes::PerformanceEbsVolume     then "performance-ebs-volume"
              when AEC::ReportInstanceReasonCodes::PerformanceOther         then "performance-other"
              when AEC::ReportInstanceReasonCodes::Other                    then "other"
              else
                raise Exception.new("unknown enum value for 'ReportInstanceReasonCodes' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::ReportInstanceReasonCodes
      value = pull.read_string
      case value
      when "instance-stuck-in-state"    then AEC::ReportInstanceReasonCodes::InstanceStuckInState
      when "unresponsive"               then AEC::ReportInstanceReasonCodes::Unresponsive
      when "not-accepting-credentials"  then AEC::ReportInstanceReasonCodes::NotAcceptingCredentials
      when "password-not-available"     then AEC::ReportInstanceReasonCodes::PasswordNotAvailable
      when "performance-network"        then AEC::ReportInstanceReasonCodes::PerformanceNetwork
      when "performance-instance-store" then AEC::ReportInstanceReasonCodes::PerformanceInstanceStore
      when "performance-ebs-volume"     then AEC::ReportInstanceReasonCodes::PerformanceEbsVolume
      when "performance-other"          then AEC::ReportInstanceReasonCodes::PerformanceOther
      when "other"                      then AEC::ReportInstanceReasonCodes::Other
      else
        raise Exception.new("unknown enum value for 'ReportInstanceReasonCodes' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::ReportInstanceReasonCodes::InstanceStuckInState     then "instance-stuck-in-state"
      when AEC::ReportInstanceReasonCodes::Unresponsive             then "unresponsive"
      when AEC::ReportInstanceReasonCodes::NotAcceptingCredentials  then "not-accepting-credentials"
      when AEC::ReportInstanceReasonCodes::PasswordNotAvailable     then "password-not-available"
      when AEC::ReportInstanceReasonCodes::PerformanceNetwork       then "performance-network"
      when AEC::ReportInstanceReasonCodes::PerformanceInstanceStore then "performance-instance-store"
      when AEC::ReportInstanceReasonCodes::PerformanceEbsVolume     then "performance-ebs-volume"
      when AEC::ReportInstanceReasonCodes::PerformanceOther         then "performance-other"
      when AEC::ReportInstanceReasonCodes::Other                    then "other"
      else
        raise Exception.new("unknown enum value for 'ReportInstanceReasonCodes' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::ReportInstanceReasonCodes?
      case key
      when "instance-stuck-in-state"    then AEC::ReportInstanceReasonCodes::InstanceStuckInState
      when "unresponsive"               then AEC::ReportInstanceReasonCodes::Unresponsive
      when "not-accepting-credentials"  then AEC::ReportInstanceReasonCodes::NotAcceptingCredentials
      when "password-not-available"     then AEC::ReportInstanceReasonCodes::PasswordNotAvailable
      when "performance-network"        then AEC::ReportInstanceReasonCodes::PerformanceNetwork
      when "performance-instance-store" then AEC::ReportInstanceReasonCodes::PerformanceInstanceStore
      when "performance-ebs-volume"     then AEC::ReportInstanceReasonCodes::PerformanceEbsVolume
      when "performance-other"          then AEC::ReportInstanceReasonCodes::PerformanceOther
      when "other"                      then AEC::ReportInstanceReasonCodes::Other
      else
        nil
      end
    end
  end
end
