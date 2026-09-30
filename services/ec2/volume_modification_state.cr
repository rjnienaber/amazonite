private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum VolumeModificationState
    Modifying
    Optimizing
    Completed
    Failed

    def self.to_json(e : VolumeModificationState, json : JSON::Builder) : Nil
      value = case e
              when AEC::VolumeModificationState::Modifying  then "modifying"
              when AEC::VolumeModificationState::Optimizing then "optimizing"
              when AEC::VolumeModificationState::Completed  then "completed"
              when AEC::VolumeModificationState::Failed     then "failed"
              else
                raise Exception.new("unknown enum value for 'VolumeModificationState' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::VolumeModificationState
      value = pull.read_string
      case value
      when "modifying"  then AEC::VolumeModificationState::Modifying
      when "optimizing" then AEC::VolumeModificationState::Optimizing
      when "completed"  then AEC::VolumeModificationState::Completed
      when "failed"     then AEC::VolumeModificationState::Failed
      else
        raise Exception.new("unknown enum value for 'VolumeModificationState' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::VolumeModificationState::Modifying  then "modifying"
      when AEC::VolumeModificationState::Optimizing then "optimizing"
      when AEC::VolumeModificationState::Completed  then "completed"
      when AEC::VolumeModificationState::Failed     then "failed"
      else
        raise Exception.new("unknown enum value for 'VolumeModificationState' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::VolumeModificationState?
      case key
      when "modifying"  then AEC::VolumeModificationState::Modifying
      when "optimizing" then AEC::VolumeModificationState::Optimizing
      when "completed"  then AEC::VolumeModificationState::Completed
      when "failed"     then AEC::VolumeModificationState::Failed
      else
        nil
      end
    end
  end
end
