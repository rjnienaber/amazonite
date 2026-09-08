private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum AnalysisStatus
    Running
    Succeeded
    Failed

    def self.to_json(e : AnalysisStatus, json : JSON::Builder) : Nil
      value = case e
              when AEC::AnalysisStatus::Running   then "running"
              when AEC::AnalysisStatus::Succeeded then "succeeded"
              when AEC::AnalysisStatus::Failed    then "failed"
              else
                raise Exception.new("unknown enum value for 'AnalysisStatus' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::AnalysisStatus
      value = pull.read_string
      case value
      when "running"   then AEC::AnalysisStatus::Running
      when "succeeded" then AEC::AnalysisStatus::Succeeded
      when "failed"    then AEC::AnalysisStatus::Failed
      else
        raise Exception.new("unknown enum value for 'AnalysisStatus' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::AnalysisStatus::Running   then "running"
      when AEC::AnalysisStatus::Succeeded then "succeeded"
      when AEC::AnalysisStatus::Failed    then "failed"
      else
        raise Exception.new("unknown enum value for 'AnalysisStatus' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::AnalysisStatus?
      case key
      when "running"   then AEC::AnalysisStatus::Running
      when "succeeded" then AEC::AnalysisStatus::Succeeded
      when "failed"    then AEC::AnalysisStatus::Failed
      else
        nil
      end
    end
  end
end
