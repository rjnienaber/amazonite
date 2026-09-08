private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum SummaryStatus
    Ok
    Impaired
    InsufficientData
    NotApplicable
    Initializing

    def self.to_json(e : SummaryStatus, json : JSON::Builder) : Nil
      value = case e
              when AEC::SummaryStatus::Ok               then "ok"
              when AEC::SummaryStatus::Impaired         then "impaired"
              when AEC::SummaryStatus::InsufficientData then "insufficient-data"
              when AEC::SummaryStatus::NotApplicable    then "not-applicable"
              when AEC::SummaryStatus::Initializing     then "initializing"
              else
                raise Exception.new("unknown enum value for 'SummaryStatus' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::SummaryStatus
      value = pull.read_string
      case value
      when "ok"                then AEC::SummaryStatus::Ok
      when "impaired"          then AEC::SummaryStatus::Impaired
      when "insufficient-data" then AEC::SummaryStatus::InsufficientData
      when "not-applicable"    then AEC::SummaryStatus::NotApplicable
      when "initializing"      then AEC::SummaryStatus::Initializing
      else
        raise Exception.new("unknown enum value for 'SummaryStatus' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::SummaryStatus::Ok               then "ok"
      when AEC::SummaryStatus::Impaired         then "impaired"
      when AEC::SummaryStatus::InsufficientData then "insufficient-data"
      when AEC::SummaryStatus::NotApplicable    then "not-applicable"
      when AEC::SummaryStatus::Initializing     then "initializing"
      else
        raise Exception.new("unknown enum value for 'SummaryStatus' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::SummaryStatus?
      case key
      when "ok"                then AEC::SummaryStatus::Ok
      when "impaired"          then AEC::SummaryStatus::Impaired
      when "insufficient-data" then AEC::SummaryStatus::InsufficientData
      when "not-applicable"    then AEC::SummaryStatus::NotApplicable
      when "initializing"      then AEC::SummaryStatus::Initializing
      else
        nil
      end
    end
  end
end
