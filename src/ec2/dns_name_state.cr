private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum DnsNameState
    PendingVerification
    Verified
    Failed

    def self.to_json(e : DnsNameState, json : JSON::Builder) : Nil
      value = case e
              when AEC::DnsNameState::PendingVerification then "pendingVerification"
              when AEC::DnsNameState::Verified            then "verified"
              when AEC::DnsNameState::Failed              then "failed"
              else
                raise Exception.new("unknown enum value for 'DnsNameState' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::DnsNameState
      value = pull.read_string
      case value
      when "pendingVerification" then AEC::DnsNameState::PendingVerification
      when "verified"            then AEC::DnsNameState::Verified
      when "failed"              then AEC::DnsNameState::Failed
      else
        raise Exception.new("unknown enum value for 'DnsNameState' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::DnsNameState::PendingVerification then "pendingVerification"
      when AEC::DnsNameState::Verified            then "verified"
      when AEC::DnsNameState::Failed              then "failed"
      else
        raise Exception.new("unknown enum value for 'DnsNameState' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::DnsNameState?
      case key
      when "pendingVerification" then AEC::DnsNameState::PendingVerification
      when "verified"            then AEC::DnsNameState::Verified
      when "failed"              then AEC::DnsNameState::Failed
      else
        nil
      end
    end
  end
end
