private alias AI = Amazonite::IamV1

module Amazonite::IamV1
  enum ReportStateType
    Started
    Inprogress
    Complete

    def self.to_json(e : ReportStateType, json : JSON::Builder) : Nil
      value = case e
              when AI::ReportStateType::Started    then "STARTED"
              when AI::ReportStateType::Inprogress then "INPROGRESS"
              when AI::ReportStateType::Complete   then "COMPLETE"
              else
                raise Exception.new("unknown enum value for 'ReportStateType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AI::ReportStateType
      value = pull.read_string
      case value
      when "STARTED"    then AI::ReportStateType::Started
      when "INPROGRESS" then AI::ReportStateType::Inprogress
      when "COMPLETE"   then AI::ReportStateType::Complete
      else
        raise Exception.new("unknown enum value for 'ReportStateType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AI::ReportStateType::Started    then "STARTED"
      when AI::ReportStateType::Inprogress then "INPROGRESS"
      when AI::ReportStateType::Complete   then "COMPLETE"
      else
        raise Exception.new("unknown enum value for 'ReportStateType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AI::ReportStateType?
      case key
      when "STARTED"    then AI::ReportStateType::Started
      when "INPROGRESS" then AI::ReportStateType::Inprogress
      when "COMPLETE"   then AI::ReportStateType::Complete
      else
        nil
      end
    end
  end
end
