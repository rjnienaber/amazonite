private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum VerificationMethod
    RemarksX509
    DnsToken

    def self.to_json(e : VerificationMethod, json : JSON::Builder) : Nil
      value = case e
              when AEC::VerificationMethod::RemarksX509 then "remarks-x509"
              when AEC::VerificationMethod::DnsToken    then "dns-token"
              else
                raise Exception.new("unknown enum value for 'VerificationMethod' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::VerificationMethod
      value = pull.read_string
      case value
      when "remarks-x509" then AEC::VerificationMethod::RemarksX509
      when "dns-token"    then AEC::VerificationMethod::DnsToken
      else
        raise Exception.new("unknown enum value for 'VerificationMethod' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::VerificationMethod::RemarksX509 then "remarks-x509"
      when AEC::VerificationMethod::DnsToken    then "dns-token"
      else
        raise Exception.new("unknown enum value for 'VerificationMethod' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::VerificationMethod?
      case key
      when "remarks-x509" then AEC::VerificationMethod::RemarksX509
      when "dns-token"    then AEC::VerificationMethod::DnsToken
      else
        nil
      end
    end
  end
end
