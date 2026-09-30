private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum RIProductDescription
    LinuxUnix
    LinuxUnixAmazonVpc
    Windows
    WindowsAmazonVpc

    def self.to_json(e : RIProductDescription, json : JSON::Builder) : Nil
      value = case e
              when AEC::RIProductDescription::LinuxUnix          then "Linux/UNIX"
              when AEC::RIProductDescription::LinuxUnixAmazonVpc then "Linux/UNIX (Amazon VPC)"
              when AEC::RIProductDescription::Windows            then "Windows"
              when AEC::RIProductDescription::WindowsAmazonVpc   then "Windows (Amazon VPC)"
              else
                raise Exception.new("unknown enum value for 'RIProductDescription' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::RIProductDescription
      value = pull.read_string
      case value
      when "Linux/UNIX"              then AEC::RIProductDescription::LinuxUnix
      when "Linux/UNIX (Amazon VPC)" then AEC::RIProductDescription::LinuxUnixAmazonVpc
      when "Windows"                 then AEC::RIProductDescription::Windows
      when "Windows (Amazon VPC)"    then AEC::RIProductDescription::WindowsAmazonVpc
      else
        raise Exception.new("unknown enum value for 'RIProductDescription' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::RIProductDescription::LinuxUnix          then "Linux/UNIX"
      when AEC::RIProductDescription::LinuxUnixAmazonVpc then "Linux/UNIX (Amazon VPC)"
      when AEC::RIProductDescription::Windows            then "Windows"
      when AEC::RIProductDescription::WindowsAmazonVpc   then "Windows (Amazon VPC)"
      else
        raise Exception.new("unknown enum value for 'RIProductDescription' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::RIProductDescription?
      case key
      when "Linux/UNIX"              then AEC::RIProductDescription::LinuxUnix
      when "Linux/UNIX (Amazon VPC)" then AEC::RIProductDescription::LinuxUnixAmazonVpc
      when "Windows"                 then AEC::RIProductDescription::Windows
      when "Windows (Amazon VPC)"    then AEC::RIProductDescription::WindowsAmazonVpc
      else
        nil
      end
    end
  end
end
