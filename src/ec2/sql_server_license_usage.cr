private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum SqlServerLicenseUsage
    Full
    Waived

    def self.to_json(e : SqlServerLicenseUsage, json : JSON::Builder) : Nil
      value = case e
              when AEC::SqlServerLicenseUsage::Full   then "full"
              when AEC::SqlServerLicenseUsage::Waived then "waived"
              else
                raise Exception.new("unknown enum value for 'SqlServerLicenseUsage' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::SqlServerLicenseUsage
      value = pull.read_string
      case value
      when "full"   then AEC::SqlServerLicenseUsage::Full
      when "waived" then AEC::SqlServerLicenseUsage::Waived
      else
        raise Exception.new("unknown enum value for 'SqlServerLicenseUsage' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::SqlServerLicenseUsage::Full   then "full"
      when AEC::SqlServerLicenseUsage::Waived then "waived"
      else
        raise Exception.new("unknown enum value for 'SqlServerLicenseUsage' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::SqlServerLicenseUsage?
      case key
      when "full"   then AEC::SqlServerLicenseUsage::Full
      when "waived" then AEC::SqlServerLicenseUsage::Waived
      else
        nil
      end
    end
  end
end
