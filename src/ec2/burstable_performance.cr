private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum BurstablePerformance
    Included
    Required
    Excluded

    def self.to_json(e : BurstablePerformance, json : JSON::Builder) : Nil
      value = case e
              when AEC::BurstablePerformance::Included then "included"
              when AEC::BurstablePerformance::Required then "required"
              when AEC::BurstablePerformance::Excluded then "excluded"
              else
                raise Exception.new("unknown enum value for 'BurstablePerformance' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::BurstablePerformance
      value = pull.read_string
      case value
      when "included" then AEC::BurstablePerformance::Included
      when "required" then AEC::BurstablePerformance::Required
      when "excluded" then AEC::BurstablePerformance::Excluded
      else
        raise Exception.new("unknown enum value for 'BurstablePerformance' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::BurstablePerformance::Included then "included"
      when AEC::BurstablePerformance::Required then "required"
      when AEC::BurstablePerformance::Excluded then "excluded"
      else
        raise Exception.new("unknown enum value for 'BurstablePerformance' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::BurstablePerformance?
      case key
      when "included" then AEC::BurstablePerformance::Included
      when "required" then AEC::BurstablePerformance::Required
      when "excluded" then AEC::BurstablePerformance::Excluded
      else
        nil
      end
    end
  end
end
