private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum OfferingTypeValues
    HeavyUtilization
    MediumUtilization
    LightUtilization
    NoUpfront
    PartialUpfront
    AllUpfront

    def self.to_json(e : OfferingTypeValues, json : JSON::Builder) : Nil
      value = case e
              when AEC::OfferingTypeValues::HeavyUtilization  then "Heavy Utilization"
              when AEC::OfferingTypeValues::MediumUtilization then "Medium Utilization"
              when AEC::OfferingTypeValues::LightUtilization  then "Light Utilization"
              when AEC::OfferingTypeValues::NoUpfront         then "No Upfront"
              when AEC::OfferingTypeValues::PartialUpfront    then "Partial Upfront"
              when AEC::OfferingTypeValues::AllUpfront        then "All Upfront"
              else
                raise Exception.new("unknown enum value for 'OfferingTypeValues' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::OfferingTypeValues
      value = pull.read_string
      case value
      when "Heavy Utilization"  then AEC::OfferingTypeValues::HeavyUtilization
      when "Medium Utilization" then AEC::OfferingTypeValues::MediumUtilization
      when "Light Utilization"  then AEC::OfferingTypeValues::LightUtilization
      when "No Upfront"         then AEC::OfferingTypeValues::NoUpfront
      when "Partial Upfront"    then AEC::OfferingTypeValues::PartialUpfront
      when "All Upfront"        then AEC::OfferingTypeValues::AllUpfront
      else
        raise Exception.new("unknown enum value for 'OfferingTypeValues' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::OfferingTypeValues::HeavyUtilization  then "Heavy Utilization"
      when AEC::OfferingTypeValues::MediumUtilization then "Medium Utilization"
      when AEC::OfferingTypeValues::LightUtilization  then "Light Utilization"
      when AEC::OfferingTypeValues::NoUpfront         then "No Upfront"
      when AEC::OfferingTypeValues::PartialUpfront    then "Partial Upfront"
      when AEC::OfferingTypeValues::AllUpfront        then "All Upfront"
      else
        raise Exception.new("unknown enum value for 'OfferingTypeValues' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::OfferingTypeValues?
      case key
      when "Heavy Utilization"  then AEC::OfferingTypeValues::HeavyUtilization
      when "Medium Utilization" then AEC::OfferingTypeValues::MediumUtilization
      when "Light Utilization"  then AEC::OfferingTypeValues::LightUtilization
      when "No Upfront"         then AEC::OfferingTypeValues::NoUpfront
      when "Partial Upfront"    then AEC::OfferingTypeValues::PartialUpfront
      when "All Upfront"        then AEC::OfferingTypeValues::AllUpfront
      else
        nil
      end
    end
  end
end
