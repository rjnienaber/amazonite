private alias ACWL = Amazonite::CloudWatchLogsV1

module Amazonite::CloudWatchLogsV1
  enum EventSource
    CloudTrail
    Route53Resolver
    VpcFlow
    EksAudit
    Awswaf

    def self.to_json(e : EventSource, json : JSON::Builder) : Nil
      value = case e
              when ACWL::EventSource::CloudTrail      then "CloudTrail"
              when ACWL::EventSource::Route53Resolver then "Route53Resolver"
              when ACWL::EventSource::VpcFlow         then "VPCFlow"
              when ACWL::EventSource::EksAudit        then "EKSAudit"
              when ACWL::EventSource::Awswaf          then "AWSWAF"
              else
                raise Exception.new("unknown enum value for 'EventSource' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : ACWL::EventSource
      value = pull.read_string
      case value
      when "CloudTrail"      then ACWL::EventSource::CloudTrail
      when "Route53Resolver" then ACWL::EventSource::Route53Resolver
      when "VPCFlow"         then ACWL::EventSource::VpcFlow
      when "EKSAudit"        then ACWL::EventSource::EksAudit
      when "AWSWAF"          then ACWL::EventSource::Awswaf
      else
        raise Exception.new("unknown enum value for 'EventSource' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when ACWL::EventSource::CloudTrail      then "CloudTrail"
      when ACWL::EventSource::Route53Resolver then "Route53Resolver"
      when ACWL::EventSource::VpcFlow         then "VPCFlow"
      when ACWL::EventSource::EksAudit        then "EKSAudit"
      when ACWL::EventSource::Awswaf          then "AWSWAF"
      else
        raise Exception.new("unknown enum value for 'EventSource' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : ACWL::EventSource?
      case key
      when "CloudTrail"      then ACWL::EventSource::CloudTrail
      when "Route53Resolver" then ACWL::EventSource::Route53Resolver
      when "VPCFlow"         then ACWL::EventSource::VpcFlow
      when "EKSAudit"        then ACWL::EventSource::EksAudit
      when "AWSWAF"          then ACWL::EventSource::Awswaf
      else
        nil
      end
    end
  end
end
