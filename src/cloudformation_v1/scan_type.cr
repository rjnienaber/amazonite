private alias ACF = Amazonite::CloudFormationV1

module Amazonite::CloudFormationV1
  enum ScanType
    Full
    Partial

    def self.to_json(e : ScanType, json : JSON::Builder) : Nil
      value = case e
              when ACF::ScanType::Full    then "FULL"
              when ACF::ScanType::Partial then "PARTIAL"
              else
                raise Exception.new("unknown enum value for 'ScanType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : ACF::ScanType
      value = pull.read_string
      case value
      when "FULL"    then ACF::ScanType::Full
      when "PARTIAL" then ACF::ScanType::Partial
      else
        raise Exception.new("unknown enum value for 'ScanType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when ACF::ScanType::Full    then "FULL"
      when ACF::ScanType::Partial then "PARTIAL"
      else
        raise Exception.new("unknown enum value for 'ScanType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : ACF::ScanType?
      case key
      when "FULL"    then ACF::ScanType::Full
      when "PARTIAL" then ACF::ScanType::Partial
      else
        nil
      end
    end
  end
end
