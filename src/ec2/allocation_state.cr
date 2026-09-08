private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum AllocationState
    Available
    UnderAssessment
    PermanentFailure
    Released
    ReleasedPermanentFailure
    Pending
    Configuring

    def self.to_json(e : AllocationState, json : JSON::Builder) : Nil
      value = case e
              when AEC::AllocationState::Available                then "available"
              when AEC::AllocationState::UnderAssessment          then "under-assessment"
              when AEC::AllocationState::PermanentFailure         then "permanent-failure"
              when AEC::AllocationState::Released                 then "released"
              when AEC::AllocationState::ReleasedPermanentFailure then "released-permanent-failure"
              when AEC::AllocationState::Pending                  then "pending"
              when AEC::AllocationState::Configuring              then "configuring"
              else
                raise Exception.new("unknown enum value for 'AllocationState' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::AllocationState
      value = pull.read_string
      case value
      when "available"                  then AEC::AllocationState::Available
      when "under-assessment"           then AEC::AllocationState::UnderAssessment
      when "permanent-failure"          then AEC::AllocationState::PermanentFailure
      when "released"                   then AEC::AllocationState::Released
      when "released-permanent-failure" then AEC::AllocationState::ReleasedPermanentFailure
      when "pending"                    then AEC::AllocationState::Pending
      when "configuring"                then AEC::AllocationState::Configuring
      else
        raise Exception.new("unknown enum value for 'AllocationState' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::AllocationState::Available                then "available"
      when AEC::AllocationState::UnderAssessment          then "under-assessment"
      when AEC::AllocationState::PermanentFailure         then "permanent-failure"
      when AEC::AllocationState::Released                 then "released"
      when AEC::AllocationState::ReleasedPermanentFailure then "released-permanent-failure"
      when AEC::AllocationState::Pending                  then "pending"
      when AEC::AllocationState::Configuring              then "configuring"
      else
        raise Exception.new("unknown enum value for 'AllocationState' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::AllocationState?
      case key
      when "available"                  then AEC::AllocationState::Available
      when "under-assessment"           then AEC::AllocationState::UnderAssessment
      when "permanent-failure"          then AEC::AllocationState::PermanentFailure
      when "released"                   then AEC::AllocationState::Released
      when "released-permanent-failure" then AEC::AllocationState::ReleasedPermanentFailure
      when "pending"                    then AEC::AllocationState::Pending
      when "configuring"                then AEC::AllocationState::Configuring
      else
        nil
      end
    end
  end
end
