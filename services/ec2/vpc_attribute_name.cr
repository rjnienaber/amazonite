private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum VpcAttributeName
    EnableDnsSupport
    EnableDnsHostnames
    EnableNetworkAddressUsageMetrics

    def self.to_json(e : VpcAttributeName, json : JSON::Builder) : Nil
      value = case e
              when AEC::VpcAttributeName::EnableDnsSupport                 then "enableDnsSupport"
              when AEC::VpcAttributeName::EnableDnsHostnames               then "enableDnsHostnames"
              when AEC::VpcAttributeName::EnableNetworkAddressUsageMetrics then "enableNetworkAddressUsageMetrics"
              else
                raise Exception.new("unknown enum value for 'VpcAttributeName' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::VpcAttributeName
      value = pull.read_string
      case value
      when "enableDnsSupport"                 then AEC::VpcAttributeName::EnableDnsSupport
      when "enableDnsHostnames"               then AEC::VpcAttributeName::EnableDnsHostnames
      when "enableNetworkAddressUsageMetrics" then AEC::VpcAttributeName::EnableNetworkAddressUsageMetrics
      else
        raise Exception.new("unknown enum value for 'VpcAttributeName' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::VpcAttributeName::EnableDnsSupport                 then "enableDnsSupport"
      when AEC::VpcAttributeName::EnableDnsHostnames               then "enableDnsHostnames"
      when AEC::VpcAttributeName::EnableNetworkAddressUsageMetrics then "enableNetworkAddressUsageMetrics"
      else
        raise Exception.new("unknown enum value for 'VpcAttributeName' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::VpcAttributeName?
      case key
      when "enableDnsSupport"                 then AEC::VpcAttributeName::EnableDnsSupport
      when "enableDnsHostnames"               then AEC::VpcAttributeName::EnableDnsHostnames
      when "enableNetworkAddressUsageMetrics" then AEC::VpcAttributeName::EnableNetworkAddressUsageMetrics
      else
        nil
      end
    end
  end
end
