private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum SupportabilityScore
    High
    Medium
    Low

    def self.to_json(e : SupportabilityScore, json : JSON::Builder) : Nil
      value = case e
              when AEC::SupportabilityScore::High   then "high"
              when AEC::SupportabilityScore::Medium then "medium"
              when AEC::SupportabilityScore::Low    then "low"
              else
                raise Exception.new("unknown enum value for 'SupportabilityScore' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::SupportabilityScore
      value = pull.read_string
      case value
      when "high"   then AEC::SupportabilityScore::High
      when "medium" then AEC::SupportabilityScore::Medium
      when "low"    then AEC::SupportabilityScore::Low
      else
        raise Exception.new("unknown enum value for 'SupportabilityScore' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::SupportabilityScore::High   then "high"
      when AEC::SupportabilityScore::Medium then "medium"
      when AEC::SupportabilityScore::Low    then "low"
      else
        raise Exception.new("unknown enum value for 'SupportabilityScore' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::SupportabilityScore?
      case key
      when "high"   then AEC::SupportabilityScore::High
      when "medium" then AEC::SupportabilityScore::Medium
      when "low"    then AEC::SupportabilityScore::Low
      else
        nil
      end
    end
  end
end
